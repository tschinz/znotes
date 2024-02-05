---
tags:
- coding
- vhdl
- library
---
# Libraries

## Numeric Operations

!!! warning
    Never mix these Libraries!!!

    Use numeric_std - it's the proper IEEE standard and is more recent.

    ``` vhdl
    library ieee;
      use ieee.std_logic_1164.all;
      use ieee.numeric_std.all;

    -- Never mix these libraries

    library ieee ;
      use ieee.std_logic_1164.all ;
      use ieee.std_logic_arith.all ;
      use ieee.std_logic_unsigned.all ;
    ```

## IEEE

Standart IEEE Libraries can not be found in every tool because of their copyright notice. Nevertheless they can be downloaded from the [IEE Webpage](https://standards.ieee.org/downloads.html)

[ieee libraries]({{config_repo_folder}}/scripts/vhdl/libraries/ieee)

- [math_complex.vhd]({{config_repo_file}}/scripts/vhdl/libraries/ieee/math_complex.vhd)
- [math_real.vhd]({{config_repo_file}}/scripts/vhdl/libraries/ieee/math_real.vhd)
- [numeric_bit.vhd]({{config_repo_file}}/scripts/vhdl/libraries/ieee/numeric_bit.vhd)
- [numeric_std.vhd]({{config_repo_file}}/scripts/vhdl/libraries/ieee/numeric_std.vhd)
- [std_logic_1164.vhd]({{config_repo_file}}/scripts/vhdl/libraries/ieee/std_logic_1164.vhd)
- [std_logic_arith.vhd]({{config_repo_file}}/scripts/vhdl/libraries/ieee/std_logic_arith.vhd)
- [std_logic_misc.vhd]({{config_repo_file}}/scripts/vhdl/libraries/ieee/std_logic_misc.vhd)
- [std_logic_signed.vhd]({{config_repo_file}}/scripts/vhdl/libraries/ieee/std_logic_signed.vhd)
- [std_logic_textio.vhd]({{config_repo_file}}/scripts/vhdl/libraries/ieee/std_logic_textio.vhd)
- [std_logic_unsigned.vhd]({{config_repo_file}}/scripts/vhdl/libraries/ieee/std_logic_unsigned.vhd)

## STD

[std libraries]({{config_repo_folder}}/scripts/vhdl/libraries/std)

- [standard.vhd]({{config_repo_file}}/scripts/vhdl/libraries/std/standard.vhd)
- [textio.vhd]({{config_repo_file}}/scripts/vhdl/libraries/std/textio.vhd)

## Synopsys

[synopys libraries]({{config_repo_folder}}/scripts/vhdl/libraries/synopsys)

- [arithmetic.vhd]({{config_repo_file}}/scripts/vhdl/libraries/synopsys/arithmetic.vhd)
- [attributes.vhd]({{config_repo_file}}/scripts/vhdl/libraries/synopsys/attributes.vhd)
- [types.vhd]({{config_repo_file}}/scripts/vhdl/libraries/synopsys/types.vhd)
