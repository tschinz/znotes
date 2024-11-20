---
tags:
- coding
- rust
- error handling
---
# Error Handling

Rust provides robust mechanisms for handling errors through enums like `Result` and `Option`, emphasizing safety and clarity.

---

## `panic!()` Macro

The `panic!()` macro immediately terminates the program and outputs an error message. Use it sparingly, only in unrecoverable scenarios or during prototyping.

```rust
panic!("crash and burn");
```

### Debugging with Backtrace

Set the environment variable `RUST_BACKTRACE=1` to display a backtrace when a `panic!` occurs.

## Result Enum

The Result enum is used for functions that can succeed or fail. It has two variants:
- `Ok(T)` — success, containing a value.
- `Err(E)` — error, containing an error value.


```rust
enum Result<T, E> {
    Ok(T),
    Err(E),
}
```

### Handling Result with match

Use match to explicitly handle both `Ok` and `Err`.

```rust
use std::fs::File;
use std::io::ErrorKind;

fn main() {
    let f = File::open("hello.txt");

    let f = match f {
        Ok(file) => file,
        Err(error) => match error.kind() {
            ErrorKind::NotFound => match File::create("hello.txt") {
                Ok(fc) => fc,
                Err(e) => panic!("Problem creating the file: {:?}", e),
            },
            other_error => panic!("Problem opening the file: {:?}", other_error),
        },
    };
}
```

## Error Propagation

Error propagation allows errors to bubble up to the caller. You can manually propagate errors using match:

```rust
use std::fs::File;
use std::io::{self, Read};

fn read_username_from_file() -> Result<String, io::Error> {
    let f = File::open("hello.txt");

    let mut f = match f {
        Ok(file) => file,
        Err(e) => return Err(e),
    };

    let mut s = String::new();

    match f.read_to_string(&mut s) {
        Ok(_) => Ok(s),
        Err(e) => Err(e),
    }
}
```

## The `?` Operator

The `?` operator simplifies error propagation by automatically returning errors. It works only in functions that return `Result` or `Option`.

```rust
use std::fs::File;
use std::io::{self, Read};

fn read_username_from_file() -> Result<String, io::Error> {
    let mut f = File::open("hello.txt")?;
    let mut s = String::new();
    f.read_to_string(&mut s)?;
    Ok(s)
}
```

### Chaining with ?

You can further simplify the code by chaining method calls.
```rust
fn read_username_from_file() -> Result<String, io::Error> {
    let mut s = String::new();
    File::open("hello.txt")?.read_to_string(&mut s)?;
    Ok(s)
}
```

## `unwrap` and `expect`

These methods are convenient but should be used sparingly, as they cause the program to panic on errors.

### Examples
```rust
// Returns the inner value if Some, panics if None
Option::unwrap();

// Returns the inner value if Ok, panics if Err
Result::unwrap();

// Returns the inner value if Some, or a default if None
Option::unwrap_or(default);

// Returns the inner value if Ok, or a default if Err
Result::unwrap_or(default);

// Returns the inner value if Ok, or computes a value from a closure if Err
Result::unwrap_or_else(|err| handle_err(err));

// Returns the inner value if Some, panics with a custom error message if None
Option::expect("Custom panic message");

// Returns the inner value if Ok, panics with a custom error message if Err
Result::expect("Custom panic message");
```

### Best Practice

Avoid using `unwrap` and `expect` in production code. Prefer safer alternatives like `unwrap_or`, `unwrap_or_else`, or proper error handling with `match`.

## Conversion Between Result and Option

### `ok() (Result → Option)`

Converts a `Result<T, E>` into an `Option<T>`, discarding the error.

```rust
let opt: Option<i32> = Result::Ok(10).ok(); // Some(10)
```

### `ok_or(err) (Option → Result)`

Converts an `Option<T>` into a `Result<T, E>`, using a provided error.

```rust
let res: Result<i32, &str> = Some(10).ok_or("Missing value"); // Ok(10)
```

### Transforming Errors with `map_err`

The `map_err` method transforms the error `(E)` in a `Result` into another type while retaining the `Err` variant.

Using `match`

```rust
let res: Result<i32, &str> = Ok(10);

match res {
    Ok(val) => println!("Value: {}", val),
    Err(e) => println!("Error: {}", e),
}
```

Using `if let`

```rust
let res: Result<i32, &str> = Ok(10);

if let Ok(val) = res {
    println!("Value: {}", val);
}
```

## Printing Errors with eprint!

Use `eprint!` or `eprintln!` to print error messages directly to standard error (stderr).

```rust
eprint!("An error occurred: {}", error);
eprintln!("An error occurred: {}", error);
```
