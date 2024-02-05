---
tags:
- coding
- rust
- syntax
---
# Syntax
## Comments

``` rust
// Singleline Comment
/// Documentation Comment - Supports Markdown
/*
Block
Comment
*/
```

## `use` crates

Allows to bring modules and/or function into scope. In idiomatic rust always specify the full path and "import" only the minimal.

``` rust
use <cratename>;
```

``` rust
use std::io;                         // brings io of std into local scope
use rand::Rng;                       // bring Rng of rand into loacl scope
use std::time::(Duration, Instant);  // brings Duration and Instant of std::time into local scope
```

Bring own modules into scope with the help of `self`

``` rust
mod front_of_house {
  pub mod hosting {
    pub fn add_to_whitelist() {}
  }
}

use self::front_of_house::hosting;
# or
use crate::front_of_house::hosting;

pub fn eat_at_restaurant() {
  hosting::add_to_whitelist();
}
```

Bring into scope two elements with the same name from different crates. In this case only bring the parent module into scope.

``` rust
use std::fmt;
use std:io;

fn function1() fmt::Result {}

fn function2() io::Result<()> {}
```

It is also possible to rename the import with `as`

``` rust
use std::fmt::Result;
use std:io::Result as IoResult;

fn function1() Result {}

fn function2() ioResult<()> {}
```

import more item at once into scope

``` rust
use std::io::{self, Write};
use rand::{Rng, CryptoRng, ErrorKind::Transient};
```

## `mod` modules

split code in logical units and manage visibility (public/private) between them. Modules can contain, constants, structs, enums functions and other modules. A crate is also a modules which is created by default.

Module tree

```
crate
+-- front_of_house
    +-- hosting
    |   +-- add_to_whaitlist
    |   +-- seat_at_table
    +-- serving
        +-- take_order
        +-- serve_order
        +-- take_payment
```

Path to modules can be Absolute or relative.

``` rust
mod front_of_house {
  pub mod hosting {
    pub fn add_to_waitlist() {}

    fn seat_at_table() {}
  }

  mod serving {
    fn take_order() {}

    fn serve_order() {}

    fn take_payment() {}
  }
}

pub fn eat_at_restaurant() {
  // Absolute path
  crate::front_of_house::hosting::add_to_waitlist();

  // Relative path
  front_of_house::hosting::add_to_waitlist!();
}
```

**Modules visibility**

- By default a child modules is private and the parent modules can't see it's content.
- Child modules can see all parent modules functionalities
- With `pub` keyword, function can be access from outside.

modules example with visibility

``` rust
mod front_of_house {
  pub mod hosting {
    pub fn add_to_whitelist() {}
  }
}

pub fn eat_at_restaurant() {
  // Absolute path
  crate::front_of_house::hosting::add_to_whitelist();

  // Relative path (start with current modules)
  front_of_house::hosting::add_to_whitelist();
}

use self::front_of_house::hosting

pub fn eat_at_restaurant_2() {
  hosting::add_to_whitelist();
}
```

## Variables

Rust code uses *snake_case* for function and variables.

### `const`- Constants

Constants live in their scope and cannot be changed for the entire program duration. They are written in `UPPERCASE_WITH_UNDERSCORES_BETWEEN`

``` rust
const CONST_NAME: u32 = 60 * 60 + 3;
```

### `let`- immutable Variable

``` rust
let x: u8 = 5; // declare variable x and bind to 5
```

#### Shadowing

``` rust
fn main() {
  let x = 5;
  let x = x + 1;
  {
    let x = x * 2;
    println!("inner-scope x is: {x}");
  }
  println!("outer-scope x is: {x}");
}
```

```
inner-scope x is: 12
outer-scope x is: 6
```

Shadowing to change type

``` rust
let spaces = "   ";         // spaces is a string
let spaces = spaces.len();  // spaces is a i32 integer
```

### `let mut` - mutable Variable

``` rust
let mut x: u8 = 5;   // bind variable x to 5
x = 6;               // bind variable x to 6
```

## `fn` Functions

Rust code uses *snake_case* for function and variables.

`main` function

``` rust
fn main(){
}
```

### dead Functions

``` rust
#[allow(dead_code)]
fn deadfn(){}
```

### Parameters and Return

``` rust
// Function with two parameters and a return value
fn add(a: i32, b: i32) ->  i32 {
  a+b
}

add(5,4)
```

### Default Values

``` rust
// Function with parameters that have default values
fn add(a: Option<u8>, b: Option<u8>) -> u8 {
  a.unwrap_or(1) + b.unwrap_or(2)
}

println!("{}", add(None, None));
println!("{}", add(3, 4));
```

### Function macros

A function call finishing with `!` return not a value but code. It is essentially a macro.

``` rust
let x = 5;
let y = 10;
println!("x = {x} and y + 2 = {}", y + 2);
```

### `|x|` Closures

A closure is a type of anonymous function (don't have names) that can capture variables from its surrounding environment. These variables can
then be used within the closure's body, even if they are not passed in as parameters.

Closures are normally short and only available in a narrow context. Compiler determines the input and return variable type. The first usage will define the types of the variables.

``` rust
fn main() {
    let x = 5;
    let add = |y| x + y;

   let result = add(3);
   println!("{}", result); // Prints "8"
}
```

More complete example with a Cacher. The cacher implementation is not finished, it only caches the value for one `arg` instead for each arg a new value. It can be fixed with a hashmap.

``` rust
use std::thread;
use std::time::Duration;

fn expensive_calculation(intensity: u32) -> u32 {
  println!("calculating slowly...");
  thread::sleep(Duration::from_secs(2));
  intensity
}

fn main() {
  let simulated_intensity = 10;
  let simulated_random_number = 7;

  generate_workout(simulated_intensity, simulated_random_number);
}

// for using struct with closures, generics and trait bounds are needed
struct Cacher<T>   // Generic <T>
where
  T: Fn(u32 -> u32), // Trait Fn
{
  calculation: T,
  value: Option<u32>,
}

impl<T> Cacher<T>,
where
  T: Fn(u32) -> u32,
{
  fn new(calculation:T) -> Cacher<T> {
    Cacher {
      calculation,
      value:None,
    }
  }

  fn value(&mut self, arg: u32) -> u32 {
    match self.value {
      Some(v) => v,
      None => {
        let v = (self.calculation)(arg);
        self.value = Some(v);
      }
    }
  }
}

fn generate_workout(intensity: u32, random_number: u32) {
  // Closure definition
  //let expensive_closure = |num: u32| -> u32 {     // with type definition
  let expensive_closure = |num| {       // without type definition
    println!("calculatin slowly");
    thread::sleep(Duration::from_secs(2));
    num
  };

  // Closure definition with Cacher struct
  let mut expensive_cacher = Cacher::new(|num| {       // without type definition
    println!("calculatin slowly");
    thread::sleep(Duration::from_secs(2));
    num
  };

  if intensity < 25 {
    println!(
      "Today, do {} pushups!",
      //expensive_calculation(intensity)  // get value from function
      //expensive_closure(intensity)      // get value from closure
      expensive_cacher.value(intensity)   // get value from Cacher with closure
    );
    println!(
      "Next, do {} situps!",
      //expensive_calculation(intensity)  // get value from function
      //expensive_closure(intensity)      // get value from closure
      expensive_cacher.value(intensity)   // get value from Cacher with closure
    );
  } else {
    if random_number == 3 {
      println!("Take a break today! Remember to stay hydrated!");
    } else {
      println!(
        "Today, run for {} minutes!",
        //expensive_calculation(intensity)  // get value from function
        //expensive_closure(intensity)      // get value from closure
        expensive_cacher.value(intensity)   // get value from Cacher with closure
      );
    }
  }
}
```

Capture variables with closures

``` rust
fn main() {
  let x = 4;

  let equal_to_x = |z| z == x;

  let y = 4;

  assert!(equal_to_x(y));
}
```

Closures can capture values form their environment in three way (same as functions): 1. Taking ownwership (`FnOnce` trait) 2. Borrow mutable (`FnMut` trait) 2. Borrow immutable (`Fn` trait)

## Flow Control

### `if`

``` rust
let number = 6;
if number % 4 == 0 {
  println!("number is divisible by 4");
} else if number % 3 == 0 {
  println!("number is divisible by 3");
} else if number % 2 == 0 {
  println!("number is divisible by 2");
} else {
  println!("number is not divisible by 4, 3, or 2");
}
```

can also be used for variables

``` rust
let condition = true;
let number = if condition {5} else {6};
```

### `if let`

`if let` is similar to match but is not exhaustive. All others values
are ignored.

``` rust
fn main() {
  let some_value = Some(3);
  match some_value {
    Some(3) => println!("three"),
    _ => (),
  }

  if let Some(3) = some_value { // comparison inversed
    println!("three");
  }
}
```

### `for`

``` rust
for _ in 0..10 {
  //...
}

for _ in 0..=10 {
  //...
}
```

Use `.rev()` to reverse the list range,

``` rust
for nbr in (0..=5).rev() {
  println!("{nbr} ...");
}
println!("LIFTOFF!!!");

//ok but not recommended because of performance and safety
let collection = [1, 2, 3, 4, 5];
for i in 0..collection.len() {
  let item = collection[i];
  //...
}
```

**Access: Ownership**
<div class="grid cards" markdown>
-   __Shorthand__

    ---

    ```rust
    for item in collection
    ```

-   __Equivalent to__

    ---

    ```rust
    for item in IntoIterator::into_iter(collection)
    ```
</div>

**Access: Read-Only**
<div class="grid cards" markdown>
-   __Shorthand__

    ---

    ```rust
    for item in &collection
    ```

-   __Equivalent to__

    ---

    ```rust
    for item in collection.iter()
    ```
</div>

**Access: Read-Write**
<div class="grid cards" markdown>
-   __Shorthand__

    ---

    ```rust
    for item in &mut collection
    ```

-   __Equivalent to__

    ---

    ```rust
    for item in collection.iter_mut()
    ```
</div>

### `while`

``` rust
let mut samples = vec![];

while samples.len() < 10 {
   let sample = take_sample();
   if is_outlier(sample) {
      continue;
   }

   samples.push(sample);
}
```

iterate over collection:

``` rust
let arr = [10, 20, 30, 40, 50];
let mut idx = 0;

while idx < 5 {
  println!("the value is: {}", arr[idx]);
  idx += 1;
}
```

### `loop`

in Rust `loop` is preferred over `while`.

``` rust
let mut counter = 0;
let result = loop {
   counter += 1;
   if counter == 10 {
    break counter * 2;
   }
};

println!("The result is {result}");
```

### `continue`

`continue` a llows to skip the rest of the interation.

``` rust
for n in 0..10 {
  if n % 2 == 0 {
    continue;
  }
  //...
}
```

### `break`

`break` can be used to exit the current loop or to exit a specific loop with `break '<label>;` . The `break` keyword also return a value, by default `()` or what is defined e.g. `break 123;`

``` rust
'outer: for x in 0.. {
  for y in 0.. {
    for z in 0.. {
      if x + y + z > 1000 {
        break 'outer;
      }
      //...
    }
  }
}
```

### `match`

`match` is perform an action depeding on the value / variant. A `match` needs to have an arm for all possibilities.

``` rust
fn main() {
  let some_value = Some(3);
  match some_value {
    Some(3) => println!("three");
    _ => (),
  }
}
```
