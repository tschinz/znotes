---
tags:
- coding
- vhdl
- intel
- altera
- sdc
---
# SDC Usage

![](img/intel_fpga.svg){.center width="40%"}

## General

### Collections

To find certain Cells, Pins, Nets or Ports Collections, there are Wildcard enabled search commands.

``` tcl
get_clocks
get_registers
get_ports
get_pins
all_clocks
all_registers
all_input
all_output
```

### Priorities

- Priority Order
  - `set_false_path` & `set_clock_groups` **High Priority**
  - `set_max_delay` & `set_min_delay`
  - `set_multicycle_path`
  - `create_clock` & `create_generated_clock` **Low Priority**
- Sequential execution, last command will be executed if same priority
- `set_input_delay` and `set_output_delay` are in addition and will not be overwritten be other sdc commands

## Clock Constraints

Two possible clocks: Clocks & Generated Clocks

### Clock

Absolute or base clock (from Quartz internal or external)

```
create_clock [-name <clock_name>]                  \\ # clock name if not the same as signal_name
              -period <time_in_ns>                 \\ # period in ns or "frequence" e.g. "50mhz"
             [-waveform {<rise_time> <fall_time>}] \\ # Duty cycle if non 50%
             [<targets>]                           \\ # Target ports or pins for clock settings
             [-add]                                   # Add clock to node with existing clock
```

``` tcl
create_clock -name <sdc_clock_collection_name> -period <period_in_ns> [get_ports <design_signal_name_wildcard>]
create_clock -name ext_clk_50mhz -period 20.0 [get_ports ext_clk]
create_clock -period 10.0 -waveform {2.0 8.0} [get_ports clk_in]
create_clock -period 10MHz [get_ports clk_in]
create_clock -period "10 MHz" [get_ports clk_in]
```

### Generated Clock

Clocks derived from another clock (all other clocks) (PLL, clock divider, output clocks, ripple clocks)

```
create_generated_clock [-name <clock_name>]         \\ name in SDC namespace
                        -source <master_pin>        \\ clock derived by
                       [-master_clock <clock_name>] \\
                       [-divide_by <factor>]        \\ clock divided by x from source clock
                       [-multiply_by <factor>]      \\ clock multiplied by x from source clock
                       [-duty_cycle <percent>]      \\ clock duty cycle of himself
                       [-invert]                    \\ clock is inverted by himself
                       [-phase <degrees>]           \\ clock is phase shifted by himself
                       [-edges <edge_list>]         \\ edges only on certain edges from source
                       [<targets>]                  \\ generated clock pin/port
                       [-add]
```

``` tcl
create_generated_clock -name clk_div -source [get_ports CLK_IN] -divide_by 2 [get_pins inst|q]
create_generated_clock -name clk_div -source [get_ports inst|clk] -divide_by 2 [get_registers inst]
```

### Derive PLL clocks

```
derived_pll_clocks                       \\ # Altera specific for all PLL generated clocks
                   [-create_base_clocks] \\ # generate create_clock constants for PLL input clocks
                   [-use_net_name]          # use net names as clock names
# Substitute would be to create all generated clocks manually
```

Quartus can do the substitution automatically with the expand option enabled. No Altera specific commands used.

``` tcl
tcl: write_sdc -expand
```

### Automatic Clock Detection & Creation

Not to use for final design. Default clock used = 1GHz.

```
derive_clocks [-period <time_in_ns>]   # same use as with create_clock
              [-waveform {<rise_time> <fall_time>}] # same use as with create_clock
```

### FPGA Uncertainties (jitter, clock networks)

3 Types of uncertainties:

- Intra-clock transfer : Transfer within single clock domain within FPGA
- Inter-clock transfer : Transfer within different clock domains within FPGA
- I/O interface clock transfer : Transfer between I/O port and internal design registers

```
derive_clock_uncertainty              # Altera specific
                         [-overwrite] # overwrites any existing uncertainty constraints
                         [-add]       # adds derived uncertainty to existing constraints

# For Feedback clock, (feedback_clk_pcb = data_clk_pcb + data_pcb + $T_{co}\_ASSP$
set_clock_latency [-late]  # max clock latency in case of feedback clock
                  [-early] # min clock latency in case of feedback clock
                  <target> # [get_clocks feedback_clk_in]

set_clock_uncertainty [-setup | -hold]
                      [-fall_from <fall_from_clock>] # uncertainty added only on falling_edge from source clock
                      [-fall_to <fall_to_clock>]     # uncertainty added only on falling_edge from destination clock
                      [-from <from_clock>]           # uncertainty added to transfer within single clock domain
                      [-rise_from <rise_from_clock>] # uncertainty added only on rising_edge from source clock
                      [-rise_to <rise_to_clock>]     # uncertainty added only on rising_edge from destination clock
                      [-to <to_clock>]               # uncertainty added to transfer within single clock domain
                      <value>
```

### Virtual Clock example

``` tcl
create_clock -period 10 -name clk_in [get_ports {clk_in}]
create_clock -period 10 -name virt_clk_in
set_input_delay -clock [get_clocks {virt_clk_in}] -max 2 [get_ports {data_in}]
set_input_delay -clock [get_clocks {virt_clk_in}] -min 2 [get_ports {data_in}]
```

### Gated Clock

An AND enable on the clock can serve to eliminate power consumption. All flip-flops use no energy without clock. But it violates synchronous design rules. It also uses a new Global Clock path for the Gated Clock.

## Input Constraints

2 Types of Combinatorial Interfaces and Synchronous Inputs.

### Combinatorial (without FF)

Absolute maximum and minimum time between points. Signals traversing FPGA and internal signals

```
set_max_delay [-from <names>] \\
              [-to <names>]   \\
              [-through]      \\
              <delay>
set_min_delay [-from <names>] \\
              [-to <names>]   \\
              [-through]      \\
              <delay>
```

``` tcl
set_max_delay -from [get_ports in1] -to [get_ports out*] 5.0
set_max_delay -from [get_ports in2] -to [get_ports out*] 7.5
set_max_delay -from [get_ports in3] -to [get_ports out*] 9.0

set_min_delay -from [get_ports in1] -to [get_ports out*] 1.0
set_min_delay -from [get_ports in2] -to [get_ports out*] 2.0
set_min_delay -from [get_ports in3] -to [get_ports out*] 3.0
```

### Synchronous Inputs

Synchronous Inputs where one external clock is used between multiple devices.

```
set_input_delay [-max] \\ # max time to arrive and still meet Tsu (input setup time)
                [-min]    # min time to stay active and still meet Th (input hold time)
```

**Calculations**

$$ input\_delay\_max = Data\_trace_{max} - Board\_clock\_skew_{min} + T_{co_{max}} $$

$$ input\_delay\_min = Data\_trace_{min} - Boardclockskew_{max} + T_{co_{min}} $$

```
set_input_delay -clock <clock_name>        # Clock driving source (external)
                [-clock_fall]              # input signal was launched on falling edge
                [-rise | -fall]            # input delay value  is for rising or falling edge
                [-max | -min]              # must specify both max and min
                [-add_delay]               # multiple constraints on single input
                [-source_latency_included] #
                <delay_value>
                <targets>
```

## Source Synchronous

Source Synchronous Interfaces where the FPGA reads a clock which is used created by an other device. Clock and Data send at the same time.

- Single Data Rate (SDR)
- Doube Data Rate (DDR)
- Quatriple Data Rate (QDR)
- High Speed SPI4.2

### SDR

e.g. MII, SPI

#### Center Aligned Clock

Data transitions not in phase with clock, clock is in the middle of the data change. Can directly be used without shift.

#### Direct Clocking

``` tcl
# Virtual Clock which create the data on other device
create_clock -name virt_clk_in -period 8.000

# Received Clock but Center aligned which means 180° shifted (no phase command only waveform).
# Allows to shift clock by half a period
create_clock -name clk_in period 8.000 -waveform {4.0 8.0} [get_ports clk_in]
```

#### PLL Clocking

Add PLL clocking or DLL to add shift to have the same input delay between data and clock. Needed for High speed (>125MHz)

``` tcl
# Virtual Clock which create the data on other device
create_clock -name virt_clk_in -period 8.000

# Received Clock but Center aligned which means 180° shifted (no phase command only waveform).
# Allows to shift clock by half a period
create_clock -name clk_in -period 8.000 -waveform {4.0 8.0} [get_ports clk_in]

derive_pll_clocks
# or
create_generated_clocks -name int_clk -source [get_pins PLL|clk[0]]
```

#### Edge Aligned Clock

Data transitions at the same time at the clock. **Clock need to be shifted 180°**

**PLL Clocking**

Add PLL clocking or DLL to add shift to have the same input delay between data and clock. Needed for High speed (>125MHz)

``` tcl
# Virtual Clock which create the data on other device
create_clock -name virt_clk_in -period 8.000

# Received Clock Edge Aligned therefor no need to shift
create_clock -name clk_in -period 8.000 [get_ports clk_in]

derive_pll_clocks
# or
create_generated_clocks -name int_clk -source [get_pins PLL|clk[0]] -phase 180 [get_pins PLL_clk[0]]
```

### Data Input Constraints

#### $T_{co}$ relative to data

``` tcl
# create input delays
set in_max_dly [expr $data_tracemax + $tcomax - $clk_tracemin]
set in_max_dly [expr $data_tracemin + $tcomin - $clk_tracemax]

# input constraints
set_input_delay -max $in_max_dly -clock virt_clk_in [get_ports data_in]
set_input_delay -min $in_min_dly -clock virt_clk_in [get_ports data_in]
```

#### $T_{co}$ relative to input clock

``` tcl
# create input delays
set in_max_dly [expr $data_tracemax + $tco_datamax - $tco_clkmin - $clk_tracemin]
set in_max_dly [expr $data_tracemin + $tco_datamin - $tco_clkmax - $clk_tracemax]

# input constraints
set_input_delay -max $in_max_dly -clock virt_clk_in [get_ports data_in]
set_input_delay -min $in_min_dly -clock virt_clk_in [get_ports data_in]
```

## Output Constraints

### Synchronous Outputs

Synchronous Outputs where one external clock is used between multiple devices.

```
set_output_delay [-max] \\ # max time to arrive and still meet other devices Tsu (input setup time)
                 [-min]    # min time to stay active and still meet other devices Th (input hold time)
```

#### SO Calculations

$$ output_delay_max = Data\_[trace](){max} - Board_clock\_[skew](){min} +
[T](){su} output_delay_max = ([T](){data\_[pcb](){max}} + [T](){cl}) -
([T](){[clk2](){min}} - [T](){clk1\_[ext](){max}}) + [T](){su}
output_delay_min = Data\_[trace](){min} - Board_clock\_[skew](){max} +
[T](){h} output_delay_min = ([T](){data\_[pcb](){min}} + [T](){cl}) -
([T](){[clk2](){max}} - [T](){clk1_ext{min}}) + [T](){h} $$

```
set_output_delay -clock <clock_name>        # Clock driving source (external)
                [-clock_fall]              # input signal was launched on falling edge
                [-rise | -fall]            # input delay value  is for rising or falling edge
                [-max | -min]              # must specify both max and min
                [-add_delay]               # multiple constraints on single input
                [-source_latency_included] #
                <delay_value>
                <targets>
```

### Source Synchronous Outputs

Source Synchronous Outputs where the FPGA generates a clock which is used further in an other device. Clock and Data send at the same time.

- Single Data Rate (SDR)
- Doube Data Rate (DDR)
- Quatriple Data Rate (QDR)
- High Speed SPI4.2

```
set_output_delay [-max] \\ # max time to arrive and still meet other devices Tsu (input setup time)
                 [-min]    # min time to stay active and still meet other devices Th (input hold time)
```

#### SSO Calculations

$$ output_delay_max = Data\_[trace](){max} - Clock\_[trace](){min} +
[T](){su} output_delay_min = Data\_[trace](){min} -
Clock\_[trace](){max} + [T](){h} $$

```
set_output_delay -clock <clock_name>        # Clock driving source (external)
                [-clock_fall]              # input signal was launched on falling edge
                [-rise | -fall]            # input delay value  is for rising or falling edge
                [-max | -min]              # must specify both max and min
                [-add_delay]               # multiple constraints on single input
                [-source_latency_included] #
                <delay_value>
                <targets>
```

## False Path

2 Types of False Path:

- Logic-based: Not relevant circuit operation (static, quasi-static)
- Timing-based: Path intentionally not analysed (bridging async clock domain using synchronizer circuits)

2 Methods:

- `set_false_path`: disable timing analysation for a certain path or collection
- `set_clock_group`: don't look at clock domain crossing between one, or mor clocks

```
set_false_path [-fall_from <clocks>] # no analysis falling edge on launch clock
               [-rise_from <clocks>] # no analysis rising edge on launch clock
               [-from <names>]       # use specific source node
               [-through <names>]    #
               [-to <names>]         # use specific target node
               [-fall_to <clock>]    # no analysis falling edge on latch clock
               [-rise_to <clock>]    # no analysis rising edge on latch clock
               [-setup]              # no setup / recovery analysis
               [-hold]               # no hold / removal analysis

set_clock_groups [-asynchronous] # no phase relationship, but active at the same time
                 [-exclusive]    # clocks are not active at the same time (muxed)
```

### Asynchronous I/O constraints

Path to ignore by the Timing Analyzer.

```
set_false_path -from [get_ports ext_rst_n] # input
set_false_path -from [get_ports button*]   # input

set_false_path -to [get_ports led*]        # output
```

### Timing exceptions between clock domains

Path to ignore by the Timing Analyzer. Clock domain crossing if double FF synchronisation.

``` tcl
set_false_path -from [get_pins reg1|clk] -to [get_pins reg2|d]
```

### Synchronisation done through a dual-clock DC_FIFO

Path to ignore by the Timing Analyzer.

``` tcl
set_false_path -from [get_clocks ext_clk50mhz] -to [get_clocks {i_PLL|altpll_component|auto_generated|pll1| clk[0]}]
```

### Clock groups

**Muxed clocks**

``` tcl
# clocks are separate, no cross domain analyzation
set_clock_groups -exclusive -group {clk_100} -group {clk_66}

# same as
set_false_path -from {get_clocks clk_100} -to {get_clocks clk_66
set_false_path -from {get_clocks clk_66}  -to {get_clocks clk_100}
```

## Multicycle Paths

If a signal is slow and not sampled every clock edge. 2 Types possible:

- Clock enable signal not every time
  - Should be avoided and replaced by pipeline FlipFlops to cut logic path.
- 2 shifted clocks between 2 registers
  - TimeQuest can used the false Latch edge, Multicycle for correct this setting

How To:

- Determine Launch to Latch relationship
  - With help of the TimeQuest Waveforms
- Fix Setup (because Hold changes with setup)
- Fix Hold

Open Window

- start setup increment = edges before on source clock
- end setup increment = edge after on destination clock
- start hold increment = edges after on source clock
- end hold increment = edge before on destination clock

```
set_multicycle_path [-start | -end]      # start = change launch clock | end = change latch clock
                    [-setup | -hold]     # setup hold edge
                    [-fall_from <clock>]
                    [-rise_from <clock>]
                    [-from <names>]
                    [-through <names>]
                    [-to <names>]
                    [-fall_to <clocks>]
                    [-rise_to <clocks>]
                    <value>
```

```
# 2 cycles for signal (case clock enable)
set_multicycle_path -from {get_pins reg1|clk} -to {get_pins reg2|d} -setup 2
set_multicycle_path -from {get_pins reg1|clk} -to {get_pins reg2|d} -hold  1 # 1 + **1** clock before setup

# default 1 cycle signal (case clock enable)
set_multicycle_path -from {get_pins reg1|clk} -to {get_pins reg2|d} -setup 1
set_multicycle_path -from {get_pins reg1|clk} -to {get_pins reg2|d} -hold  0
```

```
# 2 cycles for signal (case shifted clock)
set_multicycle_path -from {get_pins reg1|clk} -to {get_pins reg2|d} -setup 2
set_multicycle_path -from {get_pins reg1|clk} -to {get_pins reg2|d} -hold  0 # 1 clock before setup
```
