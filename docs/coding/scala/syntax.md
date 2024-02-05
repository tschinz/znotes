---
tags:
- coding
- scala
- syntax
---
# Syntax

## Entry point (main)

The entry point of a Scala program (the main function) should be defined inside an object as a function named `main`.

``` scala
object ScalaEx{
  def main(args: Array[String]) {
    println("Hello world")
  }
}
```

## Run code

``` bash
# To compile and run in the terminal
scalac ScalaEx.scala
# or
scala ScalaEx
```

## `import`

``` scala
import scala.math._       // imports all function from the scala.math library
```

## Variables & Values

In scala, you can define a variable by using the `var` keyword:

``` scala
var number : Float = 0
number = 6.0
number += 4
println(number) // Float = 10.0
```

Scala is able to infer the type automatically. You don't need to specify it if the variable is assigned at declaration:

``` scala
var number = 0   //The type of 'number' is inferred as a Int during the compilation.
```

### Constants

But, in fact, it's not very common to use `var` in Scala. Instead, constant values defined by `val` are often used:

``` scala
val two   = 2
val three = 3
val six   = two * three
```

## Strings

``` scala
val name = "strings are cool"
println("index 3 is: " + name(3))                // index
println("length is: " + name.length)             // length
println(name.concat(" add this")                 // concat
println("index of cool" + name.indexOf("cool"))  // indexOf

nameArray = name.toArray
for(v <- nameArray)
  println(v)
```

### Special characters

| Character       | Description |
| --------------- | -------------------- |
| `\a`            | audible alert |
| `\b`            | backspace |
| `\f`            | form feed |
| `\n`            | newline |
| `\r`            | carriage return |
| `\v`            | vertical tab |
| `\\`            | backslash |
| `$$`            | dollarsign |
| `%%`            | percentsign |
| `""" " """`     | Doublequote escape |

### String Interpolators

```
%[align][sign][fill][width][.precision]type
    |      |     |    (int)     (int)  d decimal (integer) (base 10)
    |      |     |                     i integer (base 10)
    |      |     +-- void (default)    o octal number (base 8)
    |      |     +-- <any character>   u unsigned decimal (integer) number
    |      |                           x hexadecimal number (base 16)
    |      +-- + (default)             f floating point number
    |      +-- -                       e exponential floating-point number
    |                                  c character
    +-- void (default) right aligned   s string of characters
    +-- - left aligned
```

#### `s`-Interpolator

`s""` is a procesed string literal.

``` scala
val name = "Maja"
println(s"Hello, $name")     // insert variable

println(s"1 + 1 = ${1 + 1}") // insert arbitrary expression

println(s"$$15.95")          // $ escape character

val person = """{"name":"James"}""" // Double Quote escape character
```

#### `f`-Interpolator

`f""` allows the creation of formatted strings

#### `raw`-Interpolator

## Print

```
val name = "string"
val integer = 39
val floatingpoint = 12.3

println(s"String is $name")
println(f"$(integer)+1 $floatingpoint%.2f")
println("'%-5s'\n", "other string")
```

## Functions

For example, if you want to define a function which returns `true` if the sum of its two arguments is bigger than zero, you can do as follows:

``` scala
def sumBiggerThanZero(a: Float, b: Float): Boolean = {
  return (a + b) > 0
}
```

Then, to call this function, you can just write:

``` scala
sumBiggerThanZero(2.3f, 5.4f)
```

You can also specify arguements by name, which is useful if you have many arguements:

``` scala
sumBiggerThanZero(
  a = 2.3f,
  b = 5.4f
)
```

### Return

The `return` keyword is not necessary. In absence of it, Scala takes the last statement of your function as the returned value.

``` scala
def sumBiggerThanZero(a: Float, b: Float): Boolean = {
  (a + b) > 0
}
```

### Return type inferation

Scala is able to automatically infer the return type. You don't need to specify it:

``` scala
def sumBiggerThanZero(a: Float, b: Float) = {
  (a + b) > 0
}
```

### Multiple return values

Multiple return values can be given with the help of a `tuple`

``` scala
def mv: (Int, Int, Int) = {
  (1,2,3)
}

val (i, j, k) = mv()
```

### Function that returns nothing `Unit`

If you want a function to return nothing, the return type should be set to `Unit`. It's equivalent to the C/C++ void.

``` scala
def printer(): Unit = {
  println("1234")
  println("5678")
}
```

### Arguments default value

You can specify a default value for each arguement of a function:

``` scala
def sumBiggerThanZero(a: Float, b: Float = 0.0f) = {
  (a + b) > 0
}
```

### Apply Function

Functions named `apply` are special because you can call them without having to type their name:

``` scala
class Array(){
  def apply(index: Int): Int = index + 3
}

val array = new Array()
val value = array(4)   //array(4) is interpreted as array.apply(4) and will return 7
```

This concept is also applicable for scala `object` (static)

``` scala
object MajorityVote{
  def apply(value: Int): Int = ...
}

val value = MajorityVote(4) // Will call MajorityVote.apply(4)
```

### Recursion

Function which calls it self.

``` scala
def factorial(num: BigInt) : BigInt = {
  if (num <= 1)
    1
  else
    num * factorial(num-1)
}

println("Factorial of 4 = " + factorial(4))
```

## Object

In scala, there is no `static` keyword. In place of that, there is `object`. Everything defined into an `object` is static.

The following example defines a static function named `pow2` which takes a floating point value as parameter and returns a floating point as well.

``` scala
object MathUtils{
  def pow2(value: Float): Float = value*value
}
```

Then you can call it by writing:

``` scala
MathUtils.pow2(42.0f)
```

### Class

The class syntax is very similar to Java. Imagine that you want to define a `Color` class which takes as construction parameters three Float values (r,g,b) :

``` scala
class Color(r: Float, g: Float, b: Float){
  def getGrayLevel(): Float = r * 0.3f + g * 0.4f + b *0.4f
}
```

Then, to instantiate the class from the previous example and use its `getGrayLevel` function:

``` scala
val blue = new Color(0, 0, 1)
val grayLevelOfBlue = blue.getGrayLevel()
```

Be careful, if you want to access a construction parameter of the class from the outside, this construction parameter should be defined as a `val`:

``` scala
class Color(val r: Float, val g: Float, val b: Float){ ... }
...
val blue = new Color(0, 0, 1)
val redLevelOfBlue = blue.r
```

### Inheritance _extends_

As an example, suppose that you want to define two classes, `Rectangle` and `Square`, which extend the class `Shape`:

``` scala
class Shape{
  def getArea(): Float
}

class Square(sideLength: Float) extends Shape {
  override def getArea() = sideLength * sideLength
}

class Rectangle(width: Float, height: Float) extends Shape {
  override def getArea() = width * height
}
```

### Case class

Case class is an alternative way of declaring classes.

``` scala
case class Rectangle(width: Float, height: Float) extends Shape {
  override def getArea() = width * height
}
```

Then there are some differences between `case class` and `class` :

-   case classes don't need the `new` keyword to be instantiated
-   construction parameters are accessible from outside, you don't need
    to define them as `val`.

## Templates / Type parameterization

Imagine you want to design a class which is a queue of a given datatype, in that case you need to provide a type parameter to the class:

``` scala
class  Queue[T](){
  def push(that: T) : Unit = ...
  def pop(): T = ...
}
```

If you want to restrict the `T` type to be a sub class of a given type (for example `Shape`), you can use the `<: Shape` syntax :

``` scala
class Shape() {
    def getArea(): Float
}
class Rectangle() extends Shape { ... }

class  Queue[T <: Shape](){
  def push(that: T): Unit = ...
  def pop(): T = ...
}
```

The same is possible for functions:

``` scala
def doSomething[T <: Shape](shape: T): Something = { shape.getArea() }
```
