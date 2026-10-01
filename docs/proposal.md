# Three Stage Time to Digital Converter Proposal

**Team:** Daiyan and Elisa  
**Target shuttle:** Tiny Tapeout GF26c  
**Date:** October 1, 2026

## 1 Statement of purpose

We propose to design a time-to-digital converter (TDC) that measures the interval between the rising edges of external START and STOP signals. Our target is approximately **200 ps resolution** over a measurement range extending to **5 µs**, with a 16-bit result read through an 8-bit multiplexed output bus.

The design will combine three measurement scales: an 8-bit reference-clock counter, a medium tapped delay line built from PDK standard cells, and a fine Vernier delay line using custom delay cells. We will implement the control, encoding, arithmetic, and readout in Verilog, and characterize the timing-sensitive circuits through transistor-level and extracted-layout simulation. The baseline design will operate without a DLL. A dual delay-locked loop (DLL) is an optional extension if the baseline passes verification with sufficient time and area remaining.

GF26c is the intended shuttle, using the **GlobalFoundries GF180MCU** process family. We will use its required PDK and cell library. Our initial area objective is one allocated tile, subject to an early floorplan and confirmation of the custom-macro submission flow. [1]

## 2 System diagram and operation

//TODO

### Coarse timing and asynchronous event capture

The shared 8-bit counter runs continuously from the reference clock. Each endpoint captures a coarse timestamp and its position within the corresponding clock period. We will use a registered Gray-coded count or an equivalent coherent capture scheme, together with explicit coarse/fraction alignment. Gray coding alone does not resolve which clock cycle contains an event at the boundary.

Let N be the difference between the corrected coarse timestamps. Each φ term is the elapsed time from that event's preceding reference edge. The interval is:

$$
T = N T_{clk} + \phi_{STOP} - \phi_{START}
$$

This endpoint subtraction accounts for the two asynchronous phases relative to the reference clock. Simply synchronizing both edges before starting and stopping a counter would discard their sub-clock timing. Synchronizers will be used for captured-data handshakes and control; the timing front end must preserve the original edges. [2]

### Medium tapped delay line

The medium stage divides a nominal reference period into 16 timing regions. Sampling its taps produces a thermometer pattern whose transition position is converted to a 4-bit medium code. Launch/reset logic must ensure a single usable transition per capture window, or explicitly account for launch polarity; an untreated periodic square wave must not be assumed to produce a simple thermometer pattern. We will instantiate supported PDK delay cells explicitly and use placement constraints to retain the intended chain. A medium interval may require several cells; it is not necessarily the delay of one library cell.

The exact cell count will follow characterization at the shuttle's voltage, loading, input slew, and process corners. Published PDK delay values are characterized operating points, not fixed delays that hold for every implementation. [3]

### Residue generation and fine Vernier conversion

The fine stage measures the time remaining inside the selected medium region. For each endpoint, a **residue generator** must produce two physical edges separated by that residual interval. A thermometer encoder alone does not produce those edges. The circuit must preserve or delay the relevant event and tap edges long enough for selection, with matched path delays and verified timing at region boundaries.

The earlier residue edge enters the slower Vernier line and the later edge enters the faster line. Sampling at corresponding taps identifies where the faster edge catches the slower one. A thermometer-to-binary encoder then produces the fine code. The nominal resolution is the **difference** between the two per-stage delays:

$$
T_{fine} = \tau_{slow} - \tau_{fast} > 0
$$

We will target 16 fine bins per medium interval. This requires approximately 16 effective comparison stages per endpoint, plus any guard stages justified by corner simulations. The encoder must distinguish a valid end bin from no catch-up or over-range; physical tap count and 4-bit output width are not interchangeable. [2]

Custom fine cells will be designed and simulated at transistor level, laid out, checked with DRC and LVS, and characterized after parasitic extraction. The initial cell will use fixed sizing or a defined static bias. A voltage-controlled variant can support the DLL extension. Verilog delay statements are suitable for behavioral models, but do not implement a physical delay cell in silicon.

### Thermometer encoding and result assembly

The medium and fine encoders will include a defined response to all-zero, all-one, and isolated bubble patterns. Invalid patterns will raise ERROR instead of silently producing a plausible measurement. Bubble handling will be verified separately from metastability settling; an encoder cannot eliminate metastability by itself. [4]

The arithmetic block subtracts the two endpoint timestamps and handles borrow, carry, and counter wrap before latching the result. Wider internal arithmetic prevents intermediate overflow. If STOP has not arrived after approximately 128 reference periods, a watchdog ends the transaction with ERROR, well before the 256-period wrap becomes ambiguous. A separate conversion watchdog will use a bound established by timing simulation. The output fields describe the **normalized interval**, not a direct concatenation of one endpoint's raw tap codes.

## 3 IO pin assignment and readout

These are logical Tiny Tapeout project ports. Board connector and package pin numbers depend on the GF26c hardware. The `uio` pins have separate `uio_in`, `uio_out`, and `uio_oe` signals inside the RTL wrapper. [5]

| Tiny Tapeout port | Direction | Signal | Proposed behavior |
| --- | --- | --- | --- |
| `ui_in[0]` | Input | START | Rising edge begins a measurement when ready. |
| `ui_in[1]` | Input | STOP | First eligible rising edge ends the interval. |
| `ui_in[2]` | Input | BYTE_SEL | 0 selects the low byte; 1 selects the high byte. |
| `ui_in[7:3]` | Input | Reserved | Ignored in the baseline; drive low in the test setup. |
| `uo_out[7:0]` | Output | DATA | Selected byte of the latched result. |
| `uio_out[0]` | Output | DONE | High when a transaction has completed; check ERROR before using DATA. |
| `uio_out[1]` | Output | BUSY | High while an interval or its conversion is in progress. |
| `uio_out[2]` | Output | ERROR | Added status bit for timeout, overflow, or detected invalid conversion. |
| `uio[7:3]` | Reserved | Calibration and debug | High impedance in the baseline; any later assignment must be documented. |
| `clk` | Input | Reference clock | Proposed nominal frequency of 20 MHz. |
| `rst_n` | Input | Reset | Active low; clears control, result, and status. |
| `ena` | Input from harness | Project enable | Tiny Tapeout selection signal; not an extra user control pin. |

In the enabled baseline, `uio_oe = 8'b00000111`: DONE, BUSY, and ERROR are outputs. Unused `uio_out[7:3]` values are tied low and their output enables are zero. The unused pins are therefore reserved inputs or high impedance externally, not floating internal outputs.

### Measurement and readout sequence

1. Apply a stable reference clock and reset. Deassert reset in a controlled manner; wait for the timing front end to settle. START and STOP should initially be low.
2. Present a START rising edge while ready. It clears DONE and ERROR, captures the start timestamp, and asserts BUSY. The capture front end must also preserve a closely following STOP before the synchronized controller sees START.
3. The first STOP after the accepted START captures the stop timestamp. Further START edges while BUSY and STOP edges after the first accepted STOP are ignored.
4. Once both endpoint conversions and arithmetic complete, the result is latched atomically, BUSY goes low, and DONE goes high. DONE remains high until the next accepted START or reset. A failed transaction also completes with DONE high and ERROR high; DATA must then be ignored.
5. Read BYTE_SEL = 0 for the low byte, then BYTE_SEL = 1 for the high byte. Allow the characterized select-to-data propagation time after each change. Combine the bytes as `R = (high_byte << 8) | low_byte`. Do not start another transaction between the two reads.

The result register remains stable through both reads and until a later transaction completes or reset occurs. STOP before START is ignored. Exact coincidence and the minimum distinguishable input separation will be characterized rather than assumed from the nominal bin width.

## 4 Proposed specifications

The values below are design targets. Resolution and timing range will be supported by simulation and characterization, rather than claimed as measured silicon performance before fabrication.

| Parameter | Proposed specification |
| --- | --- |
| Measurement | One positive START-to-STOP interval per transaction; rising edges. |
| Resolution target | Approximately 200 ps nominal bin width; 195.3125 ps ideal allocation at 20 MHz. |
| Required range | Valid intervals through 5 µs; minimum measurable separation to be established by front-end simulation. |
| Reference clock | 20 MHz nominal, externally supplied; 50 ns period. |
| Coarse stage | 8-bit counter; 256 periods give a theoretical 12.8 µs wrap interval. |
| Medium stage | 4-bit code, 16 nominal regions per reference period; 3.125 ns per region. |
| Fine stage | 4-bit code, 16 nominal bins per medium region; custom Vernier delay cells. |
| Result and interface | 16-bit latched interval result; 8-bit data bus and one byte-select bit. |
| Conversion rate | Single transaction at a time; conversion latency and re-arm time will be characterized. |
| Accuracy and precision | Report offset, gain error, RMS repeatability, DNL, and INL separately; no ±200 ps accuracy claim. |
| Physical target | GF26c using its GF180MCU flow; one allocated tile as an initial area objective. |
| Baseline calibration | Characterize bin widths and channel skew; do not assume uniform bins or automatic PVT tracking. |
| Stretch goal | Dual DLL controlling the fast and slow fine delay paths. |

### Timing allocation and 16 bit format

We propose 20 MHz to make the 8/4/4 allocation internally consistent with the resolution target:

$$
T_{clk}=50\,\text{ns},\qquad T_{medium}=\frac{T_{clk}}{16}=3.125\,\text{ns}
$$

$$
T_{fine}=\frac{T_{medium}}{16}=195.3125\,\text{ps}\approx200\,\text{ps}
$$

The 16-bit result is named **R** to avoid using M for both the complete word and its medium field.

| Field | Bits | Meaning after interval normalization |
| --- | --- | --- |
| C | `R[15:8]` | Complete reference-clock periods. |
| M | `R[7:4]` | Medium intervals remaining after the coarse contribution. |
| F | `R[3:0]` | Fine intervals remaining after the medium contribution. |

The nominal decoded interval is:

$$
T_{nom}=C T_{clk}+M T_{medium}+F T_{fine}
$$

Under the ideal radix relationships, `R = 256C + 16M + F`, so `T_nom = R × 195.3125 ps`. For example, C = 20, M = 3, F = 8 gives R = `0x1438` and a nominal interval of **1.0109375 µs**. BYTE_SEL = 0 returns `0x38`; BYTE_SEL = 1 returns `0x14`.

The 5 µs endpoint requires only 100 reference periods, leaving headroom below the 256-period wrap. The theoretical largest 16-bit nominal value is 12.7998046875 µs; performance above 5 µs is outside the initial validation requirement. Approximately 25,000 bins span 5 µs at 200 ps, so the range and resolution require about 15 useful bits, not 16 bits of demonstrated accuracy.

These ratios are an ideal timing budget. A fixed PDK chain is not automatically locked to the clock, and a fine-cell delay difference is not automatically one sixteenth of a medium bin. The physical design must provide complete coverage at the supported corners, with guard taps or trimming if needed. Changing the reference clock also changes the timing budget and requires recharacterization.

Calibration should operate on both endpoint measurements before subtraction. A lookup table indexed only by the final difference can lose the information needed to correct nonuniform endpoint bins. If on-chip correction is too costly, a documented debug mode will expose both raw endpoint codes for host-side characterization; the baseline DATA result will remain a nominal interval code.

### Verification and completion criteria

- **Functional correctness:** Check reset, first-STOP capture, ignored extra events, timeout, ERROR, counter wrap, borrow/carry, and stable two-byte readout with a self-checking RTL testbench.
- **Timing coverage:** Sweep both event phases relative to the reference clock, including every medium boundary, the fine catch-up limit, coarse rollovers, and intervals approaching 5 µs. Verify that no valid region is silently uncovered.
- **Delay-cell performance:** Run transistor-level and extracted simulations across supported process, voltage, and temperature conditions. Check that the slow path remains slower than the fast path and that fine coverage spans the largest medium residue. Include mismatch analysis where models support it.
- **Measurement quality:** Use interval sweeps and code-density tests to estimate bin widths, missing codes, differential nonlinearity (DNL), and integral nonlinearity (INL). Repeat fixed intervals to estimate RMS precision. These assess different properties from the nominal code step. [4]
- **Physical completion:** Produce clean DRC and LVS results, an accepted macro integration, digital timing signoff, extracted timing evidence, an area report, and a reproducible submission. RTL simulation alone cannot establish picosecond resolution.
- **External validation plan:** Use a common-source timing generator or calibrated delay setup with jitter comfortably below the target. Characterize differential START/STOP pad and routing delay; do not infer GF26c limits from electrical figures published for a different Tiny Tapeout process. [5]

### Optional dual DLL extension

The stretch goal is a pair of feedback loops that stabilize the slow and fast delay paths against PVT changes. Each analog DLL would need a phase detector, charge pump, loop filter, voltage-controlled delay line, and startup/lock detection. The two loops must enforce **different per-cell delays**; locking identical chains to identical total delays would remove the Vernier difference. A replica-chain or tap-ratio scheme will be chosen only after the required delay relationship is modeled. [6]

The DLL extension will proceed only after the baseline residue transfer, Vernier conversion, and preliminary layout work. Its minimum useful outcome is a verified simulation. It will enter the tapeout only if it meets the same layout and verification gates before design freeze. It does not automatically calibrate the medium PDK chain, and reserved digital debug pins do not provide analog bias access without a separate pin and flow decision.

## 5 Timeline for completion

This proposed eight-week schedule starts October 1, 2026, with a completion target of **November 25, 2026**. In the first week we will confirm the course deadline, GF26c submission cutoff, tile allocation, and custom-cell flow, then move the milestones earlier if required. Fabrication and returned-silicon testing are outside this design schedule.

| Week and dates | Work and completion milestone |
| --- | --- |
| 1 — Oct 1 to 7 | Freeze edge definitions, timing budget, pinout, and acceptance tests. Confirm area and shuttle flow. Build the behavioral model and a rough floorplan including both endpoint paths. |
| 2 — Oct 8 to 14 | Implement counter capture, controller, encoders, and readout RTL. Characterize candidate PDK cells. Demonstrate nominal coarse and medium conversion. |
| 3 — Oct 15 to 21 | Design the custom fast/slow cells and residue-transfer circuit. Simulate input slew, loading, and initial corners. Demonstrate coverage of one medium interval. |
| 4 — Oct 22 to 28 | Integrate both endpoint paths, timestamp subtraction, and boundary correction. Pass phase and interval sweeps in the timing model. Review area and architecture feasibility. |
| 5 — Oct 29 to Nov 4 | Complete custom-cell layout, DRC/LVS, extraction, and macro views. Run initial full-design integration and timing. Begin DLL simulation only if baseline gates pass. |
| 6 — Nov 5 to 11 | Complete placement and routing, extracted timing checks, corner sweeps, and measurement-quality analysis. Freeze baseline features. |
| 7 — Nov 12 to 18 | Resolve signoff failures and repeat affected regressions. Finalize test scripts, pin documentation, and submission files. Freeze the release candidate. |
| 8 — Nov 19 to 25 | Complete final review, demonstration, report, and submission. Retain time for submission-flow fixes; introduce no new timing architecture. |

**Scope decisions:** Week 1 must establish area and flow feasibility; Week 4 must demonstrate physical residue transfer and complete fine coverage. If either gate fails, we will review a reduced scope with the instructor, such as a coarse-plus-medium TDC, and report its achieved resolution against the original 200 ps target.

## 6 Who does what

The following is a proposed lead/support split. Both team members will understand the timing model, review interfaces, and participate in final verification.

| Workstream | Lead | Supporting responsibility |
| --- | --- | --- |
| Digital architecture and RTL | Daiyan | Elisa reviews timing assumptions and front-end interfaces. |
| Coarse capture, encoders, arithmetic, and byte readout | Daiyan | Elisa checks boundary behavior against the timing model. |
| PDK delay characterization, custom cells, and residue circuit | Elisa | Daiyan builds behavioral models and integration tests. |
| Custom layout, extraction, and macro integration | Elisa | Daiyan supports flow automation and top-level integration. |
| Functional verification and host readout scripts | Daiyan | Elisa supplies characterized delay and corner data. |
| Full-chip timing, measurement quality, and area review | Shared | Daiyan focuses on control/capture; Elisa focuses on physical timing. |
| Optional dual DLL | Elisa | Daiyan supports lock control, status, and verification. |
| Proposal, final report, and demonstration | Shared | Each documents owned blocks; both approve the release candidate. |

Weekly integration reviews will resolve timing and interface issues. Deliverables include RTL and tests, schematics and layout, extracted models, verification results, readout documentation, and the tapeout package.

## References

1. Tiny Tapeout, [GF180 Verilog submission template](https://github.com/TinyTapeout/ttgf-verilog-template) and [GF26c factory-test project](https://github.com/TinyTapeout/ttgf26c-factory-test). Process family and shuttle context.
2. G. S. Jovanović and M. K. Stojčev, [Vernier's Delay Line Time-to-Digital Converter](https://wwwusers.ts.infn.it/~rui/univ/Acquisizione_Dati/Lezioni/15%20-%20ADC%20and%20TDC/supplements/8-Vernier%27s%20Delay%20Line%20Time--to--Digital%20Converter.pdf), 2009. Vernier principle and counter interpolation.
3. GlobalFoundries, [GF180MCU DLYA standard-cell documentation](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/cells/dlya/gf180mcu_fd_sc_mcu9t5v0__dlya_1.html). Illustrative library cell; the actual shuttle-supported library must be selected.
4. Y. Hua and D. Chitnis, [A Highly Linear and Flexible FPGA-Based Time-to-Digital Converter](https://arxiv.org/html/2107.13053v4), 2021. Bubble errors, bin characterization, and measurement methodology; FPGA performance is not a prediction for this ASIC.
5. Tiny Tapeout, [GPIO interface specification](https://tinytapeout.com/specs/gpio/). Logical port structure; process-specific electrical values must be checked separately.
6. Y.-Q. Chen, L.-Y. Meng, and X.-G. Lin, [A Coarse-Fine Time-to-Digital Converter](https://pdfs.semanticscholar.org/e493/a21f20b5bd473f173650c3b261d778c67be3.pdf), ITM Web of Conferences 11, 08006, 2017. Three-stage architecture and dual DLL concept; its simulated performance is not a GF180 guarantee.

Online references checked October 1, 2026.
