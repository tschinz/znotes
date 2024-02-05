---
tags:
- coding
- scala
---
# Basics

## Comments

``` scala
// Singleline Comment
/*
Multiline
Comment
*/
```

## Types

| Type           | Description                                      | Range |
| -------------- | ------------------------------------------------ | --------------------------------- |
| `Byte`         | `8 bit` signed value                             | `-128` to `127` |
| `Short`        | `16 bit` signed value                            | `-32768` to `32767` |
| `Int`          | `32 bit` signed value                            | `-2147483648` to `2147483647` |
| `BitInt`       | Very big integer signed value                    | |
| `Long`         | `64 bit` signed value                            | `-9223372036854775808` to `9223372036854775807` |
| `Float`        | `32 bit` IEEE 754 single-precision float         | `-3.4028235E38` to `3.4028235E38` |
| `Double`       | `64 bit` IEEE 754 double-precision float         | `-1.7976931348623157E308`to `1.7976931348623157E308` |
| `BitDecimal`   | Very big floatingpoint value                     | |
| `Char`         | `16 bit` unsigned Unicode character              | `U+0000` to `U+FFFF` |
| `String`       | A sequence of Chars                              | |
| `Boolean`      | Either the literal true or the literal false     | `true`, `false` |
| `Unit`         | Corresponds to no value                          | |
| `Null`         | null or empty reference                          | |

### Array

Fixed length array

``` scala
val favNums = new Array[Int](20)

val friends = Array("Bob", "Alice")
friends(0) = "Maja"
```

### ArrayBuffer

Array of undefined length

``` scala
val friends = ArrayBuffer[String]()
friends.insert(0, "Maja")
friends += "Katja"

friends ++= Array("Bob", "Alice")

friends.insert(2, "Maja", "Katja")

friends.remove(2,3)
```

## Operators

In all examples

``` scala
var a = 10
var b = 20
```

### Arithmetic

| Operator   | Description                             | Example |
| ---------- | --------------------------------------- | -------------------------- |
| `+`        | Adds two operands                       | `a + b => 30` |
| `-`        | Subtracts second operand from the first | `a - b => -10` |
| `*`        | Multiplies both operands                | `a * b => 200` |
| `/`        | Divides numerator by the de-numerator   | `b / a => 2` |
| `%`        | Modulus operator finds the remainer after division of one number by another | `b % a => 0` |

### Relational

| Operator   | Description                                                 | Example |
| ---------- | ----------------------------------------------------------- | ----------------------- |
| `==`       | Checks if values if two operands are equal                  | `a == b => false` |
| `!=`       | Checks if values of two operands are not equal              | `a != b => true` |
| `>`        | Checks if left operands is greater than the right           | `a > b => false` |
| `<`        | Checks if left operands is less than the right              | `a < b => true` |
| `>=`       | Checks if left operands is greater or equal than the right  | `a >= b => false` |
| `<=`       | Checks if left operands is less or equal than the right     | `a <= b => true` |


### Logical

| Operator   | Description                              | Example |
| ---------- | ---------------------------------------- | ----------------------- |
| `&&`       | It is called Logical AND operator        | `(a && b) => false` |
| `||`       | It is called Logical OR Operator         | `(a || b) => true` |
| `!`        | It is called Logical NOT Operator        | `!(a && b) => true` |

### Bitwise

Performs bit by bit operation

| Operator   | Description                                                                                                                                                              | Example |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------- |
| `&`        | Binary AND Operator copies a bit to the result if it exists in both operands.                                                                                            | `(a & b) => 0000 1100 = 12` |
| `|`        | Binary OR Operator copies a bit if it exists in either operand.                                                                                                          | `(a | b) => 0011 1101 = 61` |
| `^`        | Binary XOR Operator copies the bit if it is set in one operand but not both.                                                                                             | `(a ^ b) => 0011 0001 = 49` |
| `~`        | Binary Ones Complement Operator is unary and has the effect of 'flipping' bits.                                                                                          | `(~a) => 1100 0011 = -61` |
| `<<`       | Binary Left Shift Operator. The bit positions of the left operands value is moved left by the number of bits specified by the right operand.                             | `a << 2 => 1111 0000 = 240` |
| `>>`       | Binary Right Shift Operator. The Bit positions of the left operand value is moved right by the number of bits specified by the right operand.                            | `a >> 2 => 1111 = 15` |
| `>>>`      | Shift right zero fill operator. The left operands value is moved right by the number of bits specified by the right operand and shifted values are filled up with zeros. | `a >>> 2 => 0000 1111 = 15` |

### Assignments

| Operator   | Description                                                                                                    | Example |
| ---------- | -------------------------------------------------------------------------------------------------------------- | -------- |
| `=`        | Simple assignment operator, Assigns values from right side operands to left side operand                       | `c = a + b` |
| `+=`       | Add AND assignment operator, It adds right operand to the left operand and assign the result to left operand   | `c += a` |
| `-=`       | Subtract AND assignment operator, It subtracts right from the left and assign the result to left operand       | `c -= a` |
| `*=`       | Multiply AND assignment operator, It multiplies right with the left and assign the result to left operand      | `c *= a` |
| `/=`       | Divide AND assignment operator, It divides left operand with the right operand and assign the result to left   | `c /= a` |
| `%=`       | Modulus AND assignment operator, It takes modulus using two operands and assign the result to left operand     | `c %= a` |
| `<<=`      | Left shift AND assignment operator                                                                             | `c <<= a` |
| `>>=`      | Right shift AND assignment operator                                                                            | `c >>= a` |
| `&=`       | Bitwise AND assignment operator                                                                                | `c &= a` |
| `^=`       | Bitwise exclusive OR and assignment operator                                                                   | `c ^= a` |
| `|=`       | Bitwise inclusive OR and assignment operator                                                                   | `c |= a` |

### Operator Priority

| Category         | Operator                              | Associativity |
| ---------------- | ------------------------------------- | --------------------- |
| Postfix          | `() []`                               | Left to right |
| Unary            | `! ~`                                 | Right to right |
| Multiplicative   | `* / %`                               | Left to right |
| Additive         | `+ -`                                 | Left to right |
| Shift            | `>> >>> <<`                           | Left to right |
| Relational       | `> >= < <=`                           | Left to right |
| Equality         | `== !=`                               | Left to right |
| Bitwise AND      | `&`                                   | Left to right |
| Bitwise XOR      | `^`                                   | Left to right |
| Bitwise OR       | `|`                                   | Left to right |
| Logical AND      | `&&`                                  | Left to right |
| Logical OR       | `||`                                  | Left to right |
| Assignment       | `= += -= *= /= %= >>= <<= &= ^= |=`   | Right to right |
| Comma            | `,`                                   | Left to right |
