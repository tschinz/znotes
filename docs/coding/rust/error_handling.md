---
tags:
- coding
- rust
- error handling
---
# Error Handling
## `panic!()` macro

The panic marco allows to quit the program and give an error message

``` rust
panic!("crash and burn");
```

With the environment variable set `RUST_BACKTRACE=1` a backtrace can be displayed upon exiting.

## `Result` enum

Like the `Option` enum the `Result` enum contains two variants, no error `Ok()` or an error `Err(E)`.

``` rust
enum Result<T, E> {
  Ok(T),
  Err(E),
}
```

Example with `match`

``` rust
use std::fs::File;
use std::io:ErrorKind;

fn main() {
  let f = File::open("hello.txt");

  let f = match f {
    Ok(file) => file,
    Err(error) => match error.kind() {
      ErrorKind::NotFound => match File::create("hello.txt") {
        Ok(fc) => fc,
        Err(e) => panic!("Problem creating the file: {:?}", e),
      },
      other_error => {
        panic!("Problem opening the file {:?}", other_error)
      }
    }
  };
}
```

``` rust
use std::fs::File;

fn main() {
  let f = File::open("hello.txt").unwrap("Failed to open hello.txt");
}
```

## Error Propagation

``` rust
use std::fs::File;
use std::io;
use std::io::Read;

fn read_username_from_file() -> Result<String, io:Error> {
  let f = File::open("hello.txt");

  let mut f = match f {
    Ok(file) => file,
    Err(e) => return Err(e),
  };

  let mut s = String::new();

  match f.read_to_string(&mus s) {
    Ok(_) => Ok(s),
    Err(e) => Err(e),
  }
}
```

## `?` operator

optimized with `?`. The questionmark allows to end the function early and end the error if unsuccessful otherwise continue.

The `?` operator can only be used on function returning an error.

``` rust
use std::fs::File;
use std::io;
use std::io::Read;

fn read_username_from_file() -> Result<String, io:Error> {
  let mut f = File::open("hello.txt")?;
  let mut s = String::new();
  f.read_to_string(&mut s)?;
  Ok(s)
}
```

optimized with `?` and chained method calls

``` rust
use std::fs::File;
use std::io;
use std::io::Read;

fn read_username_from_file() -> Result<String, io:Error> {
  let mut s = String::new();
  File::open("hello.txt")?.read_to_string(&mut s)?;
  Ok(s)
}
```

## `unwrap`

``` rust
// returns inner value of an Option Some, otherwise if panics if its None
Option::unwrap()

// returns inner value of an Result Ok, otherwise if panics if its Err
Result::unwrap()

// returns inner value of an Result Err, otherwise if panics if its Ok
Result::unwrap_err()

//returns the inner value of an Option if its Some, or returns a default value if its None
Option::unwrap_or()

//returns the inner value of an Result if its Ok, or returns a default value if its Err
Result::unwrap_or()

//returns the inner value of an Result if its Ok, or returns the result of a closure if its Err
Result::unwrap_or_else()

.unwrap_none()    //

// return the inner value of an Option if its Some, or panics if its None
Option::expect()

// return the inner value of an Result if its Some, or panics if its None
Result::expect()
```

## `eprint()`

print error message directly to the standard error `io::stderr` instead of `io::stdout`
