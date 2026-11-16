# Medium delay line placement — GF180 7-track
set lib   gf180mcu_fd_sc_mcu7t5v0
set pitch 17.36
set x0    1.12
set row1  3.92   ;# delay cells (normal)
set row2  0.00   ;# flip-flops (flipped)

proc um {v} { return [format %.2fum $v] }

proc put {cell x y {flip 0} {name ""}} {
    box position [um $x] [um $y]
    getcell $cell
    if {$flip} { upsidedown }
    if {$name ne ""} { identify $name }
}

# clear anything already in the cell
box [um -5] [um -5] [um 400] [um 20]
select area
delete

# left endcaps
put ${lib}__endcap 0 $row1
put ${lib}__endcap 0 $row2 1

# 16 columns
for {set i 0} {$i < 16} {incr i} {
    set x [expr {$x0 + $i*$pitch}]
    put ${lib}__dlyc_1  $x                    $row1 0 dly$i
    put ${lib}__filltie [expr {$x + 14.00}]   $row1
    put ${lib}__filltie [expr {$x + 15.12}]   $row1
    put ${lib}__filltie [expr {$x + 16.24}]   $row1
    put ${lib}__dffq_1  $x                    $row2 1 ff$i
    put ${lib}__filltie [expr {$x + 16.24}]   $row2 1
}

# right endcaps
set xe [expr {$x0 + 16*$pitch}]
put ${lib}__endcap $xe $row1
put ${lib}__endcap $xe $row2 1

select clear
view
save medium_line
