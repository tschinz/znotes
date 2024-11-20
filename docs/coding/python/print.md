---
tags:
- coding
- python
- print
---
# String Format Mini Language

```
format_spec ::=  [[fill]align][sign][#][0][width][,][.precision][type]
fill        ::=  <any character>
align       ::=  "<" | ">" | "=" | "^"
sign        ::=  "+" | "-" | " "
width       ::=  integer
precision   ::=  integer
type        ::=  "b" | "c" | "d" | "e" | "E" | "f" | "F" | "g" | "G" | "n" | "o" | "s" | "x" | "X" | "%"
```

```
"{" [field_name] ["!" conversion] [":" format_spec] "}"
   /                  "r"|"s"                     \
  /                   (r)epr                       \
arg_name              (s)tr                         \
| ("." attribute_name | "[" element_index "]")*      \
|        |                       |                    \
|     identifier         integer | index_string        |
|                                   (quotes            |
[identifier integer]                 not required)     |
                                                       |
 _____________________________________________________/ \________
/                                                                \
    ":" [[fill]align][sign][#][0][width][,][.precision][type]
 [default]--> < left    +   |  |  (int)       (int)      b base 2
 [default --> > right  [-]  |  |                         c character
 for         ^ center " "   |  \                         d base 10
 numbers]    =              |   `zero padding            e exponent (e)
                            |                            E exponent (E)
                           use 0b,0o,0x                  f fixed point
                            for 2  8 16                  F ^^(same)^^
                                            [default]--> g general (???)
                                                         G general 2 (?)
                                                         n number (general 3)
                                                         o base 8
                                                         s string
                                            (lower case) x base 16
                                            (upper case) X base 16
                                               (x100, f) % percentage
```

``` python
print("{:>6.5}".format(var))        # right aligned to 6 digits, precision 5 (5 numbers including point e.g. 0.123)

print("{:08}".format(var))          # filled up with 0 to 8 digits, 00001234

print("0x{:0x}".format(int(var)))     # in hex small case, 0x4d2
print("0x{:0X}".format(int(var)))     # in hex small case, 0x4D2

print("{:04x}".format(int(var)))     # in hex small case, 0x04d2
print("{:04X}".format(int(var)))     # in hex small case, 0x04D2
```

``` python
import numpy as np
float_array = np.linspace(1, 9999, num=10)
int_array   = np.linspace(1, 9999, num=10).astype(int)
string_array = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]

print("Choose Correct Placeholder")
for i in range(0,10):
  print(" | {2:>7} | {1:>7} | {0:>7.6} |".format(float_array[i], int_array[i], string_array[i]))

# Choose Correct Placeholder
#  |     One |       1 |     1.0 |
#  |     Two |    1111 | 1111.89 |
#  |   Three |    2222 | 2222.78 |
#  |    Four |    3333 | 3333.67 |
#  |    Five |    4444 | 4444.56 |
#  |     Six |    5555 | 5555.44 |
#  |   Seven |    6666 | 6666.33 |
#  |   Eight |    7777 | 7777.22 |
#  |    Nine |    8888 | 8888.11 |
#  |     Ten |    9999 |  9999.0 |

print("\nRight aligned to 7 digits, precision 6 (numbers including point e.g. 0.1234)")
for i in range(0,10):
  print(" | {:>7.6} | {:>7} | {:>7} |".format(float_array[i], int_array[i], string_array[i]))

# Right aligned to 7 digits, precision 6 (numbers including point e.g. 0.1234)
#  |     1.0 |       1 |     One |
#  | 1111.89 |    1111 |     Two |
#  | 2222.78 |    2222 |   Three |
#  | 3333.67 |    3333 |    Four |
#  | 4444.56 |    4444 |    Five |
#  | 5555.44 |    5555 |     Six |
#  | 6666.33 |    6666 |   Seven |
#  | 7777.22 |    7777 |   Eight |
#  | 8888.11 |    8888 |    Nine |
#  |  9999.0 |    9999 |     Ten |

print("\nLeft aligned to 7 digits, precision 6 (numbers including point e.g. 0.1234)")
for i in range(0,10):
  print(" | {:<7.6} | {:<7} | {:<7} |".format(float_array[i], int_array[i], string_array[i]))

# Left aligned to 7 digits, precision 6 (numbers including point e.g. 0.1234)
#  | 1.0     | 1       | One     |
#  | 1111.89 | 1111    | Two     |
#  | 2222.78 | 2222    | Three   |
#  | 3333.67 | 3333    | Four    |
#  | 4444.56 | 4444    | Five    |
#  | 5555.44 | 5555    | Six     |
#  | 6666.33 | 6666    | Seven   |
#  | 7777.22 | 7777    | Eight   |
#  | 8888.11 | 8888    | Nine    |
#  | 9999.0  | 9999    | Ten     |

print("\nFill up with "0" or "-" or "="")
for i in range(0,10):
  print(" | {:09.6} | {:->7} | {:=<7} |".format(float_array[i], int_array[i], string_array[i]))

# Fill up with "0" or "-" or "="
#  | 0000001.0 | ------1 | One==== |
#  | 001111.89 | ---1111 | Two==== |
#  | 002222.78 | ---2222 | Three== |
#  | 003333.67 | ---3333 | Four=== |
#  | 004444.56 | ---4444 | Five=== |
#  | 005555.44 | ---5555 | Six==== |
#  | 006666.33 | ---6666 | Seven== |
#  | 007777.22 | ---7777 | Eight== |
#  | 008888.11 | ---8888 | Nine=== |
#  | 0009999.0 | ---9999 | Ten==== |

print("\nPrint Hexadezimal stuff lower case")
for i in range(0,10):
  print(" | 0x{0:>7x} | 0x{0:07x} | 0x{0:x} |".format(int_array[i]))

# Print Hexadezimal stuff lower case
#  | 0x      1 | 0x0000001 | 0x1 |
#  | 0x    457 | 0x0000457 | 0x457 |
#  | 0x    8ae | 0x00008ae | 0x8ae |
#  | 0x    d05 | 0x0000d05 | 0xd05 |
#  | 0x   115c | 0x000115c | 0x115c |
#  | 0x   15b3 | 0x00015b3 | 0x15b3 |
#  | 0x   1a0a | 0x0001a0a | 0x1a0a |
#  | 0x   1e61 | 0x0001e61 | 0x1e61 |
#  | 0x   22b8 | 0x00022b8 | 0x22b8 |
#  | 0x   270f | 0x000270f | 0x270f |

print("\nPrint Hexadezimal stuff uppder case")
for i in range(0,10):
  print(" | 0x{0:>7X} | 0x{0:07X} | 0x{0:X} |".format(int_array[i]))

# Print Hexadezimal stuff uppder case
#  | 0x      1 | 0x0000001 | 0x1 |
#  | 0x    457 | 0x0000457 | 0x457 |
#  | 0x    8AE | 0x00008AE | 0x8AE |
#  | 0x    D05 | 0x0000D05 | 0xD05 |
#  | 0x   115C | 0x000115C | 0x115C |
#  | 0x   15B3 | 0x00015B3 | 0x15B3 |
#  | 0x   1A0A | 0x0001A0A | 0x1A0A |
#  | 0x   1E61 | 0x0001E61 | 0x1E61 |
#  | 0x   22B8 | 0x00022B8 | 0x22B8 |
#  | 0x   270F | 0x000270F | 0x270F |
```
