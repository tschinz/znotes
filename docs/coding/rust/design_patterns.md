---
tags:
- coding
- rust
- design patterns
---
# Design Patterns

List of common and idiomatic design patterns in Rust. These patterns could be found in mutliple books and articles and also in the [Unofficial Rust Book](https://rust-unofficial.github.io/patterns/)


## Idioms

### Safely Unwrap `Option` and `Result`

Use `unwrap_or` to provide a default value when unwrapping an `Option` or `Result`.

```rust
let x = Some("value");
let y = x.unwrap_or("default");
assert_eq!(y, "value");

let x = None;
let y = x.unwrap_or("default");
assert_eq!(y, "default");
```

### Use `if let` to Unwrap `Option` and `Result`

Use `if let` to unwrap an `Option` or `Result` and execute code if the value is `Some` or `Ok`.

```rust
let x = Some("value");
if let Some(value) = x {
    assert_eq!(value, "value");
}

let x = None;
if let Some(value) = x {
    assert_eq!(value, "value");
}
```

### Use `match` to Unwrap `Option` and `Result`

Use `match` to unwrap an `Option` or `Result` and execute code based on the value.

```rust
let x = Some("value");
match x {
    Some(value) => assert_eq!(value, "value"),
    None => panic!("Expected Some"),
}

let x = None;
match x {
    Some(value) => assert_eq!(value, "value"),
    None => assert!(true),
}
```

### Borrowed Types for Arguments

Preferr borrowed type over borrowing the owned type.

- `&str` over `&String`
- `&[T]` over `&Vec<T>`
- `&T` over `&Box<T>`

```rust
// this
fn three_vowels(word: &str) -> bool {}
// instead of this
fn three_vowels(word: &String) -> bool {}

```

### Use `format!` to work with Strings

```rust
let name = "John";
let greeting = format!("Hello, {}!", name);
```

### Constructor & Default Constructor

- *Constructor* - Rust does not have a constructor method like other languages. Instead, you can use an associated function `new`to create an object.
- *Default Constructor* - Can be implemented with the `Default` trait.

```rust
pub struct Second {
  value: u64,
}

impl Second {
  // Constructs a new instance of [`Second`].
  // Note this is an associated function - no self.
  pub fn new(value: u64) -> Self {
    Self { value }
  }

  /// Returns the value in seconds.
  pub fn value(&self) -> u64 {
    self.value
  }
}

impl Default for Second {
    fn default() -> Self {
        Self { value: 0 }
    }
}
```

The Default constructor can also be `derived` is all fields in the struct implement the `Default` trait.

```rust
#[derive(Default, Debug, PartialEq)]
pub struct Time {
    seconds: u64,
    minutes: u64,
    hours: u64,
}

impl Time {
    /// Returns the value in seconds.
    pub fn get_time(&self) -> (u64, u64, u64) {
        (self.seconds, self.minutes, self.hours)
    }
}

fn main() {
    // construct a new instance with default values
    let mut time_1 = Time::default();
    // do something with conf here
    time_1.seconds = 10;

    // partial initialization with default values, creates the same instance
    let time_2 = Time {
        seconds: 10,
        ..Default::default()
    };
    assert_eq!(time_1, time_2);
}
```

### Deconstructor

Rust does not offer a deconstructor method like other languages. Instead, you can implement the `drop` function to perform cleanup when the object goes out of scope.

```rust
struct Foo;

// Implement a destructor for Foo.
impl Drop for Foo {
    fn drop(&mut self) {
        println!("exit");
    }
}

fn main() {
    {
      let var = Foo;
    } // var dropped here
}
```
