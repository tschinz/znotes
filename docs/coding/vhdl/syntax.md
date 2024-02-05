---
tags:
- coding
- vhdl
- syntax
---
# Syntax

You can also find nice comprehensive VHDL papers and courses at: [http://www.synthworks.com](http://www.synthworks.com)

## Types

| Typename            | Possible Value(s)                           | Package         |
|---------------------|---------------------------------------------|-----------------|
| `boolean`           | `true`, `false`                             | standard        |
| `std_ulogic`        | `U`, `X`, `0`, `1`, `Z`, `W`, `L`, `H`, `-` | std_logic_1164  |
| `std_ulogic_vector` | array of std_ulogic                         | std_logic_1164  |
| `std_logic`         | resolved std_ulogic                         | std_logic_1164  |
| `std_logic_vector`  | array of std_logic                          | std_logic_1164  |
| `unsigned`          | $0 \: to \: 2^2{(n)} - 1$                   | numeric_std <br> std_logic_arith    |
| `signed`            | $-2^{(n-1)} \: to \: 2^{(n-1)} - 1$ (2nd Complement) | numeric_std <br> std_logic_arith |
| `integer`           | $-2147483648 \: to \: 2147483647$ (32bit)   | standard        |
| `real`              | $-1.0E38 \: to \: 1.0E38$                   | standard        |
| `time`              | 1 fs to 1 hr                                | standard        |
| `character`         | 191 / 256 characters                        | standard        |
| `string`            | array of character                          | standard        |

### Records

``` vhdl title="record"
-- record declaration
type reg_type is record
    irq  : std_logic;
    pend : std_logic_vector(0 to 7);
    mask : std_logic_vector(0 to 7);
end record;

-- signal of declared record
signal r, rin : reg_type;
```

#### Multiple record example

``` vhdl title="m_record"
type value_type is record
    holdtime     : time;
    filename     : string(1 to 100);
    value        : integer;
end record;

type command_type is record
    action : std_logic_vector(1 downto 0);
    value  : value_type;
    busy   : std_logic;
end record;

constant init_value_type   : value_type   := (1 ps, (others => ' '), 0);
constant init_command_type : command_type := ((others => '0'), init_value_type, '0');
```

### Integer

``` vhdl title="type integer"
type    integer  is range -2147483648 to 2147483647   -- max 32bit
subtype natural  is range           0 to integer'high -- max 32bit
subtype positive is range           1 to integer'high -- max 32bit

signal int_free : integer;                 -- 32bit wide integer
signal int_5bit : integer range -16 to 15; -- 5bit integer
```

### Time

``` vhdl title="type time"
type time     is range -2147483648 to 2147483647 -- neg also possible
```

### `STD_(U)logic`

``` vhdl title="type std"
-- std_ulogic
-- only one driver per signal
type std_ulogic is ('U', -- Unitialized
                    'X', -- Forcing Unknown
                    '0', -- Forcing 0
                    '1', -- Forcing 1
                    'Z', -- High Impedance
                    'W', -- Weak Unknown
                    'L', -- Weak 0
                    'H', -- Weak 1
                    '-', -- Don't care
-- std_logic = resolved std_ulogic
-- allows more than one driver for Bidirectional busses
subtype std_logic is resolved std_ulogic;
```

### `STD_(U)logic_vector`

``` vhdl title="type std_vector"
type  std_ulogic_vector is array (natural range <>) of std_ulogic;
type  std_logic_vector  is array (natural range <>) of std_logic;

std_logic_vector_sig <= "11"; --  3
```

### Unsigned

``` vhdl title="type unsigned"
type unsigned is array (natural range <>) of std_logic;

unsigned_sig <= "11"; --  3
unsigned_sig <= unsigned_sig + unsigned_sig;
                             + integer_sig;
```

### Signed

``` vhdl title="type signed"
type signed is array (natural range <>) of std_logic;

signed_sig   <= "11"; -- -1
signed_sig   <= signed_sig + signed_sig;
                           + integer_sig
```

## Operators

| Operator                          | Description             | Example |
| --------------------------------- | ----------------------- | --------------------------- |
| **Arithmetic** | | |
| `+`                               | Addition                | `y <= x + 1` |
| `-`                               | Substraction            | `y <= x - 1` |
| `*`                               | Multiplication          | `y <= x * 1` |
| `/`                               | Division                | `y <= x / 1` |
| `* *`                             | Power / Potenz          | `(2* *x'high DOWNTO 0)` |
| `abs`                             | absolute Value          | |
| `mod`                             | Module                  | |
| `rem`                             | rest of Division        | |
| **Just for vector types** | | |
| `sla`                             | Arith shift left        | `SHIFT_LEFT(BUS,nbr)` |
| `sra`                             | Arith shift right       | `SHIFT_RIGHT(Bus,nbr)` |
| `sll`                             | Logic shift left        | `(x sll 2)` |
| `srl`                             | Logic shift right       | `(x srl 2)` |
| **Comparison** | | |
| `=`                               | equal                   | `x =  y` |
| `/=`                              | inequal                 | `x /= y` |
| `<`                               | smaller                 | `x <  y` |
| `>`                               | larger                  | `x >  y` |
| `<=`                              | smaller equal           | `x <= y` |
| `>=`                              | larger equal            | `x >= y` |
| **Logic Operation on std_logic** | | |
| `and`                             | &                       | `x and  y` |
| `nand`                            | !&                      | `x nand y` |
| `or`                              | or                      | `x or   y` |
| `nor`                             | not or                  | `x nor  y` |
| `xor`                             | (+)                     | `x xor  y` |
| `not`                             | \~                      | `not(x)` |
| **Else** | | |
| `&`                               | Concatenation           | `y = x & z` |

![Operator usage](img/operator_usage.svg){.center}

### Resulting size

The result size of an operation

``` vhdl title="operation result size"
-- Binary
vector_sig  <= "1001";         -- 4 bits binary value
-- Hexadecimal
vector_sig  <= X"F";           -- 1 Hexadigit = 4 binary bits
-- Assignation
vector_sig  <= a;              -- a'length = Length of array A
vector_sig  <= a and b;        -- a'length = b'Length
boolean_sig <= a > b;          -- Boolean
vector_sig  <= a + b;          -- Maximum (A'Length, B'Length)
vector_sig  <= a * b;          -- A'Length + B'Length
```

## Functions

Functions are reusable pieces of code. A function cannot consume simulation time and has only one return parameter. See also [Procedure](syntax.md#procedure).

``` vhdl title="parity"
function parity_generator( din : std_ulogic_vector )
                           return std_ulogic is
    variable t : std_ulogic := '0';
begin
    for i in din'range loop
        t := t xor din(i);
    end loop;
    return t;
end parity_generator;

...

sig_par <= paritiy_generator(data_bus);
```

### Edge finding

``` vhdl title="edge"
rising_edge(clk)      (clk'event & clk = '1')
falling_edge(clk)     (clk'event & clk = '1')
```

### Conversion

``` vhdl title="conversion functions"
to_integer()          -- signed,unsigned return int
to_unsigned()         -- int             return unsigned
to_signed()           -- int             return signed
signed()              -- slv             return signed
unsigned()            -- slv             return unsigned
std_logic_vector()    -- signed,unsigned return slv
std_match(arg1, arg2) --                 return bool
```

### Resize

``` vhdl title="resize functions"
resize(sig, length)   -- unsigned        return unsigned
resize(sig, length)   -- signed          return signed
```

## Procedure

A procedure allows to reuse a piece of code. It has to be written in a package or between the process and it's beginning. A procedure can consume simulation time and can have as many in, out or inout signals/variables as wished. See also [Function](syntax.md#function)

If in the parameter list is a parameter without signal in front, it means that it has to assigned to a direct value or a variable. Mostly signals are used if as the interface and variables are used to give input- or output data.

``` vhdl title="parity generator"
procedure parity_generator( signal din : in  std_ulogic_vector;
                            signal par : out std_ulogic;
                            par_init   : in  std_ulogic
                          ) is
    variable t : std_ulogic := par_init;
begin
    for i in 0 to din'range loop
        t := t xor din(i);
    end loop;
    par <= t;
end parity_generator;

signal databus : std_logic_vector(31 downto 0) := x"3210"
signal par_bit : std_logic;

...

parity_generator(databus,par_bit, "0");
```

## Signal

``` vhdl title="signal assign"
DataOut <= ( 7 downto 4 => x"A",
             3 downto 2 => "01",
             1          => '1',
             others     =>'0');
```

### Attributes

More Attributes can be found at: [Attributes](syntax.md#attributes)

| Attribute         | Decription                           | Example        |
|-------------------|--------------------------------------|----------------|
| **Type based**    |                                      | `(10 DOWNTO 0)` |
| `T'base`          | Base type of type `T`                | `10`           |
| `T'left`          | Element left of type `T`             | `0`            |
| `T'right`         | Element right of type `T`            | `10`           |
| `T'high`          | Highest element of type `T`          | `0`            |
| `T'low`           | Lowest element of type `T`           |                |
| `T'pos(x)`        | Place `x` in type `T`                |                |
| `T'val(n)`        | Value of element at place `n` in `T` |                |
| `T'succ(x)`       | Element after `x` in `T`             |                |
| `T'pred(x)`       | Element before `x` in `T`            |                |
| `T'leftOf(x)`     | Element left of `x` in `T`           |                |
| `T'rightOf(x)`    | Element right of `x` in `T`          |                |
| **Vector based**  |                                      |                |
| `V'left`          | Element most left in vector `V`      | `10`           |
| `V'right`         | Element most right in vector `V`     | `0`            |
| `V'high`          | Highest element in vector `V`        | `10`           |
| `V'low`           | Lowest element in vector `V`         | `0`            |
| `V'range`         | range of vector `V`                  | `10 downto 0`  |
| `V'reverse_range` | inversed range of vector `V`         | `0 downto 10`  |
| `V'length`        | length of vector `V`                 | `11`           |

## Statements

### If

``` vhdl title="if"
if s0 = '0' and s1 = '0' then
    output <= in0;
elsif s0 = '1' and s1 = '0' then
    output <= in1;
elsif s0 = '0' and s1 = '1' then
    output <= in2;
elsif s0 = '1' and s1 = '1' then
    output <= in3;
else
    output <= 'X';
end if;
```

### Case

``` vhdl title="case"
case sel is
  when  "00"  =>  output <= in0;
  when  "01"  =>  output <= in1;
  when  "10"  =>  output <= in2;
  when  "11"  =>  output <= in3;
  when others =>  output <= 'X';
end case;
```

### With Select

``` vhdl title="with"
with sel  select
  output <= in0 when "00",
            in1 when "01",
            in2 when "10",
            in3 when "11",
            'X' when others;
```

## When

``` vhdl title="when"
output <= in0 when sel = "00"
     else in1 when sel = "01"
     else in2 when sel = "10"
     else in3 when sel = "11"
     else 'X';
```

### For

``` vhdl title="for loop"
for i in 1 to 8 loop
  output(i) <= input(i + 8);
end loop;

for i in input'range loop
  output(i) <= input(i);
end loop;
```

## Fixed & Floating Point Types

TODO

## Fixed Point Types

TODO

# Floating Point Types

TODO
