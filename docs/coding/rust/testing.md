---
tags:
- coding
- rust
- testing
---
# Testing

The rust compilator is already checking a lot of elements such as the lifetime and borrow checker.

If a new rust library is created it includes a test modules and a test prewritten

``` bash
cargo new adder --lib
```

``` rust title="lib.rs"
#[cfg(test)]             // test attribute
mod tests {              // test modules
  #[test]                // test attribute
  fn it_works() {        // test function
    asser_eq!(2 + 2, 4);
  }
}
```

tests can be run with the command

``` bash
cargo test

Compiling adder v0.1.0 (/Users/tschinz/work/repo/my/rustadventures/adder)
 Finished test [unoptimized + debuginfo] target(s) in 0.90s
  Running unittests src/lib.rs (target/debug/deps/adder-69b2fd04cbe83dba)

running 1 test
test tests::it_works ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

  Doc-tests adder

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

``` rust title="lib.rs"
#[cfg(test)]             // test attribute
mod tests {              // test modules
  #[test]                // test attribute
  #[test]                // optional ignored attribute (by default not run)
  fn it_doesnt_works() { // test function
    panic!("Test which fails")
  }
}
```

With the environment variable `RUST_BACKTRACE=1` a backtrace will be display upon failing.

## `cargo test` commands

with `--` command line arguments can be send to the resulting test binary.

``` bash
cargo test  # compiles and executes the testcode
            # all prints statements of passing tests are hidden
            # all tests run in parallel in a seperate thread

cargo test --help     # all command line options for the cargo test command
cargo test -- --help  # all command line options for the resulting test binary

cargo test -- --test-threads=1 # only one thread used

cargo test -- --show-output # shows output of all tests (passed and failing)
```

run only specific tests

``` bash
cargo test <testfnname> # only run one specific test
cargo test one_hundred  # only run test with the function name "one_hundred"

cargo test add   # only test with the function name starting with add.* will run

cargo test tests::  # only run tests from the module called tests

cargo test -- --ignored # runs only the test functions with the attribute ignored
```

## test attributes

## `assert` commands

for the `assert_eq` and `assert_ne` both input arguments need PartialEq
and Debug traits implemented.

``` rust
assert!(true);
assert_eq!(4, add_two(2));
sassert_ne!(3, add_two(2));
```

## Examples

``` rust
// implementation of the code
#[derive(Debug)]
struct Rectangle {
  width: u32,
  height: u32,
}
impl Rectangle {
  fn can_hold(&self, other: &Rectangle) -> bool {
    self.width > other.width && self.height > other.height;
  }
}

// test module for the code
#[cfg(test)]
mod tests {
  use super::*; //bring into scope

  #[test]
  fn larger_can_hold_smaller() {
    let larger = Rectangle{
      width: 8,
      height: 7,
    }
    let smaller = Rectangle{
      width: 5,
      height: 1,
    }

    assert!(larger.can_hold(&smaller));  // tests
  }

  #[test]
  fn smaller_cannot_hold_larger() {
    let larger = Rectangle{
      width: 8,
      height: 7,
    }
    let smaller = Rectangle{
      width: 5,
      height: 1,
    }

    assert!(!smaller.can_hold(&larger));  // tests
  }
}
```

```rust
// implementation of the code
pub fn add_two(a: i32) -> i32 {
  a + 2
}

// test module for the code
#[cfg(test)]
mod tests {
  use super::*; //bring into scope

  #[test]
  fn it adds_two() {
    assert_eq!(4, add_two(2));
  }
```

## Custom Error Messages

``` rust
pub fn greeting(name: &str) -> String {
  format!("Hello {}!", name)
}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn greeting_contains_name() {
    let result = greeting("Carol");
    assert!(
      result.contains("Carol"),
      "Greeting did not contain name, value was `{}`", result
    );
  }
}
```

## Test to assert a function failure

``` rust
pub struct Guess {
  value: i32,
}

impl Guess {
  pub fn new(value: i32) -> Guess {
    if value < 1 || value > 100 {
      panic!("Guess value must be between 1 and 100, got {}", value);
    }

    Guess { value }
  }
}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]          // attribute to indicate that it is a test
  #[should_panic]  // attribute to indicate that the test function should panic
  fn greater_tan_100() {
    Guess::new(200);
  }
}
```

# Unit Test

All above test examples are Unit Test. They are written directly in the program code files.

The convention is the add the test code in the same file as the product code.

``` rust
// Module code
pub fn add_two( a: i32) -> i32 {
  internal_adder(a, 2);
}

fn internal_adder(a:i32, b: i32) -> i32 {
  a + b
}

// Unit test code
#[cfg(test)]       // attribute configuration is test (will only be run with cargo test)
mod tests {        // convention to have the test module name called tests
  use super::*;    // import everything from parent module

  #[test]
  fn internal() {  // since tests is a child module it can access all internal functions
    assert_eq!(4, internal_adder(2,2));
  }
}
```

## Integration Test

Integration Tests live in the folder `tests` at the root of the project.

- No test module with the attribute `[cfg(test)]` is needed here.
- Each file in the `test/` folder is compiled as a crate and gets its own test section
- Files in subdirectories of `test/.../` are not compiled (e.g. used for common code)
  - `test/common/mod.rs`

``` rust title="integration_test.rs"
use adder;

mod common;

#[test]
fn it_adds_two() {
  asser_eq!(4, adder::add_two(2));  // call public api not internal functions
}
```

The integration test can be executed in multiple ways

``` bash
cargo test  # executes all tests

cargo test --test <integration_test_file_name>
cargo test --test integration_test  # run only a specific integration test
```