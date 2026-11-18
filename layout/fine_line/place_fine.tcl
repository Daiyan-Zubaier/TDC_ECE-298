# Fine (Vernier) line placement — GF180 7-track, 9 columns × 3 rows
set lib   gf180mcu_fd_sc_mcu7t5v0
set pitch 17.36           ;# same as medium: dffq_1 16.24 + 1 tie
set x0    1.12            ;# first column starts after the left endcap
set yfast 0.00            ;# CHANGED: 3 rows now
set yff   3.92            ;#   flip-flops in the middle (flipped)
set yslow 7.84

proc um {v} { return [format %.2fum $v] }

proc put {cell x y {flip 0} {name ""}} {
    box position [um $x] [um $y]
    getcell $cell
    if {$flip} { upsidedown }
    if {$name ne ""} { identify $name }
}

# NEW: place n tie cells in a row starting at x
proc ties {x y n {flip 0}} {
    global lib
    for {set k 0} {$k < $n} {incr k} {
        put ${lib}__filltie [expr {$x + $k*1.12}] $y $flip
    }
}

# clear anything already in THIS cell
box [um -5] [um -5] [um 200] [um 20]
select area
delete

# left endcaps — CHANGED: one per row, 3 rows
put ${lib}__endcap 0 $yfast
put ${lib}__endcap 0 $yff 1
put ${lib}__endcap 0 $yslow

# 9 columns — CHANGED
for {set i 0} {$i < 9} {incr i} {
    set x [expr {$x0 + $i*$pitch}]
    # top row: slow cell + 7 ties
    put ${lib}__dlya_4 $x $yslow 0 slow$i
    ties [expr {$x + 9.52}] $yslow 7
    # middle row: flip-flop (flipped) + 1 tie
    put ${lib}__dffq_1 $x $yff 1 ff$i
    ties [expr {$x + 16.24}] $yff 1 1
    # bottom row: fast cell + 10 ties
    put ${lib}__dlya_1 $x $yfast 0 fast$i
    ties [expr {$x + 6.16}] $yfast 10
}

# right endcaps
set xe [expr {$x0 + 9*$pitch}]
put ${lib}__endcap $xe $yfast
put ${lib}__endcap $xe $yff 1
put ${lib}__endcap $xe $yslow

select clear
view
save fine_line
