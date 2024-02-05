---
tags:
- coding
- vhdl
- guidelines
---
# Programming Guidelines

## Rules

### Entity ports

- Use only modes `IN` and `OUT` in the port of sub-blocks, `INOUT` mode too only in the port of the top-level entity
- Use only signal types `STD_LOGIC` and `STD_LOGIC_VECTOR`, `INTEGER`, `UNSIGNED`, `SIGNED`
- Signals in the port of the entity should be grouped as follows:

- Resets
- Clocks
- Signals of group A
- Signals of group B
- Signals of group C
- ...

- Signals inside a group should be further grouped as follows:
    - Control inputs
    - Data inputs
    - Outputs

### Architecture

Architecture name should be one of following rules:

| Architecture Name | Description |
| ----------------- | ---------------------------------------------------- |
| `behavioral`      | Implies physical logic, does not compile with RTL tool |
| `rtl`             | Implies physical logic, compiles with RTL tools |
| `struct`          | Implies physical connections, but not any logic |
| `gate`            | Gate level netlist |
| `simulation`      | Simulation mode |
| `testbench`       | Test bench |

### Signals

- Direction of bits in `STD_LOGIC_VECTOR`, `UNSIGNED` and `SIGNED` is always `DOWNTO`
- Size of the vector should be parameterized
- Usually the least significant bit is numbered as zero
- Use package `numeric_std` for arithmetic operations

!!! tip
    Never mix these libraries

    ``` vhdl
    library ieee;
      use ieee.std_logic_1164.all;
      use ieee.numeric_std.all;
    ```

    ``` vhdl
    library ieee ;
      use ieee.std_logic_1164.all ;
      use ieee.std_logic_arith.all ;
      use ieee.std_logic_unsigned.all;
    ```

### Processes

Label every process

``` vhdl title="async_process.vhd"
processname: process(all)
begin
    Do something here;
end process;
```

#### Synchronous process

Synchronous process is sensitive only to reset and clock

- Clock event is always to the rising edge
- All control registers must be initialized in reset

``` vhdl title="sync_process.vhd"
processname: process(reset, clock)
begin
    if reset = '1' then
        reset <= assignemts;
    elsif rising_edge(clock) then
        rising_edge_clock <= assigments;
    end if;
end process;
```

#### Asynchronous process

- Include all process input signals in the sensitivity list
- Complete if-clauses must be used, all cases defined
- Signals are assigned in every branch

``` vhdl title="async_process.vhd"
processname: process(all)
begin
    async_logic <= assignment;
end process;
```

## Naming Conventions
### Constant

This convention applies to all constants. The names must be in **capital letter**,are composed as follows:

| Type      | Convention                                             | Example                  |
|-----------|--------------------------------------------------------|--------------------------|
| Generic   | `g_<generic name>`                                     | `g_WIDTH_A` `g_WIDTH_BYTEENA_A` |
| Constant  | `c_<interface that constant apply to>_<constant name>` | `c_MEM_WORD_SIZE` `c_PH_UNIT_NUM` |

### Global Signals

This convention must be applied to physical ports of components or function blocks and global variables in **QSYS** components and pin names at top-level. The names are composed as follows:

`<//interface type//>_<//interface name//>_<//signal type//>[_n][_#]`

Examples:

- `avs_JetMapping_data`
- `pad_Ethernet2_reset_n`

Valid Values for Interface Types

| Value | Meaning                           | Apply to |
| ----- | --------------------------------- | ------------------ |
| `avs` | Avalon-MM Slave                   | QSys components |
| `avm` | Avalon-MM Maser                   | QSys components |
| `aso` | Avalon-ST Source                  | QSys components |
| `asi` | Avalon-ST Sink                    | QSys components |
| `cso` | Clock output                      | QSys components |
| `csi` | Clock input                       | QSys components |
| `coe` | Conduit                           | QSys components |
| `inr` | Interrupt receiver                | QSys components |
| `ins` | Interrupt sender                  | QSys components |
| `ncm` | Nios II custom instruction master | QSys components |
| `ncs` | Nios II custom instruction slave  | QSys components |
| `rsi` | Reset sink                        | QSys components |
| `rso` | Reset source                      | QSys components |
| `tcm` | Avalon-TC master                  | QSys components |
| `tcs` | Avalon-TC slave                   | QSys components |
| `pad` | Physical pad                      | Top-level entity |

### Ports Signals

This convention applies to internal ports (signals across the hierarchy). The names are composed as follows:

`<direction><//signal function type//>_<//signal name//>[_n][_#]`

Valid Values for Interface Types

| Value         | Meaning                | Example                                  |
|---------------|------------------------|------------------------------------------|
| `[i]GCK`      | Global Clock signal    | `iGCK_clk_in_100 : in std_logic;` |
| `[i]GRS`      | Global Reset signal    | i`GRS_reset_n : in std_logic;` |
| `[i,o]CLK`    | Internal Clock signal  | `iCLK_pll_clk_25 : in std_logic;` |
| `[i,o]RST`    | Internal Reset signal  | `oRST_enet_reset_n: out std_logic;` |
| `[i,o]<name>` | Synchronous signal(s)  | `i_fsm_data : in std_logic_vector(31 DOWNTO 0);` |
| `[i,o]<name>` | Asynchronous signal(s) | `o_pcie_led_x1: out std_logic;` |

### Local Signals

This convention applies to local signals only. The names are composed as follows:

`l<//signal type//>_<//signal name//>[_n][_#]`

Valid Values for Interface Types

| Value    | Meaning   | Example                                          |
|------|-----------|--------------------------------------------------|
| `sig`    | Local signal | `lsig_cnt_en : std_logic` |
| `vec` | Local vector  `lvec_cnt : std_logic_vector(1 DOWNTO 0);` <br> `lvec_cnt : unsigned(1 DOWNTO 0);` <br> `lvec_cnt : signed(1 DOWNTO 0);` |
| `ary` | Local array | `type logic_array is array (0 to 1) of std_logic;` <br> `signal lary_logics : logic_array;` |
| `int` | Local integer | `signal lint_pixel_pos_cnt : integer range 0 to 2;` |
| `var` | Local variable | `variable lvar_load_new_pix_data_set : std_logic; ` |

### Alias

An alias creates an alternative name for an existing object. It does not create a new object. For these reasons no specific naming conventions are established so far.

Example:

``` vhdl
signal instruction : std_logic_vector(15 downto 0);
alias opcode : std_logic_vector(3 downto 0) is instruction(15 downto 12);
```

## IP Reusability

- The IP specification lists the requirements and details the feature set, performance expectations, size, usage model, etc. Not all design blocks need to be reusable, the specification must state whether a design is being architected as a reusable block.
- The specification has been officially reviewed by all interested parties. This increases the likelihood that the design block can be reused elsewhere in the company.
- Existing libraries of components have been reviewed to identify if existing IP with similar functionality already exists, i.e. practice reuse in the development process.
- The IP core name follows your company's naming conventions. The name of the core should be description of designs function, e.g. AXI4 Clock Crossing Bridge.
- Signal and parameter naming conventions are followed. Signal and parameter names should be descriptive of the functionality. This makes it easier for end users to understand the impact of these parameters and signals on the design block.
- The IP core has default parameter values. Parameters provide the simplest way to create reusable design blocks. IP features, ports and functionality can all be parameterized for maximum flexibility. The default values should be the most common usage model for the design block.
- The IP uses standard interfaces. Adopt a common interface protocol on all of IP. The use of standard interfaces simplifies the interconnection and management of functional blocks that make up a design. It ensures compatibility between IP blocks from different design teams, simplifies the integration of individual design blocks into a full system design and enables "plug and play" interoperability of IP.
- The IP core meets the timing specification and all timing violations have been addressed. The IP core includes a full set of timing constraints.
- The IP passes LINT tests per your company's established coding rules. It is recommended that you invest in a LINT to enforce coding guidelines and that it is fully integrated with version control/design check in process.
- The verification of the IP meets the functional, assertion, and line coverage goals as specified in the test plan. Note that the test plan should be developed at the same time as the functional specification for the design.
- The IP is adequately tested to cover the parameterization space and both expected and unexpected data patterns. Users of IP tend to be suspicious of other peoples design. There's nothing gained in debugging someone else's code.
- Provide a user interface and/or script for end users to instantiate the IP in their design. The interface should make it easy for the user to understand any applicable constraints. At a minimum, the IP should come with a documented command-line script that enables users to pass values to the parameters in the IP. Ideally it should come with a simple graphical user interface (GUI) to help users get started (see Figure 1).
- Design files and all packaging files adhere to your company's standard version-control directory structure. If users know where the applicable files are located, it provides the user with confidence that the designer of the IP has thought through the process of reuse.
- Testbench and reference designs are available for use with the core. This is a "nice to have" feature that provides new users an easy way to get started with a design.
- IP cores, example designs and test benches can be simulated in company simulators. Users should be able to run the scripts and see the basic functionality of the design.
- Release notes detail all supported devices, FPGA device families, and versions of the EDA tools used on the design.
