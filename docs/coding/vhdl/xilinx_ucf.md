---
tags:
- coding
- vhdl
- amd
- xilinx
- ucf
---
# Xilinx UCF Constraints

![](img/xilinx.svg){.center width="40%"}

## How to Guide

This small guide indicates how to resolve most timing problems / constraints inside an FPGA. In fact, most problems with an FPGA timing occur because of three reasons:

- False paths
- Timing issues due to reading data from outside the FPGA with a clock
- Timing issues due to outputting data to another component from the FPGA with a clock.

### Problem A : false paths

A simple example for the first case is when you generate the TX line of an UART or when you consider interrupt lines in a uBlaze (for instance). In both cases, those signals arenot synchronous with respect to your clock. You must then indicate that those netsare to be ignored by timing checks. In order to do it, for Xilinx FPGA you must use the TIGconstraint (which stands for Timing IGnore). The only problem here is that you can't putthat constraint in your VHDL file but you have to put it in the UCF file. When you haveinternal signals, you require to use the complete path of the net (which can be found forexample by displaying the schematic of your design or with the report of the timing analyser).

An example of such a constraint for a UCF file is given here :

```
INST "broadenc_cpu_i/axi_intc_0/axi_intc_0/INTC_CORE_I/hw_intr_1" TNM = UBlaze_Interrupts;
INST "broadenc_cpu_i/axi_intc_0/axi_intc_0/INTC_CORE_I/hw_intr_2" TNM = UBlaze_Interrupts;
TIMESPEC TS_UBlaze_Interrupts = TO "UBlaze_Interrupts" TIG; ## We don't care of timing for interrupts
```

This creates a group for two signals and then use the TIG constraint to it. If your instance name is incorrect, the synthesis tool will complaint.

### Problem B : reading data from outside the FPGA

When you read synchronous data (i.e. with an incoming clock) in an FPGA, you must be sure that you respect setup and hold times in your input register. In order to do, a simple constraint like

```
OFFSET = IN 4 ns VALID 8 ns BEFORE "mb_vclk";
```

indicate that the data that are registered with the signal mb_vclk (which must be a constrained clock) must comply with a setup of 4 ns and a hold time of 4 ns. By doing it like this, you won't have any problem with source synchronous systems (in which the clock are transmitted from another device with the data).

### Problem C: outputting synchronous data correctly with an FPGA

When you generate data for another system in your FPGA and you also generate the clock for that system ( a global clock is not shared between all elements of the system (FPGA and device) for that bus), making sure that the data are aligned with the clock and are output with correct setup and hold times consist in putting the following constraint:

```
net "ve_vclk" TNM_NET = "vdata_out";
net "ve_vy<0>" TNM_NET = "vdata_out";
net "ve_vy<1>" TNM_NET = "vdata_out";
net "ve_vy<2>" TNM_NET = "vdata_out";
net "ve_vy<3>" TNM_NET = "vdata_out";
net "ve_vy<4>" TNM_NET = "vdata_out";
TIMEGRP "vdata_out" OFFSET = OUT AFTER "mb_vclk" REFERENCE_PIN "ve_vclk";
```

Those constraints have the following meaning : we group all the signals in a group "vdata_out". This group is generated with a clock (here mb_vclk, which remains inside the FPGA) and the clock for the whole group (which is output and constitues the reference for all the other signals) is ve_vclk. Note that this pin must be included in the group.

## Syntax

### Comment

``` tcl
# This is a comment
```

### I/O Pad Assigments

```
NET "out_sig_slow"    LOC = "S1" | SLEW = SLOW;
NET "out_sig_fast"    LOC = "S2" | SLEW = FAST;
NET "out_sig33"       LOC = "V1" | IOSTANDARD = LVCMOS33
NET "in_sig18"        LOC = "V2" | IOSTANDARD = LVCMOS18
NET "reset_n"         LOC = "P1" | PULLUP;
NET "button_Pullup"   LOC = "P2" | PULLUP;
NET "button_Pulldown" LOC = "P3" | PULLDOWN;
```

## Timing constraints

### Clock constraint (PERIOD)

Definition of a clock with a 50% duty cycle and it's frequency (40MHz)

```
NET "SYS_CLK" TNM_NET = "SYS_CLK";
TIMESPEC "tnm_name"   = PERIOD "sig_name" <Tcycle> HIGH <dutycycle>;
TIMESPEC "TS_SYS_CLK" = PERIOD "SYS_CLK" 25.000 ns HIGH 50.00%;
```

![Duty Cycle](img/ucf_period_duty_cycle.svg){.center}

### Time Group

Create timing group with particular net. This code defines a clk_net timing group associated with the CLK clock net and including all synchronous elements controlled by this net (since no qualifier has been specified).

```
NET "net_name" TNM_NET = qualifier "tnm_name";
NET "CLK"      TNM_NET = "clk_net";
NET "ve_vc<0>" TNM_NET = ve_data;
NET "ve_vc<1>" TNM_NET = ve_data;
```

Create timing group by specify the name of the instance (module)

```
INST "inst_name" TNM = qualifier "tnm_name";
```

### OFFSET

**OFFSET** constraint is used to specify external setup time for input pads or necessary hold time for output pads.

![Offset Example](img/ucf_offset_example.svg){.center}

For input pads, OFFSET specifies a time before the (external) clock edge when the related data signals are set.

```
OFFSET = IN 5 ns AFTER  "CLK";
OFFSET = IN 5 ns BEFORE "CLK";
```

![Offset in](img/ucf_offset_in.svg){.center width="700px"}

For output pads, OFFSET specifies a minimum time after the clock edge when the related data signals can be deasserted.

```
OFFSET = OUT 2 ns AFTER  "CLK";
OFFSET = OUT 2 ns BEFORE "CLK";
```

![Offset Out](img/ucf_offset_out.svg){.center width="700px"}

#### OFFSET with TimeGroup

Set Offset after rising edge of clock constraint for all signals in
Timegroup

```
TIMEGRP "ve_data" OFFSET = OUT 10.333 ns AFTER "mb_vclk" RISING;
TIMEGRP "ve_data" OFFSET = OUT 10.333 ns AFTER "mb_vclk" FALLING;
```

#### OFFSET with Valid data

The **VALID** keyword is used in conjunction with the requirement to create a hold time requirement. The VALID keyword specifies the duration of the incoming data valid window. By default, the VALID value is equal to the OFFSET time requirement, which specifies a zero hold time requirement

```
TIMEGRP DATA_IN OFFSET IN = 2ns VALID 3ns BEFORE CLK RISING;
```

![Offset Valid](img/ucf_offset_valid.svg){.center}

### False paths

In some cases, you may want to remove a set of paths from timing analysis if you are sure that these paths do not affect timing performance. For example a processor interrupt line or a UART TX Line. In both cases, those signals are not synchronous with respect to your clock. You must then indicate that those nets are to be ignored by timing checks. In order to do it, for Xilinx FPGA you must use the TIG constraint (which stands for **T** iming **IG** nore).

One common way to specify the set of paths to be removed from timing analysis is to use the `FROM-TO` constraint with the timing ignore (TIG) keyword. This allows you to:

- Specify a set of registers in a source time group
- Secify a set of registers in a destination time group
- Automatically remove all paths between those time groups from analysis.

To specify the timing ignore (TIG) constraint for this method, define:

- A set of registers for the source time group
- A set of registers for the destination time group
- A FROM-TO constraint with a TIG keyword to remove the paths between the groups

```
TIMESPEC "TSid" = FROM "SRC_GRP" TO "DST_GRP" TIG;

NET "CLK1" TNM_NET = FFS "GRP_1";
NET "CLK2" TNM_NET = FFS "GRP_2";
TIMESPEC TS_Example = FROM "GRP_1" TO "GRP_2" TIG;
```

![False Path](img/ucf_false_path.svg){.center}

### Multicycle paths

In a multi-cycle path, data is transferred from source to destination synchronous elements at a rate less than the clock frequency defined in the `PERIOD` specification. This occurs most often when the synchronous elements are gated with a common clock enable signal. By defining a multi-cycle path, the timing constraints for these synchronous elements are relaxed over the default `PERIOD` constraint. The implementation tools are then able to appropriately prioritize the implementation of these paths. One common way to specify the set of multi-cycle paths is to define a time group using the clock enable signal. This allows you to:

- Define one time group containing both the source and destination synchronous elements using a common clock enable signal
- Automatically apply the multi-cycle constraint to all paths between these synchronous elements

To specify the `FROM:TO` (multi-cycle) constraint for this method, define:

- A PERIOD constraint for the common clock domain
- A set of registers based on a common clock enable signal
- A `FROM:TO` (multi-cycle) constraint describing the new timing requirement

```
TIMESPEC "TSid" = FROM "MC_GRP" TO "MC_GRP" <value>;

NET "CLK1" TNM_NET = "CLK1";
TIMESPEC "TS_CLK1" = PERIOD "CLK1" 5 ns HIGH 50%;
NET "Enable" TNM_NET = FFS "MC_GRP";
TIMESPEC TS_Example = FROM "MC_GRP" TO "MC_GRP" TS_CLK1*2;
```

![Multi-Cycle Path](img/ucf_multi_cycle_path.svg){.center}
