---
tags:
- tools
- numbat
- cli
- calculator
- uasge
---

# Cheatsheet of `numbat`

```
numbat

  █▄░█ █░█ █▀▄▀█ █▄▄ ▄▀█ ▀█▀    Numbat 1.12.0
  █░▀█ █▄█ █░▀░█ █▄█ █▀█ ░█░    https://numbat.dev/

>>>
```

## Numbers

### Integers
```numbat
12345
12_345               # optional decimal separators
```

### Floating point numbers
```numbat
0.234
.234                 # without the leading zero
```

### Scientific notation
```numbat
1.234e15
1.234e+15
1e-9
1.0e-9
```

### Bases
```numbat
0x2A                 # hexadecimal
0o52                 # octal
0b101010             # binary
```

### Special numbers
```numbat
NaN                  # Not a number
inf                  # Infinity
```

## Calculations
### Additions and Subtractions
```numbat
3 + (4 - 3)
```

### Multiplications and Divisions
```numbat
1920 / 16 * 9
1920 ÷ 16 × 9        # Unicode-style, '·' is also multiplication
2 pi                 # Whitespace is implicit multiplication
meter per second     # 'per' keyword can be used for division
```

### Exponential
```numbat
2^3
2^-3                 # Negative exponents
2**3                 # Python-style
2³                   # Unicode exponents
```


### Factorial
```numbat
5!
```

### Comparison
```numbat
3 < 4                # Less than
4 <= 4               # Less than or equal
4 > 3                # Greater than
4 >= 4               # Greater than or equal
4 == 4               # Equal
3 != 4               # Not equal
```

### Logical
```numbat
!x                   # Logical NOT
x && y               # Logical AND
x || y               # Logical OR
```

## Units
[Full list](https://numbat.dev/doc/list-units.html)

### Most common units
```numbat
42 deg               # degree
42 grad              # gradian
42 rad               # radian
42 rev               # revolution

42 bit               # bit
42 byte              # byte
42 B                 # byte
42 KiB               # kibibyte
42 MiB               # mebibyte
42 GiB               # gibibyte

42 kB                # kilobyte
42 MB                # megabyte
42 GB                # gigabyte

42 dots              # dots
42 dpi               # dots per inch
```

### Prefixes
[Metric prefixes](https://en.wikipedia.org/wiki/Metric_prefix)
[Binary prefixex](https://en.wikipedia.org/wiki/Binary_prefix)

| Prefix | Description | Prefix | Description |
|--------|-------------|--------|-------------|
| `Q`    | Quetta      | `d`    | deci        |
| `R`    | Rotta       | `c`    | centi       |
| `Y`    | Yotta       | `m`    | milli       |
| `Z`    | Zetta       | `μ`    | micro       |
| `E`    | Exa         | `n`    | nano        |
| `P`    | Peta        | `p`    | pico        |
| `T`    | Tera        | `f`    | femto       |
| `G`    | Giga        | `a`    | atto        |
| `M`    | Mega        | `z`    | zepto       |
| `k`    | kilo        | `y`    | yocto       |
| `h`    | hecto       | `r`    | ronto       |
| `da`   | deca        | `q`    | quecto      |

## Conversion
### Units
```numbat
42 in -> cm        # Unit conversion, can also be → or ➞
42 in to cm        # Unit conversion with the 'to' keyword
120 km/h -> mph
```

### Convert to the same unit
```numbat
let x1 = 50 km / h
let x2 = 3 m/s -> x1
```

### Bases
```numbat
42 -> bin
42 -> oct
42 -> dec
42 -> hex
42 -> char

42 -> base(2)
42 -> base(8)
42 -> base(10)
42 -> base(16)

bin(42)
oct(42)
dec(42)
hex(42)
```

### Time
```numbat
now() -> unixtime
now() -> tz("Europe/Berlin")
```

### Strings
```numbat
"Numbat is Awesome" -> uppercase
"Numbat is Awesome" -> lowercase
```

## Functions
```numbat
# Pure functions
fn area_circle(radius) = pi * radius^2

area_circle(1)
area_circle(1m)

# Function with types
fn area_circle(radius: Length) -> Area = pi * radius^2

area_circle(1)   # Error: expected Length
area_circle(1s)  # Error: expected Length
area_circle(1m)  # Ok

# Recursive functions
fn fib(n: Scalar) -> Scalar =
  if n ≤ 2
    then 1
    else fib(n - 2) + fib(n - 1)
```

## Conditional
```numbat
if <cond> then <expr1> else <expr2>

fn step(x: Scalar) -> Scalar = if x < 0 then 0 else 1
```

## Date and Time
```numbat
date("20-10-05")                     # specific date
time("12:30:05")                     # specific time
datetime("20-10-05 12:30:05.00000")  # specific date and time
```

Possible formats:
```numbat
%Y-%m-%d %H:%M:%S%.f
```

### Date Time Calculation
```numbat
now()                                # current time

now() - 40 days + 1 hour             # current time minus 40 days and plus 1 hour

date("2024-06-20") - today() -> days # days until 2024-06-20
```

### Unixtime
```numbat
now() -> unixtime                    # current time in unixtime
from_unixtime(1_718_901_719)         # convert unixtime to date
```

### Formatting

`format_datetime(format: String, dt: DateTime)`

```numbat
x = datetime("20-10-05 12:30:05")
format_datetime("%Y-%m-%d %Hh%Mm%Ss.%f", x)
```

# Timezones

```numbat
get_local_timezone()                 # get local timezone aka Europe/Zurich

now() -> tz("Europe/Zurich")
now() -> tz("CET")
now() -> tz("UTC")
```

### Date `date("")`
`date("yyyy-mm-dd")` is a function that converts the current time to the specified date.


### Timezones `tz("")`
`tz("xxx/xxx")` is a function that converts the current time to the specified timezone.

![](img/World_Time_Zones_Map.png){.center width="100%"}

| Abbreviation        | Description                | Timezone    |
|---------------------|----------------------------|-------------|
| `MST`,              | Mountain Standard Time     | `UTC -0700` |
| `EST`,              | Eastern Standard Time      | `UTC -0500` |
| `UTC`, `UCT`, `GMT` | Coordinated Universal Time | `UTC +0000` |
| `WET`               | Western European Time      | `UTC +0100` |
| `CET`, `MET`        | Central Europe Time        | `UTC +0200` |
| `NZ`                | New Zealand                | `UTC +1200` |

| Location                 | Timezone    |
|--------------------------|-------------|
| `Pacific/Niue`           | `UTC -1100` |
| `Pacific/Tahiti`         | `UTC -1000` |
| `Pacific/Gambier`        | `UTC -0900` |
| `Pacific/Pitcairn`       | `UTC -0800` |
| `Pacific/Galapagos`      | `UTC -0600` |
| `America/Lima`           | `UTC -0500` |
| `America/Guyana`         | `UTC -0400` |
| `America/Sao_Paulo`      | `UTC -0300` |
| `Atlantic/South_Georgia` | `UTC -0200` |
| `Atlantic/Cape_Verde`    | `UTC -0100` |
| `UTC`                    | `UTC -0000` |
| `Portugal`               | `UTC +0100` |
| `Europe/Zurich`          | `UTC +0200` |
| `Europe/Helsinki`        | `UTC +0300` |
| `Asia/Dubai`             | `UTC +0400` |
| `Asia/Kabul`             | `UTC +0430` |
| `Asia/Kolkata`           | `UTC +0530` |
| `Asia/Kathmandu`         | `UTC +0545` |
| `Asia/Dhaka`             | `UTC +0600` |
| `Asia/Yangon`            | `UTC +0630` |
| `Asia/Bangkok`           | `UTC +0700` |
| `Asia/Shanghai`          | `UTC +0800` |
| `Asia/Tokyo`             | `UTC +0900` |
| `Australia/Sydney`       | `UTC +1000` |
| `Pacific/Norfolk`        | `UTC +1100` |
| `Pacific/Auckland`       | `UTC +1200` |

Start typing `tz("`, then press `Tab` to see a list of available timezones.

```numbat
Africa/...            Island                MET
America/...           Singapore             MST
Asia/...              Turkey                NZ
Atlantic/...          Hongkong              PRC
Europe/...            Cuba                  ROC
Pacific/...           Poland                ROK
India/...             Portugal              EST
Antarctica/...                              GMT
Arctic/...                                  UTC
Canada/...                                  WET
Brazil/...                                  UCT
Chile/...
US/...
```

## Print
```numbat
let radius: Length = sqrt(footballfield / 4 pi) -> meter

print("A football field would fit on a sphere of radius {radius}")
```

## Structs
```numbat
let hydrogen = Element {
    name: "Hydrogen",
    atomic_number: 1,
    density: 0.08988 g/L,
}

hydrogen.density
```

# Unit Definitions
```numbat
unit barleycorn : Length = inch/3
unit poppyseed  : Length = barleycorn / 4
unit tod        : Mass   = stone*2

2048 grain / poppyseed² => tod / yard²
```

## Dimensions
[List of all Dimensions](https://numbat.dev/doc/list-units.html)
```numbat
unit second : Time
unit bit : DigitalInformation
unit bps : DataRate
unit Hz: Frequency
unit meter : Length
unit kilogram : Mass
unit ampere : Current
unit kelvin : Temperature
unit mole : AmountOfSubstance
unit Radian : Angle
unit CHF : Money
unit bar : Pressure
unit Litre : Volume
unit kph : Velocity
unit jule: Energy
```