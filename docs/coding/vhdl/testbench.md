---
tags:
- coding
- vhdl
- testbench
---
# Testbench

![](img/tb_dut.svg){.center width="600px"}

## Additional Documents

- [Synth Works Subbloc Verification]({{base_repo_file}}/docs/coding/vhdl/docs/synthworks_subblock_verification.pdf)
- [Synth Works Testbench Techniques]({{base_repo_file}}/docs/coding/vhdl/docs/synthworks_testbench_techniques.pdf)

## Tests & Severity

``` title="severity"
-- severity = note | warning | error | failure
assert ( a = b )
  report “a is not equal to b”
severity note;
```

### Stop Simulation

``` vhdl title="testbench stop"
assert false report "End of simulation" severity failure;
```

## Clock generation

``` vhdl title="clock"
constant sys_CLK_freq   : real := 150.00E6;
constant sys_CLK_period : time := (1.0/sys_CLK_freq) * 1 sec;

signal sys_CLK_int      : std_logic;
signal sys_CLK          : std_logic;
----------------------------
-- Only signal
sys_CLK_int <= not sys_CLK_int after sys_CLK_period / 2;
sys_CLK     <= transport sys_CLK_int after sys_CLK_period * 9 / 10;

-- In a process
process
begin
    sys_CLK_int    <= '0';   wait for sys_CLK_period / 2;
    sys_CLK_int    <= '1';   wait for sys_CLK_period / 2;
end process;
sys_CLK     <= transport sys_CLK_int after sys_CLK_period * 9 / 10;
```

## Reset

``` vhdl title="reset"
tb_RESETn   <= '0' after 0 ns,
               '1' after 4 * sys_CLK_period;
```

## Wait statement

- Has to be in process without List of sensitivity
- Ever process without a list of sensitivity need at least on wait statement.

``` vhdl title="wait"
wait_PROC: process
    -- wait for a given TIME
    wait for <time>;

    -- wait for an EVENT
    wait on <signal>;

    -- wait until CONDITON (on event triggered)
    wait until <condition>;

    -- wait if signal hasn't the whished value
    if not <condition> then
      wait until <condition>;
    end if;

    -- wait FOREVER
    wait;
end wait_PROC;
```

## Strings

``` vhdl title="string"
-- Integer => String
string_sig <= integer'image(integer_sig);

-- String => Interger
integer_sig <= integer'value(string_sig);

-- String => Std_logic_vector
slv_sig <= to_std_logic_vector(string_sig);
```

**Characters**

```
lf - linefeed
ht - tabluator
```

### Simple and messy

Make a string plenty wide enough. Then you can store each string in the appropriate slice of it.

``` vhdl title="string simple"
variable toto: string(1 to 80) := (others => ' ');
-- plenty wide enough, and full of spaces

...

if a = 0 then
    toto(t1'range) := t1;
else
    toto(t2'range) := t2;
end if;
```

This is quite horrible, though, because you have no easy way to find out how many characters of `toto` are in use at any given time.

### Complicated and pretty

Make the string a variable of type `LINE`, from package `STD.TEXTIO`. Then you can copy any string into it using the `WRITE` procedure:

`WRITE` procedure adds things to the end of the string stored in `toto`, so that it grows ever longer. The `DEALLOCATE` procedure eliminates the spaces used by the line variable.

!!! warning
    Each line variable need to be deallocated at the end, otherwise the memory space will not be released.

``` vhdl title="string pretty 1"
variable toto: line; -- initialised to empty!
...
if a=0 then
    write(toto, t1);
else
    write(toto, t2);
end if;
```

To reset it back to "empty" and free the memory, simply:

``` vhdl title="string pretty 2"
deallocate(toto);
```

#### Put String into Line

Copying any string into a line variable, having first cleared that variable:

``` vhdl title="string pretty 3"
procedure put(l: inout line; s: in string) is
    begin
    deallocate(l);
    write(l, s);
end;
```

#### Get String from Line

Given a variable.

``` vhdl title="string pretty 4"
variable l: line;
variable c: character;
variable s: string(1 to 80) := (others => ' ');

-- put something into l
...

-- take the whole string content
report "Message is " & l.all;

-- take a slice of it, just like a string:
c := l(1);
s := l.all; (whole line to string)

-- find its length:
if l'length > 50 then
   ...
end if;

-- write it to a file (such as the console):
writeline(output, l); -- also clears l to empty
```

## Shared Variables

``` vhdl title="shared variables"
architecture non_determinist of example is

    shared variable count : integer;

begin

    p1 : process
    begin
        count := 1;
        wait;
    end process p1;

    p2: process
    begin
        wait 1 ps;
        count := 2;
        wait;
    end process p2;
end architecture non_determinist;
```
