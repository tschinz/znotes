---
tags:
- coding
- swift
---
# Basics

## Comments

``` swift
// This is a comment
/* This is a multiline comment
/* Did you know /* you can nest multiline comments */ ? */
```

### Comment Links

``` swift
// MARK: Test appears in Xcode selector
// TODO: Write your todo here
// FIXME: Write your bug here (or fix is directly)
```

### Comment Markdown

``` swift
//: This is Markdown documentation inside the code
//: ## Markdown Title
//: [link description](link)
//: ![image description](img/location.png)
```

## Types

For a complete guide to 64-bit changes, please [see the transition document](https://developer.apple.com/library/mac/documentation/Darwin/Conceptual/64bitPorting/transition/transition.html#//apple_ref/doc/uid/TP40001064-CH207-TPXREF101).

### Default Swift Types

| Swift Type                                 | Values |
| ------------------------------------------ | ---------------------------------------------- |
| `Int`, `Int32`, `Int64`, `UInt8`, `UInt16` | `100` Dezimal `1_000_000` Dezimal `0b1001` Binary `0o85` Octal `0xFFE3` Hexadezimal |
| `Double`                                   | `3.14159265` `3.141_592_65` `1.25e2 = 125.0` `1.25e-2 == 0.0125` |
| `Bool`                                     | `true` `false` |
| `String`                                   | `"This is a String"`<br> `"This is a String including a \ (varname)"` |

### C-Types vs Swift Types

| C Type             | Swift Type |
| ------------------ | ---------- |
| bool               | CBool |
| char, signed char  | CChar |
| unsigned char      | CUnsignedChar |
| short              | CShort |
| unsigned short     | CUnsignedShort |
| int                | CInt |
| unsigned int       | CUnsignedInt |
| long               | CLong |
| unsigned long      | CUnsignedLong |
| long long          | CLongLong |
| unsigned long long | CUnsignedLongLong |
| wchar_t            | CWideChar |
| char16_t           | CChar16 |
| vchar32_t          | CChar32 |
| float              | CFloat |
| double             | CDouble |

From the [docs](https://developer.apple.com/library/ios/documentation/swift/conceptual/buildingcocoaapps/InteractingWithCAPIs.html)

## Operators

Swift supports most standard C operators and improves several capabilities to eliminate common coding errors.

Arithmetic operators (`+`, `-`, `*`, `/`, `%` and so forth) detect and disallow value overflow, to avoid unexpected results when working with numbers that become larger or smaller than the allowed value range of the type that stores them.

### Arithmetic Operators

| Operator | Purpose |
| -------- | ------- |
| `+`      | Addition |
| `-`      | Substraction |
| `*`      | Multiplication |
| `/`      | Division |
| `%`      | Remainder also work on float `8 % 2.5 // equals 0.5` |

### Comparative Operators

| Operator | Purpose |
| -------- | ------- |
| `==`     | Equal to |
| `===`    | Identical to |
| `!=`     | Not equal to |
| `!==`    | Not identical to |
| `~=`     | Pattern match |
| `>`      | Greater than |
| `<`      | Less than |
| `>=`     | Greate than or equal to |
| `<=`     | Less than or equal to |

### Assignment Operators

| Operator | Purpose |
| -------- | ------- |
| `=`      | Assign |
| `+=`     | Addition |
| `-=`     | Subtraction |
| `\*=`    | Multiplication |
| `/=`     | Division |
| `%=`     | Remainder |
| `&=`     | Bitwise AND |
| `|=`     | Bitwise Inclusive OR |
| `^=`     | Exclusive OR |
| `<<=`    | Shift Left |
| `>>=`    | Shift Right |
| `&&=`    | Logical AND |
| `||=`    | Logical OR |

### Increment and Decrement Operators

| Operator | Purpose |
| -------- | ------- |
| `++`     | Addition |
| `--`     | Subtraction |

``` swift
++x //increments variable **before** returning it's value
x-- //increments variable **after** returning it's value
```

### Logical Operators

| Operator | Purpose |
| -------- | ------- |
| `!`      | NOT |
| `&&`     | Logical AND |
| `||`     | Logical OR |

### Range Operators

| Operator | Purpose |
| -------- | ------- |
| `..<`    | Half-open range |
| `...`    | Closed range |

``` swift
for index in 1..<3 {} // 1 to 3 excluding 3
for index in 1...3 {} // 1 to 3 inluding 3
```

### Bitwise Operators

| Operator | Purpose |
| -------- | ------- |
| `&`      | Bitwise AND |
| `|`      | Bitwise Inclusive OR |
| `^`      | Exclusive OR |
| `~`      | Unary complement (bit inversion) |
| `<<`     | Shift Left |
| `>>`     | Shift Right |

### Overflow and Underflow Operators

Typically, assigning or increment an integer, float, or double past it's range would result in a run-time error. However, if you'd instead prefer to safely truncate the number of available bits, you can opt-in to have the variable overflow or underflow using the following operators:

| Operator | Purpose |
| -------- | ------- |
| `&+`     | Addition |
| `&-`     | Subtraction |
| `&*`     | Multiplication |
| `&/`     | Division |
| `&%`     | Remainder |

Example for unsigned integers (works similarly for signed):

``` swift
var willOverflow = UInt8.max       // willOverflow = 255
willOverflow = willOverflow &+ 1   // willOverflow = 0

var willUnderflow = UInt8.min      // willUnderflow = 0
willUnderflow = willUnderflow &- 1 // willUnderflow = 255
```

Another example to show how you can prevent dividing by zero from resulting in infinity:

``` swift
let x = 1
let y = x &/ 0 // Division by zero y = 0
```

### Other Operators

| Operator | Purpose |
| -------- | -------------------------------------------------------- |
| ??       | Nil coalescing (take left if not nil else right value) |
| ?:       | Ternary conditional |
| !        | Force unwrap object value |
| ?        | Safely unwrap object value |