---
tags:
- coding
- swift
---
# Data Structures & Methods

## Data Structures

`class`, `enum` and `struct` are the basic building blocks of swift they have:

- Similar Syntax
- Can have Properties (`var`, `let`), Methods (`func`)
- Can have initializer
- Only `class` has inheritance
- Only `class` has introspection and casting
- `class` = Reference type, `enum` and `struct` = Value type

### `enums`

``` swift
enum enumTypeVar : Int { // explicitly all Int's
    case firstProperty   = 1
    case secondProperty  = 2
}
vat type = enumTypeVar.firstProperty
```

``` swift
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}
```

### `struct`

``` swift
struct Resolution {
    var width = 0
    var height = 0
}
```

### `class`

#### Creation

``` swift
class MyClass : OptionalSuperClass, OptionalProtocol1, OptionalProtocol2 {
  var myProperty : String var myOptionalProperty : String?
  // More Properties  ::
  // Only need override dif subclassing
  override init() {
    myProperty = "initValue"
  }
  // More methods
  }
```

#### Usage

```swift
var myClassObject = MyClass()
  println("(myClassObject.myProperty)") // "initValue"
  println("(myClassObject.myOptionalProperty!)") // nil
```

#### `Final`

With `Final` a `func`or `class` can't be override. It will be the end of the line.

## Methods `func`

``` swift
func doIt() -> Int {
    return 0
}
```

### Internal & External Names

Methods in swift can have internal and external names. The first parameter is a littel different, it should be consistent with the method name.

- First parameter has no external name but can be forced with `#`.
- All other parameters need to have an external name
- `_` == "I don't care". An name can be eliminated

``` swift
func doIt(a:Int) -> Int {
    return a
}
doIt(0)         // return 0

func doIt(a:Int, b:Int) -> (a:Int, b:Int){
    return (a, b)
}
doIt(0, b:1)   // returns a tuple (a,b) == (0,1)
doIt(a:0, b:1) // error first param has no external name
```

``` swift
func doIt(externalName InternalName:Int) -> Int {
    return internalName
}
doIt(externalName:0)
doIt(0)              // Error no external name given

func doIt(#InternalandImplicitExternalName:Int) -> Int {
    return InternalandImplicitExternalName
}
doIt(InternalandImplicitExternalName:0)
```

### `override`

A Method from a superclass can be override wiwth the keyword `override`

``` swift
class Classname : SuperClassName {
    override doIt()
}
```

### `final()`

With `Final` a `func`or `class` can't be override. It will be the end of the line.

### `init()` Method

Two types of `init`

- designated `init()`
- `convenience init()`

**Free Inits**

- If all Properties are initialized
- `struct`with no initializers will get a default `init`

What **can** be done in an `init`:

- Set or Reset properties values `var` and even `let`
- Call other `init` methods `self.init()`
- Call super classes `init` methods `super.init()`

What **have to** be done in an `init`:

- After `init()` all properties need to have an value (or `nil`)
- Designated `init` can only call designated init of its immediate superclass
- All **own** properties need to be initialized **before** using superclass `init`
- The superclass `init` nedd to be called **before** inherited properties can ba assigned
- `convenience init` can only call designated `init` in it's own class
- `convenience init` can call other `convenience init` but in the end a designated `init` must be called
- `convenience init` first call designated `init` before set any property value

#### Inherited `init`

- If no `init` is implemented all superclass `init` are inherited
- If you override all superclass `init`, you'll inherit all its `convenience init`
- If you implement no `init`, you'll inherit all superclass `init`

#### Required `init`

- A `class` can mark one or more `init` as required

#### Failable `init`

Rare, it is a `init` which can return `nil`

``` swift
init?(){
    // might return nil
}
```

``` swift
## UIImage example
let image = UIImage(named: "nonExistingName") // image is an Optional UIImage?
// solution
if let image= UIImage(named: "nonExistingName"){
    // image was successfully created
} else {
    // couldn't create the image
}
```

## Objects

### Creating Objects

Calling `init` via the type name

``` swift
let x = ClassName()
let y = [String]()
```

Calling type methods (rare)

``` swift
let button = UIButton.buttonWithType(UIButtonType.System)
```

### `AnyObject`

- sSpecial Type (it is a Protocol) used to compatibility with Objective-C-based API

``` swift
// As Properties
var destinationViewController : AnyObject
var toolbarItems: [AnyObject]

// As Arguments to functions
func appendDigit(sender: AnyObject)
func addConstraints(constraints: [AnyObject])

// Return type of functions
class func buttonWithType(buttonType: UIButtonType) -> AnyObject
```

#### Convert `AnyObject`

**Casting `as` or `as?`**

``` swift
var destinationViewController: AnyObject
let calcVC = destinationViewController as CalculatorViewVController  // could crash if not correct

if let calcVC = destinationViewController as? CalculatorViewController { ... }
```

Cast on the fly

``` swift
let button: AnyObject = UIButton.buttonWithTyoe(UIButtonType.System)
let title = (button as UIButton).currentTitle
```