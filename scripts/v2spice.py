#!/usr/bin/env python3
"""
Convert a Yosys gate-level netlist (from `write_verilog -noattr`) into a SPICE
.subckt that ngspice/xschem can use with the GF180 standard-cell library.

Usage:
  python3 v2spice.py <netlist.v> <cells.spice> <top_module> <out.spice>

Power connections in the output:
  VDD, VNW (n-well)  -> VDD
  VSS, VPW (p-well)  -> VSS
Bus bits are renamed therm[3] -> therm_3 so SPICE is happy with the names.
"""
import re
import sys

POWER = {"VDD": "VDD", "VNW": "VDD", "VSS": "VSS", "VPW": "VSS"}
NAME = r"(?:\\\S+|[A-Za-z_][A-Za-z0-9_$]*)"


def read_cell_pins(spice_path):
    """Return {cell_name: [pin, pin, ...]} from the PDK SPICE file."""
    cells, text = {}, open(spice_path).read()
    # join continuation lines ("+ ...")
    text = re.sub(r"\n\+", " ", text)
    for line in text.splitlines():
        parts = line.split()
        if len(parts) >= 2 and parts[0].lower() == ".subckt":
            pins = [p for p in parts[2:] if "=" not in p]  # drop params like w=1u
            cells[parts[1]] = pins
    return cells


def clean_name(n):
    return n[1:] if n.startswith("\\") else n


def bit_name(name, idx=None):
    name = clean_name(name).replace("[", "_").replace("]", "").replace(".", "_")
    return name if idx is None else f"{name}_{idx}"


def parse_netlist(path, top):
    src = open(path).read()
    src = re.sub(r"//.*", "", src)
    src = re.sub(r"/\*.*?\*/", "", src, flags=re.S)
    m = re.search(r"\bmodule\s+" + re.escape(top) + r"\s*\((.*?)\)\s*;(.*?)\bendmodule", src, re.S)
    if not m:
        sys.exit(f"Could not find module {top} in {path}")
    header, body = m.group(1), m.group(2)
    port_order = [clean_name(p.strip()) for p in header.split(",") if p.strip()]

    widths, dirs = {}, {}
    for kind, rng, names in re.findall(
            r"\b(input|output|inout|wire|reg)\s*(\[\s*\d+\s*:\s*\d+\s*\])?\s*([^;]+);", body):
        for n in names.split(","):
            n = clean_name(n.strip())
            if not n:
                continue
            if rng:
                hi, lo = map(int, re.findall(r"\d+", rng))
                widths[n] = (hi, lo)
            else:
                widths.setdefault(n, None)
            if kind in ("input", "output", "inout"):
                dirs[n] = kind
    return port_order, widths, dirs, body


def expand(expr, widths):
    """Turn a Verilog expression into a list of bit nets, MSB first."""
    expr = expr.strip()
    if not expr:
        return []
    if expr.startswith("{"):
        inner, items, depth, cur = expr[1:-1], [], 0, ""
        for ch in inner:
            if ch == "{":
                depth += 1
            if ch == "}":
                depth -= 1
            if ch == "," and depth == 0:
                items.append(cur)
                cur = ""
            else:
                cur += ch
        items.append(cur)
        out = []
        for it in items:
            out += expand(it, widths)
        return out
    c = re.fullmatch(r"(\d+)'([bhd])([0-9a-fA-FxXzZ_]+)", expr)
    if c:
        w, base, val = int(c.group(1)), c.group(2), c.group(3).replace("_", "")
        v = int(val, {"b": 2, "h": 16, "d": 10}[base]) if not re.search("[xXzZ]", val) else 0
        return ["VDD" if (v >> i) & 1 else "VSS" for i in reversed(range(w))]
    s = re.fullmatch(r"(" + NAME + r")\s*\[\s*(\d+)\s*:\s*(\d+)\s*\]", expr)
    if s:
        n, hi, lo = clean_name(s.group(1)), int(s.group(2)), int(s.group(3))
        step = -1 if hi >= lo else 1
        return [bit_name(n, i) for i in range(hi, lo + step, step)]
    b = re.fullmatch(r"(" + NAME + r")\s*\[\s*(\d+)\s*\]", expr)
    if b:
        return [bit_name(clean_name(b.group(1)), int(b.group(2)))]
    n = clean_name(expr)
    w = widths.get(n)
    if w:
        hi, lo = w
        step = -1 if hi >= lo else 1
        return [bit_name(n, i) for i in range(hi, lo + step, step)]
    return [bit_name(n)]


def main():
    if len(sys.argv) != 5:
        sys.exit(__doc__)
    netlist, cells_spice, top, out_path = sys.argv[1:]
    cell_pins = read_cell_pins(cells_spice)
    port_order, widths, dirs, body = parse_netlist(netlist, top)

    # --- assigns become "these nets are the same wire" (union-find) ---
    parent = {}

    def find(x):
        parent.setdefault(x, x)
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    port_bits = set()
    for p in port_order:
        port_bits.update(expand(p, widths))

    def union(a, b):
        ra, rb = find(a), find(b)
        if ra == rb:
            return
        # keep power rails and port names as the visible name
        rank = lambda r: 2 if r in ("VDD", "VSS") else (1 if r in port_bits else 0)
        if rank(rb) > rank(ra):
            ra, rb = rb, ra
        parent[rb] = ra

    for lhs, rhs in re.findall(r"\bassign\s+(.*?)\s*=\s*(.*?)\s*;", body, re.S):
        L, R = expand(lhs, widths), expand(rhs, widths)
        if len(L) != len(R):
            sys.exit(f"Width mismatch in: assign {lhs} = {rhs}")
        for a, b in zip(L, R):
            union(a, b)

    # --- cell instances ---
    inst_re = re.compile(r"(" + NAME + r")\s+(" + NAME + r")\s*\((\s*\..*?)\)\s*;", re.S)
    lines, problems, counts = [], [], {}
    for cell, inst, conns in inst_re.findall(body):
        cell = clean_name(cell)
        if cell not in cell_pins:
            problems.append(f"cell {cell} (instance {inst}) not found in {cells_spice}")
            continue
        pinmap = {}
        for pin, expr in re.findall(r"\.(\w+)\s*\(\s*(.*?)\s*\)\s*(?=,|$)", conns.strip(), re.S):
            bits = expand(expr, widths) if expr else []
            if len(bits) > 1:
                problems.append(f"{inst}.{pin} is connected to more than one bit: {expr}")
            pinmap[pin] = find(bits[0]) if bits else None
        nets = []
        for pin in cell_pins[cell]:
            if pin in POWER:
                nets.append(POWER[pin])
            elif pin in pinmap and pinmap[pin]:
                nets.append(pinmap[pin])
            else:
                nets.append(f"NC_{bit_name(inst)}_{pin}")  # unconnected pin
        counts[cell] = counts.get(cell, 0) + 1
        lines.append(f"X{bit_name(inst)} {' '.join(nets)} {cell}")

    # --- subckt pins: every port bit, LSB first, then power ---
    sub_pins = []
    for p in port_order:
        bits = expand(p, widths)
        sub_pins += list(reversed(bits))  # LSB first: therm_0, therm_1, ...

    # ports that were merged into another net need a tiny resistor link
    links = []
    for b in sub_pins:
        r = find(b)
        if r != b:
            links.append(f"R_{b} {b} {r} 0.001")

    with open(out_path, "w") as f:
        f.write(f"* {top}: generated from {netlist} by v2spice.py\n")
        f.write(f"* Pin order: {' '.join(sub_pins)} VDD VSS\n")
        f.write(f".subckt {top} {' '.join(sub_pins)} VDD VSS\n")
        for l in lines:
            f.write(l + "\n")
        for l in links:
            f.write(l + "\n")
        f.write(f".ends {top}\n")

    print(f"Wrote {out_path}")
    print(f"  {len(lines)} cell instances: " +
          ", ".join(f"{n}x {c.split('__')[-1]}" for c, n in sorted(counts.items())))
    print(f"  Subckt pins (in order): {' '.join(sub_pins)} VDD VSS")
    if problems:
        print("PROBLEMS:")
        for p in problems:
            print("  " + p)
        sys.exit(1)


if __name__ == "__main__":
    main()
