---
tags:
- coding
- c++
- c
- syntax
---
# Syntax

## For

``` cpp
for(int i = 0; i <= max; i++)
{
}
```

## Bitwise Operations
### Setting a bit
Use the bitwise OR operator `|` to set a bit.

``` cpp
number |= 1 << x;             // That will set bit x
```

### Clearing a bit
Use the bitwise AND operator `&` to clear a bit.

``` cpp
number &= ~(1 << x);          // That will clear bit x
```

You must invert the bit string with the bitwise NOT operator (\~), then AND it.

### Toggling a bit
The XOR operator `^` can be used to toggle a bit.

``` cpp
number ^= 1 << x;            // That will toggle bit x
```

### Checking a bit
To check a bit, AND it with the bit you want to check:

``` cpp
bit = number & (1 << x);     // Put value of bit x into variable bit
```

## Functions
### sprintf()
`sprintf()` takes several variables and string parts and fuses them into one string.

``` cpp
int sprintf( char * buffer, const char * format [ , argument , ...] );
```

With the help of flags variable can be fused together.

``` cpp
%[flags][width][.precision][modifiers]type
```

#### Type
| Type         | Description             | Example |
|--------------|-------------------------|---------------------------------- |
| `%c`         | Character               |  `a` |
| `%s`         | String of characters    |  `"string"` |
| `%d` or `%i` | Signed decimal int      |  `-123456` |
| `%e` or `%E` | Scientific notation using e or E character | `3.14159e2` or `3.14159E2` |
| `%f`         | Decimal floating point (floats) |  `123.456` |
| `%u`         | Unsigned decimal integer | `123456` |
| `%o`         | Signed octal             | `1234568` |
| `%x` or `%X` | Unsigned hexadecimalinteger | `1234cdef` or `1234CDEF` |
| `%p`         | Address pointed by the argument |`B800:0000` |
| `%n`         | Nothing printed          | The argument must be a pointer to integer where the number of characters written so far will be  |stored

#### Flags
| Flags    |  Description                                              |
|----------|-----------------------------------------------------------|
| `-`      | Left align the with given width(right is default)         |
| `+`      | Forces to preced with positive/negative sign(- is default)|
| `blank`  | If the arg is + signed then a blank is inserted before    |
| `#`      | 1.  Used with f, e, E makes output contain decimal <br> 2.  Used with x, X, o value is preced with 0, 0x, 0X |

#### Width
| Width      | Description
| Width      | Description
| -----------| -------------------------------------------------------------|
| `number`   | Minimum number of characters to be printed. If the value to be printed is shorter than this number the result is padded with |blanks. The value is never truncated even if the result is larger |
| `0number`  | Same as above but filled with 0s instead of blanks |
| `*`        | The width is not specified in the format string, it is specified by an integer value preceding the argument thas has to be formatted |

#### Precision

- for `d`, `i`, `o`, `u`, `x`, `X` types: precision specifies the minimum number of decimal digits to be printed. If the value to be printed is shorter than this number the result is padded with blanks. The value is never truncated even if the result is larger.(if nothing specified default is 1).
- for `e`, `E`, `f` types: number of digits to be printed after de decimal point. (if nothing specified default is 6).
- for `g`, `G` types : maximum number of significant numbers to be printed.
- for `s` type: maximum number of characters to be printed. (default is to print until first null character is encountered).
- for `c` type : (no effect).

#### Modifier

| Modifier  | Description |
| ----------| -------------------------------------------------------- |
| `h`       | Interpreted as a short int |
| `l`       | Interpreted as a long int(integers) or double (floats) |
| `L`       | Interpreted as a long double(floats) |
