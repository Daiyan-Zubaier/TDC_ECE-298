# Only clk is a CTS clock. Measurement delay lines must never be balanced.
set tdc_pnr_only 1
source [file join [file dirname [info script]] tdc.sdc]
