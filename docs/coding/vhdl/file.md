---
tags:
- coding
- vhdl
- file
---
# File

``` vhdl
type file_open_kind is ( read_mode, write_mode, append_mode );
```

## Reading File

The below code reads a set of binary numbers from the file named read.txt and put them into a 4 bit `std_logic_vector` signal.

``` title="read file"
LIBRARY ieee;
  use ieee.std_logic_1164.ALL;
  use STD.textio.all;

-- -----------------------------------------------------------------------------
-- Declare empty entity
--
ENTITY read_file IS
END read_file;

-- -----------------------------------------------------------------------------
-- Declare architecture
--
ARCHITECTURE behaviour OF read_file IS

  constant FILE_NAME : string := "C:\read.txt";
  signal  bin_value : std_logic_vector(3 downto 0):="0000";

BEGIN

  -- -------------------------------------------------------------------------
  -- Read Process
  --
  process
    file file_pointer : text;
    variable line_content : string(1 to 4);
    variable line_num : line;
    variable j : integer := 0;
    variable char : character:='0';
  begin
    -- Open the file read.txt from the specified location for reading(READ_MODE)
    file_open(file_pointer,FILE_NAME,READ_MODE);

    -- Continue reading until EOF
    while not endfile(file_pointer) loop
      -- Read the whole line from the file
      readline (file_pointer,line_num);
      -- Read the contents of the line from the file into a variable
      READ(line_num,line_content);
      -- For each character in the line convert it to binary value
      -- And then store it in a signal named 'bin_value'
      for j in 1 to 4 loop
        char := line_content(j);
        if(char = '0') then
          bin_value(4-j) <= '0';
        else
          bin_value(4-j) <= '1';
        end if;
      end loop;
      -- After reading each line wait for 10ns
      wait for 10 ns;
    end loop;

    -- After reading all the lines close the file
    file_close(file_pointer);
    wait;
  end process;
end behaviour;
```

A simulation of the reading:

![](img/sim_readfile.png){.center}

[read_file.vhd]({{config_repo_file}}/scripts/vhdl/file_io/read_file.vhd)

## Writing File

The code below writes is used to writing a file. It writes binary values from 0000 to 1111.

``` title="write file"
LIBRARY ieee;
  use ieee.std_logic_1164.ALL;
  use ieee.std_logic_arith.ALL;
  use STD.textio.all;

-- -----------------------------------------------------------------------------
-- Declare empty entity
--
ENTITY write_file IS
END write_file;

-- -----------------------------------------------------------------------------
-- Declare architecture
--
ARCHITECTURE behaviour OF write_file IS

  constant FILE_NAME : string := "C:\write.txt";

BEGIN

  -- -------------------------------------------------------------------------
  -- Write Process
  --
  process
    file file_pointer : text;
    variable line_content : string(1 to 4);
    variable bin_value : std_logic_vector(3 downto 0);
    variable line_num : line;
    variable i,j : integer := 0;
    variable char : character:='0';
  begin
    -- Open the file write.txt from the specified location for writing(WRITE_MODE)
    file_open(file_pointer, FILE_NAME, WRITE_MODE);

    -- We want to store binary values from 0000 to 1111 in the file
    for i in 0 to 15 loop
      bin_value := conv_std_logic_vector(i,4);
      -- convert each bit value to character for writing to file
      for j in 0 to 3 loop
        if(bin_value(j) = '0') then
          line_content(4-j) := '0';
        else
          line_content(4-j) := '1';
        end if;
      end loop;

      -- write the line
      write(line_num,line_content);

      -- write the contents into the file
      writeline (file_pointer,line_num);
      -- wait for 10ns after writing the current line
      wait for 10 ns;
    end loop;

    -- Close the file after writing
    file_close(file_pointer);
    wait;
  end process;
end behaviour;
```

[write_file.vhd]({{config_repo_file}}/scripts/vhdl/file_io/write_file.vhd)
