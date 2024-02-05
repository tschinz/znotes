---
tags:
- coding
- swift
---
# Control Flow

## `if` - `else`

``` swift
if condition1 == true {
    // do something
} else if condition2 = true {
    // do something else
} else {
    // do again something else
}
```

## `if` - `let`

## `switch` - `case`

``` swift
switch gesture.state {
    case .Ended: fallthrough // case defined and execute code in next case
    case .Changed:           // other case
        // do something
    default: break           // all cases needs to be defined
}
```

## `for` - `in` loop

## `while` loop & `repeat` - `while` loop

## `continue` & `break` & `fallthrough`

## `guard`

## `as`, `as?` type casting, `is` type check

## Extension

Add a method and properties to a class.

- Only new ones
- Extend a close source code
- Very powerful but many times overused

## `protocol`

- A way to express an API minimally
- Specifies the properties and methods needed
- Protocol is a type without implementation (only declaration)
- Aspects of a `protocol`
  - The `protocol` declaration
  - The declaration where a `class`, `struct` or `enum` says that it implements a `protocol`
  - The actual implementation of the `protocol` in said `class`, `struct`or `enum`

### Declaration

``` swift
// Everyone implements SomeProtocol need to implement InheritedProtocol 1 & 2
protocol SomeProtocol: Inherited Protocol1, InheritedProtocol2 {        // can be implemented with class, struct or enum
protocol SomeProtocol: class, Inherited Protocol1, InheritedProtocol2 { // only class can implement
    var someProperty: Int {get set} // need to specify if only get or set or both
    func aMethod(arg1: Double, anotherArgument: String) -> SomeType
    mutating func changeIt()        // mutating function need to be declare
    init(arg: Type)
}
```

### Implementation

``` swift
class SomeClass: SuperclassOfSomeClass, SomeProtocol, Another Protocol { // implementation via class
enum SomeClass: SomeProtocol, AnotherProtocol {                          // implementation via struct
extension Something : SomeProtocol {                                     // implementation via an extension
    // implementation of SomeClass here
    // which MUST include all the properties and methods in SomeProtocol & AnotherProtocol
    required init(..) // inits need to be declared required (that subclass is coherent)
    // incase of extension no stored properties allowed
}
```

### Example

``` swift
protocol Moveable {
    mutating func moveTo(p: CGPoint)
}
class Car: Moveable {
    func moveTo(p: CGPoint) {...}
    func changeOil()
}
struct Shape: Moveable {
    mutating func moveTo(p: CGPoint) {...}
    func draw()
}

let prius: Car = Car()
let square: Shape = Shape()

// More examples
var thingToMove: Moveable = prius
thingToMove.moveTo(...)  // ok
thingToMove.changeOil()  // Error not in protocol type
thingToMove = square
let thingToMove: [Moveable] = [prius, square]

func slide(slider: Moveable) {
    let positionToSlideTo = ....
    slider.moveTo(positionToSlideTo)
}
slide(prius)
slide(square)
func slipAndSlide(x: protocol<Slippery,Moveable>) // needs to implements 2 seperate protocols
slipAndSlide(prius) // Error prius only Moveable not Slippery
```

### Delegation

Is using `protocols`. How Views can talking back (blind communication)

1. Create a delegation `protocol` (defines what the View wants the Controller to take care of
2. Create a `delegate` property in the View whose type is that delegation `protocol`
3. Use the `delegate` property in the View to get/do things it can't own or control
4. Controller declares that it implements the `protocol`
5. Controller sets `self` as the `delegate` of the View by setting the property in 2. above
6. Implement the `protocol` in the Controller

The View is now hooked up to the Controller and knows nothing. It can remain generic and reusable
