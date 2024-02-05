---
tags:
- coding
- vhdl
- intel
- altera
- sdc
---
# SDC Constraints

![](img/intel_fpga.svg){.center width="40%"}

- [Intel SDC Constraint Manual]({{base_repo_file}}/docs/coding/vhdl/docs/intel_sdc_manual.pdf)

## Comment

``` tcl
# This is a comment
```

## New line

No character allowed after newline `\\`

```
command_part_1 \\
command_part_2
```

## Netlist Terminology

| Term   | Definition                  |
|--------|-----------------------------|
| Cell   | Device building block       |
| Pin    | I/O of cells (not FPGA I/O) |
| Net    | Connection between Ports    |
| Port   | Top-level I/O               |
