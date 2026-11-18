proc um {v} { return [format %.3fum $v] }
proc r {layer x1 y1 x2 y2} {
    box [um $x1] [um $y1] [um $x2] [um $y2]
    paint $layer
}
set pitch 17.36
for {set i 0} {$i < 9} {incr i} {
    set X [expr {1.12 + $i*$pitch}]      ;# this column's left edge
    set N [expr {$X + $pitch}]           ;# next column's left edge

    # ---------- metal first ----------
    # slow row: pads on I and Z, chain to next column's I
    r metal2 [expr {$X+1.62}]  9.03 [expr {$X+2.16}]  9.45
    r metal2 [expr {$X+7.835}] 9.03 [expr {$X+8.375}] 9.45
    if {$i < 8} { r metal2 [expr {$X+7.835}] 9.03 [expr {$N+2.16}] 9.45 }

    # CLK tap: down from slow Z, left, down onto CLK
    r metal2 [expr {$X+7.895}] 6.40 [expr {$X+8.315}] 9.45
    r metal2 [expr {$X+0.86}]  6.40 [expr {$X+8.315}] 6.82
    r metal2 [expr {$X+0.86}]  5.61 [expr {$X+1.28}]  6.82

    # fast row: pads on I and Z (+ metal1 patch on narrow Z), chain
    r metal2 [expr {$X+1.32}]  1.19 [expr {$X+1.86}]  1.61
    r metal1 [expr {$X+5.625}] 1.19 [expr {$X+6.045}] 1.61
    r metal2 [expr {$X+5.565}] 1.19 [expr {$X+6.105}] 1.61
    if {$i < 8} { r metal2 [expr {$X+5.565}] 1.19 [expr {$N+1.86}] 1.61 }

    # D tap: up from fast Z, left onto D
    r metal2 [expr {$X+5.625}] 1.19 [expr {$X+6.045}] 5.55
    r metal2 [expr {$X+4.50}]  5.13 [expr {$X+6.045}] 5.55

    # ---------- then vias ----------
    r m2contact [expr {$X+1.70}]  9.05 [expr {$X+2.08}]  9.43   ;# slow I
    r m2contact [expr {$X+7.915}] 9.05 [expr {$X+8.295}] 9.43   ;# slow Z
    r m2contact [expr {$X+0.88}]  5.69 [expr {$X+1.26}]  6.07   ;# ff CLK
    r m2contact [expr {$X+1.40}]  1.21 [expr {$X+1.78}]  1.59   ;# fast I
    r m2contact [expr {$X+5.645}] 1.21 [expr {$X+6.025}] 1.59   ;# fast Z
    r m2contact [expr {$X+4.58}]  5.15 [expr {$X+4.96}]  5.53   ;# ff D
}
save fine_line
