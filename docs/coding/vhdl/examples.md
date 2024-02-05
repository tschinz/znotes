---
tags:
- coding
- vhdl
- examples
---
# Examples

## Blinker

Many time you want to implement a Led blinking at a given event. The problem is that the available signal is either tool long or (mostly) too short to be seen for a led. Therefore this bloc was created to let a led blink on an event of a signal.

### Settings

-   Set your **clockFrequency** , according to that a blink of 500ms
    will be calculated.
-   Choose your **mode**
    -   `mode 0`: rising edge reaction
    -   `mode 1`: falling edge reaction

```
Mode = 0 (reactive on rising edge)
             ___________________________________________
 input  ____/
             ___________________
 output ____/                   \_______________________
 time   0s                    0.5s                    1s

             _
 input  ____/ \_________________________________________
             ___________________
 output ____/                   \_______________________
 time   0s                    0.5s                    1s

Mode = 1 (reactive on falling edge)
        _____
 input       \__________________________________________
               ___________________
 output ______/                   \_____________________
 time   0s                    0.5s                    1s

             _
 input  ____/ \_________________________________________
                ___________________
 output ______ /                   \____________________
 time   0s                    0.5s                    1s
```

!!! example
    [config repo blink]({{config_repo_folder}}/scripts/vhdl/blink)

## BRAM

!!! example
    [config repo bram]({{config_repo_folder}}/scripts/vhdl/bram)

![BRAM](img/bram.svg){.center width="100%"}

To generate RAM and ROM using the BRAM's available in the FPGA, several methods can be used.

- For Xilinx you can use the CoreGen Program and for Actel the Libero IDE
- Write VHDL code which the synthesis tool can understand

The advantage of the second method is that it's target independent, but however it depends on the functionalities of the Synthesis tool.

### Definition

#### ROM Definition

**Single Port ROM with VHDL initialisation**

!!! example
    [config repo rom.vhd]({{config_repo_file}}/scripts/vhdl/bram/rom.vhd)

#### RAM Definition

**Dual-Port RAM with synchronous Read (Read Through) with no initialisation**

!!! example
    [config repo dp_ram_1.vhd]({{config_repo_file}}/scripts/vhdl/bram/dp_ram_1.vhd)

**Generic Dual-Port RAM (Write First) with two clocks, enables and write enables and initialisation with a binary file**

!!! example
    [config repo dp_ram_2.vhd]({{config_repo_file}}/scripts/vhdl/bram/dp_ram_2.vhd)

### Initialisation

#### MIF-File

An ASCII text file (with the extension `.mif`) that specifies the initial content of a memory block (CAM, RAM, or ROM), that is, the initial values for each address.

A MIF contains the initial values for each address in the memory. A separate file is required for each memory block. In a MIF, you are also required to specify the memory depth and width values. In addition, you can specify the radixes used to display and interpret addresses and data values.

#### HEX-File

Intel HEX is a file format for conveying binary information for applications like programming microcontrollers, EPROMs, and other kinds of chips. It is one of the oldest file formats available for this purpose, having been in use since the 1970s.

##### Format

**Start code**

The Start code exist only once per line at it's beginning. The Start code is `:`

**Byte count**

The Byte count indicates the number n of Raw Data bytes there are in the Data field.

**Address**

16bit Address of the Data. If more Address bits are needed see Record Type `04`.

**Record type**

There are six possible Record type:

- **00**: data record, contains data and 16-bit address.
- **01**: End Of File record. Must occur exactly once per file in the last line of the file. The byte count is 00 and the data field is empty. Usually the address field is also 0000, in which case the complete line is `:00000001FF`. Originally the End Of File record could contain a start address for the program being loaded, e.g. :00AB2F0125 would cause a jump to address AB2F.
    ```
    :00000001FF
    or
    :020000010000FD
    ```
- **02**: Extended Segment Address Record, segment-base address (two hex digit pairs in big endian order). Used when 16 bits are not enough, identical to 80x86 real mode addressing. The address specified by the data field of the most recent 02 record is multiplied by 16 (shifted 4 bits left) and added to the subsequent 00 record addresses. This allows addressing of up to a megabyte of address space. The address field of this record has to be 0000, the byte count is 02 (the segment is 16-bit). The least significant hex digit of the segment address is always 0.
- **03**: Start Segment Address Record. For 80x86 processors, it specifies the initial content of the CS:IP registers. The address field is 0000, the byte count is 04, the first two bytes are the CS value, the latter two are the IP value.
- **04**: Extended Linear Address Record, allowing for fully 32 bit addressing (up to 4GiB). The address field is 0000, the byte count is 02. The two data bytes (two hex digit pairs in big endian order) represent the upper 16 bits of the 32 bit address for all subsequent 00 type records until the next 04 type record comes. If there is not a 04 type record, the upper 16 bits default to 0000. To get the absolute address for subsequent 00 type records, the address specified by the data field of the most recent 04 record is added to the 00 record addresses.
- **05**: Start Linear Address Record. The address field is 0000, the byte count is 04. The 4 data bytes represent the 32-bit value loaded into the EIP register of the 80386 and higher CPU.

**Data**

Raw Data of n bytes (n = Bytecount) at the given address in Hexadecimal format.

**Checksum**

The Checksum is two hex digits - the least significant byte of the two's complement of the sum of the values of all fields except fields 1 and 6 (Start code ":" byte and two hex digits of the Checksum). It is calculated by adding together the hex-encoded bytes (hex digit pairs), then leaving only the least significant byte of the result, and making a 2's complement (either by subtracting the byte from 0x100, or inverting it by XOR-ing with 0xFF and adding 0x01).

##### Example

```
: 10 0100 00 214601360121470136007EFE09D21901 40
: 10 0110 00 2146017EB7C20001FF5F160021480119 88
: 10 0120 00 194E79234623965778239EDA3F01B2CA A7
: 10 0130 00 3F0156702B5E712B722B732146013421 C7
: 00 0000 01 FF
```

#### Binary-File

An ASCII text file (with the extension `.bin`) that specifies the initial content of a memory block (CAM, RAM, or ROM), that is, the initial values for each address. This is the initialisation file used in the BRAM-VHDL examples. The file location has to be given in the generic called `initFile`. The file is witten in ASCII-binary format and one line has to be one line of the BRAM with the exact number of databits. Also each BRAM address has to be initialised in this file.

An example of an 16 databit and 3 addressbit RAM

```
0000000000000000
0000000000000001
0000000000000010
0000000000000011
0000000000000100
0000000000000101
0000000000000110
0000000000000111
```

#### In VHDL

In order to initialise the BRAM you can also edit the VHDL code directly and initialise your Memory signal.

``` vhdl
signal ROM : rom_type := (X"0200A",X"00300",X"08101",X"04000",X"08601",X"0233A",
                          X"00300",X"08602",X"02310",X"0203B",X"08300",X"04002",
                          X"08201",X"00500",X"04001",X"02500",X"00340",X"00241",
                          X"04002",X"08300",X"08201",X"00500",X"08101",X"00602",
                          X"04003",X"0241E",X"00301",X"00102",X"02122",X"02021",
                          X"00301",X"00102",X"02222",X"04001",X"00342",X"0232B",
                          X"00900",X"00302",X"00102",X"04002",X"00900",X"08201",
                          X"02023",X"00303",X"02433",X"00301",X"04004",X"00301",
                          X"00102",X"02137",X"02036",X"00301",X"00102",X"02237",
                          X"04004",X"00304",X"04040",X"02500",X"02500",X"02500",
                          X"0030D",X"02341",X"08201",X"0400D");


Restrictions
```

There are cetain restriction if you write BRAM's in VHDL

#### Syntesis Tool limitation

The VHDL Code for creating BRAM is read and understood by the synthesis tool. The mentioned code was tested in Xilinx XST Syntesis Tool. It has to be verified for other Synthesis tools like Simplify or Leonardo. The following limitaions are due the use of Xilinx XST.

##### Port limitation

The BRAM's defined in VHDL can have multiple Read ports, but only ONE Write port.

##### Initialisation limitation

The BRAM can **only** with the described Binary file format be initialised. The Synthesis tools doesn't support read and parsing files. Therefore a hex or mif file format can not be used.

## Debounce

Each button can bounce while pushing or releasing. This can't completely eliminated. but to avoid button bouncing. The following two thing can be done.

- Buy high quality buttons
- Implement a button debouncing

Settings First the max bounce time should be measured and according to that value and your used clock, the counterBitNb can be choosen accordingly. The following implementation has two different modes. Mode 0 is reactive on rising edge and mode 1 is reactive on falling edge.

```
Mode 0
             _   _   ____________________   _   _
 input  ____/ \ / \ /                    \_/ \ / \______
             _________________________________________
 output ____/                                         \_

Mode 1
             _   _   ____________________   _   _
 input  ____/ \ / \ /                    \_/ \ / \______
                          _______________
 output _________________/               \______________
```

!!! example
    [config repo debounce]({{config_repo_folder}}/scripts/vhdl/debounce)

## Reset Input

For having a stable system first you need a proper reset. Just using an input as reset isn't enough. Here's how to poperly synchronize your reset.

```
--pad_rst----+----------+----------+
          +--+--+    +--+--+    +--+--+    +-.
--'1'-----|D   Q|----|D   Q|----|D   Q|----|  >O-----rst
          |     |    |     |    |     |    +-´
       +--|>    | +--|>    | +--|>    |
       |  +-----+ |  +-----+ |  +-----+
--clk--+----------+----------+
```

``` vhdl title="blink"
LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.numeric_std.all;

ENTITY rst_synchronizer IS
   PORT( pad_rst_n : IN     std_logic;
         clock     : IN     std_ulogic;
         reset     : OUT    std_ulogic
   );
END rst_synchronizer ;

ARCHITECTURE rtl OF rst_synchronizer IS

  signal lvec_rst_n : std_ulogic_vector(2 downto 0);

BEGIN

  process(pad_rst_n , clock)
  begin
    if pad_rst_n = '1' then
      lvec_rst_n <= (others => '0');
    elsif rising_edge(clock) then
      lvec_rst_n <= lvec_rst_n(1 downto 0) & '1';
    end if;
  end process;
  rst <= not lvec_rst_n(2);
END ARCHITECTURE rtl;
```

## Pseudo Random Number Generator

!!! example
    [config repo prng]({{config_repo_folder}}/scripts/vhdl/prng)


This VHDL module uses 2 Linear Feedback Shift Registers (LFSR) with polynomials for maximal sequence length, one of which is scalable to output word size (`4bit` - `24bit`) and one to operate as a non-uniform duty cycle clock. The module gives the user 4 options for output distribution types, Gaussian unimodal, bimodal, uniform, and non-uniform distributions. These distributions are created by altering a scalable LFSR output by clocking the output irregularly with a non-uniform clock, shifting scaled outputs into a buffer-adder-tree to effectively use the central limit theorem to create a normal distribution, and a feedback loop to further shape the distributions. Sample histograms are included in the figures following. The prng.vhd module is verified in a test bench by writing out the pseudo-random values to a file. This data can be entered into one's favorite statistical analysis software package for verification.

### Background

The LFSR is a shift register of arbitrary length that takes its input based off a linear function derived from the previous state. This function is chosen to provide a maximally long sequence. As the output-width is scaled, a different LFSR is built with a polynomial to provide maximal length. The polynomials used are commented in the VHDL module.

### Generics

| Generic    | Type     | Range                                 | Description                     |
|------------|----------|---------------------------------------|---------------------------------|
| `g_W`      | Integer  | `28` - `4`                            | Number of output vector bits    |
| `g_V`      | Integer  | `24` - `18`                           | Non uniforming clocking bits    |
| `g_G_TYPE` | Integer  | `0` = uniform <br> `1` = ave-uniform  | Gaussion Distribution Type for `o_g_noise` |
| `g_U_TYPE` | Integer  | `0` = uniform <br> `1` = ave-unifoirm | Uniform Distribution Type for `o_u_noise`  |

| Signal         | Size        | Description |
| -------------- | ----------- | ----------- |
| `iCLK_clk`     | `1`         | input clock signal |
| `iGRS_reset_n` | `1`         | input reset signal |
| `i_enable`     | `1`         | enable prn generation |
| `o_g_noise`    | `[g_W-1:0]` | gaussian distibution output |
| `o_u_noise`    | `[g_W-1:0]` | uniform distribution output |
