---
tags:
- coding
- vhdl
- time
---
# Time

## Time Type

``` vhdl title="time type"
type time is range -2147483647 to 2147483647
       units
               fs;
               ps  = 1000 fs;
               ns  = 1000 ps;
               us  = 1000 ns;
               ms  = 1000 us;
               sec = 1000 ms;
               min = 60 sec;
               hr  = 60 min;
      end units;
```

### Is a 32bit integer sufficient

$$ Max value = 2^{32}-1 = 2.15*10^9 = 2.15us < hour $$

!!! note
    How many femtosecond has an hour?

    $ 1 hour  = 3.6*10^{10} fs $

### Simulator use 64bit integer

$$ Max value = 2^{64}-1 = 9.22*10^{18} = 2.56 hour $$

!!! note
    VHDL Simulators use 64bit integer for time representaton

    Time range is = $1 fs - 2.56 hour$

## Time Conversions

### Integer => Time

``` vhdl title="int 2 time"
-- Time_value := Int_value * Time_unit;
timeout := intmax * 1 ns;
```

### Real => Time

``` vhdl title="real 2 time"
-- Time_value := integer(real_value) * Time_unit;
timeout := integer(realmax) * 1 ns;
```

### Time => Real, Integer

``` vhdl title="time 2 time"
int_pico  := curr_time/ 1 ns * 1000;
real_pico := real(curr_time/ 1 ns) * 1000.0;
-- Time_value := integer(real_value) * Time_unit;
timeout := integer(realmax) * 1 ns;
```

## Clock generation

``` vhdl title="clock generation"
architecture test of DUT_tester is
  -- 100MHz clock
  constant clkFreq    : real       := 100.0E6;
  constant clkPeriod  : time       := (1.0/clkFreq) * 1 sec;
  -- Initialising with 1
  signal   clk_int    : std_ulogic := '1';

begin
  clk_int <= not clk_int after clkPeriod/2;
  clk     <= transport clk_int after clkPeriod*9/10;
end test;
```
