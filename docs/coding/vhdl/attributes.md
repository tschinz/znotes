---
tags:
- coding
- vhdl
- attributes
---
# Attributes

Attributes are a feature of VHDL that allow you to extract additional information about an object (such as a signal, variable or type) that may not be directly related to the value that the object carries. Attributes also allow you to assign additional information (such as data related to synthesis) to objects in your design description.

## Predefined attributes

The VHDL specification describes five fundamental kinds of attributes.

- a value
- a function
- a signal
- a type
- a range.

Predefined attributes are always applied to a prefix (such as a signal or variable name, or a type or subtype name), as in the statement:

```
wait until Clk = '1' and Clk'event and Clk'last_value = ‘0’;
```

Some attributes also include parameters, so they are written in much the same way you would write a call to a function:

``` vhdl
variable V: state_type := state_type'val(2); -- V has the value of Strobe
```

In this case, the attribute 'val has been applied to the prefix state_type (which is a type name) and has been given an attribute parameter, the integer value 2.

### Value kind attributes

`'Left`, `'Right`, `'High`, `'Low`, `'Length`, `'Ascending`

The value kind attributes that return an explicit value and are applied to a type or subtype include the following:

#### `'left`

`'Left` This attribute returns the left-most element index (the bound) of a given type or subtype.

``` vhdl
type bit_array is array (1 to 5) of bit;

variable L: integer := bit_array'left; -- L has a value of 1
```

#### `'right`

`'Right` Returns the right-most bound of a given type or subtype.

``` vhdl
type bit_array is array (1 to 5) of bit;

variable R: integer := bit_array'right; -- R has a value of 5
```

#### `'high`

`'High` returns the upper bound of a given scalar type or subtype.

``` vhdl
type bit_array is array(-15 to +15) of bit;

variable H: integer := bit_array'high; -- H has a value of 15
```

#### `'low`

`'Low` returns the upper bound of a given scalar type or subtype.

``` vhdl
type bit_array is array(15 downto 0) of bit;

variable L: integer := bit_array'low; -- L has a value of 0
```

#### `'length`

`'Length` returns the length (number of elements) of an array.

``` vhdl
type bit_array is array (0 to 31) of bit;

variable LEN: integer := bit_array'length; -- LEN has a value of 32
```

#### `'ascending`

`'Ascending` (VHDL '93 attribute) returns a boolean true value of the type or subtype is declared with an ascending range.

``` vhdl
type asc_array is array (0 to 31) of bit;

type desc_array is array (36 downto 4) of bit;
variable A1: boolean := asc_array'ascending;  -- A1 has a value of true
variable A2: boolean := desc_array'ascending; -- A2 has a value of false
```

#### `'structure` & `'behaviour`

There are two additional value kind attributes that can be used to determine information about blocks or attributes in a design. These attributes, 'structure and 'behavior, return true or false values depending on whether the block or architecture being referenced includ s
references to lower-level components. The `‘structure` attribute retur s
true if there are references to lower-level components, and false if there are no references to lower-level components. The `‘behavior` attribute returns false if there are references to lower-level components, and true if there are no references to lower-level components.

`'Structure` returns a true value if the prefix (which must be an architecture name) includes references to lower-level components.

`'Behavior` returns a true value if the prefix (which must be an architecture name) does not include references to lower-level components.

#### `'simple_name` & `'instance_name` & `'path_name`

VHDL 1076-1993 added three attributes that can be used to determine the precise configuration of entities in a design description. These attributes return information about named entities, which are various items that become associated with identifiers, character literals or operator symbols as the result of a declaration.

`'Simple_name` returns a string value corresponding to the prefix, which must be a named entity.

`'Instance_name` returns a string value corresponding to the complete path (from the design hierarchy root) to the named entity specified in the prefix, including the names of all instantiated design entities. The string returned by this attribute has a fixed format that is defined in the IEEE VHDL Language Reference Manual.

`'Path_name` returns a string value corresponding to the complete path (from the design hierarchy root) to the named entity specified in the prefix. The string returned by this attribute has a fixed format that is defined in the IEEE VHDL Language Reference Manual.

### Function kind attributes 1

`'Pos`, `'Val`, `'Succ`, `'Pred`, `'Leftof`, `'Rightof`

Attributes that return information about a given type, signal, or array value are called function kind attributes. VHDL defines the following function kind attributes that can be applied to types:

#### `'pos(value)`

`'Pos(value)` returns the position number of a type value.

``` vhdl
type state_type is (Init, Hold, Strobe, Read, Idle);

variable P: integer := state_type'pos(Read); -- P has the value of 3
```

#### `'val(value)`

`'Val(value)` returns the value corresponding to a position number of a type value.

``` vhdl
type state_type is (Init, Hold, Strobe, Read, Idle);

variable V: state_type := state_type'val(2); -- V has the value of Strobe
```

#### `'succ(value)`

`'Succ(value)` returns the value corresponding to position number after a given type value.

``` vhdl
type state_type is (Init, Hold, Strobe, Read, Idle);

variable V: state_type := state_type'succ(Init); -- V has the value of Hold
```

#### `'pred(value)`

`'Pred(value)` returns the value corresponding to position number preceding a given type value.

``` vhdl
type state_type is (Init, Hold, Strobe, Read, Idle);

variable V: state_type := state_type'pred(Hold); -- V has the value of Init
```

#### `'leftof(value)`

`'Leftof(value)` returns the value corresponding to position number to the left of a given type value.

``` vhdl
type state_type is (Init, Hold, Strobe, Read, Idle);

variable V: state_type := state_type'leftof(Idle); -- V has the value of Read
```

#### `'rightof(value)`

`'Rightof(value)` returns the value corresponding to position number to the right of a given type value.

``` vhdl
type state_type is (Init, Hold, Strobe, Read, Idle);

variable V: state_type := state_type'rightof(Read); -- V has the value of Idle
```

From the above descriptions, it might appear that the `'val` and `'succ` attributes are equivalent to the attributes `‘leftof` and `‘rightof`. One case where they would be different is the case where a subtype is defined that changes the ordering of the base type:

``` vhdl
type state_type is (Init, Hold, Strobe, Read, Idle);
subtype reverse_state_type is state_type range Idle downto Init;
variable V1: reverse_state_type := reverse_state_type'leftof(Hold);
-- V1 has the value of Strobe
variable V2: reverse_state_type := reverse_state_type'pred(Hold);
-- V2 has the value of Init
```

### Function kind array attributes

`'Left`, `'Right`, `'High`, `'Low`

The function kind attributes that can be applied to array objects include:

#### `'left()`

`'Left(value)` returns the index value corresponding to the left bound of a given array range.

Example:

``` vhdl
type bit_array is array (15 downto 0) of bit;

variable I: integer := bit_array'left(bit_array'range); -- I has the value of 15
```

#### `'right()`

`'Right(value)` returns the index value corresponding to the right bound of a given array range.

``` vhdl
type bit_array is array (15 downto 0) of bit;

variable I: integer := bit_array'right(bit_array'range); -- I has the value of 0
```

#### `'high()`

`'High(value)` returns the index value corresponding to the upper-most bound of a given array range.

``` vhdl
type bit_array is array (15 downto 0) of bit;

variable I: integer := bit_array'high(bit_array'range); -- I has the value of 15
```

#### `'low()`

`'Low(value)` returns the index value corresponding to the lower bound of a given array range.

``` vhdl
type bit_array is array (15 downto 0) of bit;

variable I: integer := bit_array'low(bit_array'range); -- I has the value of 0
```

`'Event`, `'Active`, `'Last_event`, `'Last_value`, `'Last_active`

Function kind attributes that return information about signals (such as whether that signal has changed its value or its previous value) include:

#### `'event`

`'Event` returns a true value of the signal had an event (changed its value) in the current simulation delta cycle.

``` vhdl
process(Rst,Clk)
begin
  if Rst = '1' then
    Q <= '0';
  elsif Clk = '1' and Clk'event then -- Look for clock edge
    Q <= D;
  end if;
end process;
```

#### `'active`

Active---returns true if any transaction (scheduled event) occurred on this signal in the current simulation delta cycle.

``` vhdl
process
  variable A,E: boolean;
begin
  Q <= D after 10 ns;
  A := Q'active; -- A gets a value of True
  E := Q'event;  -- E gets a value of False
  . . .
end process;
```

#### `'last_event`

`'Last_event` returns the time elapsed since the previous event occurring on this signal.

``` vhdl
process
  variable T: time;
begin
  Q <= D after 5 ns;
  wait 10 ns;
  T := Q'last_event; -- T gets a value of 5 ns
  . . .
end process;
```

#### `'last_value`

`'Last_value` returns the value of the signal prior to the last event.

``` vhdl
process
  variable V: bit;
begin
  Q <= '1';
  wait 10 ns;
  Q <= '0';
  wait 10 ns;
  V := Q'last_value; -- V gets a value of  '1'
  . . .
end process;
```

#### `'last_active`

`'Last_active` returns the time elapsed since the last transaction (scheduled event) of the signal.

``` vhdl
process
  variable T: time;
begin
  Q <= D after 30 ns;
  wait 10 ns;
  T := Q'last_active; -- T gets a value of 10 ns
  . . .
end process;
```

Note: the `'active`, `'last_event`, `'last_value` and `'last_active` attributes are not generally supported in synthesis tools. Of the preceding five attributes, only 'event should be used when describing synthesizable registered circuits. The `‘active`, `‘last_event`, `‘last_value` and `‘last_active` attributes should only be used to describe circuits for test purposes (such as for setup and hold checking). If they are encountered by a synthesis program, they will either be ignored, or the program will return an error and halt operation.

### Function kind attributes 2

`'Image`, `'Value`

The `'image` and `'value` attributes were added in the 1993 specification to simplify the reporting of information through Text I/O. These attributes both return string results corresponding to their parameter values.

#### `'image`

`'Image(expression)` (VHDL '93 attribute) returns a string representation of the expression parameter, which must be of a type corresponding to the attribute prefix.

```
assert (Data.Q = '1')
report "Test failed on vector " & integer’image(vector_idx)
severity WARNING;
```

``` vhdl
string_signal <= std_logic'image(sl_signal);
```

#### `'value`

`'Value(string)` (VHDL '93 attribute) returns a value, of a type specified by the prefix, corresponding to the parameter string.

``` vhdl
write(a_outbuf,string'("Enter desired state e.g.: S1"));
writeline(OUTPUT,a_outbuf);
readline(INPUT,a_inbuf);
read(a_inbuf,instate);      -- instate is a string type

-- convert string to type state_type
next_state <= state_type'value(instate);

write(a_outbuf,string'("Enter duration (e.g.: 15)"));
writeline(OUTPUT,a_outbuf);
readline(INPUT,a_inbuf);
read(a_inbuf,induration);   -- induration is a string type

-- convert string to type integer
duration <= integer'value(induration);
```

### Signal kind attributes

`'Delayed`, `'Stable`, `'Quiet`, `'Transaction`

The signal kind attributes are attributes that, when invoked, create special signals that have values and types based on other signals. These special signals can then be used anywhere in the design description that a normally declared signal could be used. One example of where you might use such an attribute is to create a series of delayed clock signals that are all based on the waveform of a base clock signal.
Signal kind attributes include the following:

#### `'delayed(time)`

`'Delayed(time)` creates a delayed signal that is identical in waveform to the signal the attribute is applied to. (The time parameter is optional, and may be omitted.)

```
process(Clk'delayed(hold))
-- Hold time check for input Data
begin
  if Clk = '1' and Clk'stable(hold) then
    assert(Data’stable(hold))
      report "Data input failed hold time check!"
    severity warning;
  end if;
end process;
```

#### `'stable(time)`

`'Stable(time)` creates a signal of type boolean that becomes true when the signal is stable (has no event) for some given period of time.

``` vhdl
process
  variable A: Boolean;
begin
  wait for 30 ns;
  Q <= D after 30 ns;
  wait 10 ns;
  A := Q'stable(20 ns);
  -- A gets a value of true (event has not yet occurred)
  wait 30 ns;
  A := Q'stable(20 ns);
  -- A gets a value of false (only 10 ns since event)
  . . .
end process;
```

#### `'quite(time)`

`'Quiet(time)` creates a signal of type boolean that becomes true when the signal has no transactions (scheduled events) or actual events for some given period of time.

``` vhdl
process
  variable A: Boolean;
begin
  wait for 30 ns;
  Q <= D after 30 ns;
  wait 10 ns;
  A := Q'quiet(20 ns);
  -- A gets a value of false (10 ns since transaction)
  wait 40 ns;
  A := Q'quiet(20 ns);
  -- A finally gets a value of true (20 ns since event)
  . . .
end process;
```

#### `'transaction`

`'Transaction` creates a signal of type bit that toggles its value whenever a transaction or actual event occurs on the signal the attribute is applied to.

### Type kind attributes

#### `'base`

`'Base` returns the base type for a given type or subtype.

``` vhdl
type mlv7 is ('0','1','X','Z','H','L','W');
subtype mlv4 is mlv7 range '0' to 'Z';
variable V1: mlv4 := mlv4'right;         -- V1 has the value of 'Z'
variable V2: mlv7 := mlv4'base'right;    -- V2 has the value of 'W'
variable I1: integer := mlv4'width;      -- I1 has the value of 4
variable I2: integer := mlv4'base'width; -- I2 has the value of 7
```

### Range kind attributes

`'Range`, `'Reverse_range`

The range kind attributes return a special value that is a range, such as you might use in a declaration or looping scheme.

#### `'range`

`'Range` returns the range value for a constrained array.

``` vhdl
function parity(D: std_logic_vector)
return std_logic is
  variable result: std_logic := '0';
begin
  for i in D'range loop
    result := result xor D(i);
  end loop;
  return result;
end parity;
```

#### `'reverse_range`

`'Reverse_range` returns the reverse of the range value for a constrained array.

``` vhdl
STRIPX: for i in D'reverse_range loop
  if D(i) = 'X' then
    D(i) = '0';
  else
    exit;  -- only strip the terminating Xs
  end if;
end loop;
```

## Custom attributes

Custom attributes are those attributes that are not defined in the IEEE specifications, but that you (or your simulation or synthesis tool vendor) define for your own use. A good example is the attribute enum_encoding, which is provided by a number of synthesis tool vendors (most notably Synopsys) to allow specific binary encodings to be attached to objects of enumerated types.

An attribute such as enum_encoding is declared using the following method:

``` vhdl
attribute enum_encoding: string;
```

Once the attribute has been declared and given a name, it can be referenced as needed in the design description:

``` vhdl
type statevalue is (INIT, IDLE, READ, WRITE, ERROR);
attribute enum_encoding of statevalue: type is "000 001 011 010 110";
```

Custom attributes are a convenient "back door" feature of VHDL, and design tool vendors have created many such attributes to give you more control over the synthesis and simulation process. For detailed information about custom attributes, refer to your design tool documentation.
