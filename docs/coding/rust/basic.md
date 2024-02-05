---
tags:
- coding
- rust
---
# Basics
## Project Files
A cleaned project has the following source-files:

```
.
├── Cargo.lock    # auto-generated file, contains versions of dependencies
├── Cargo.toml    # project settings and dependencies
└── src           # folder for src files
   ├── hello      # generated binary
   └── main.rs    # source file
```

A run and documented project contains the following files:

```
.
├── Cargo.lock    # auto-generated file, contains versions of dependencies
├── Cargo.toml    # project settings and dependencies
├── src           # folder for src files
│  ├── hello      # generated binary
│  └── main.rs    # source file
└── target        # contains binaries, object files
   ├── debug      #
   ├── release    #
   └── doc        # project documentation static html files
```

## `Cargo.toml` file

The Cargo.toml file is the main entry point for Cargo when building and managing a Rust project. It contains information about the packages that your project depends on, the version of Rust you're using, and any other configuration options that are required to build and run your project.

``` toml
# The name of the project
[package]
name = "my-rust-project"

# The version of the project, following Semantic Versioning (SemVer)
version = "0.1.0"

# List of authors, with their name and email address
authors = [
    "Your Name <you@example.com>",
    "Another Author <another@example.com>",
]

# A brief description of the project
description = "A Rust project to demonstrate the structure of a Cargo.toml file"

# The repository URL for the project, if it is hosted on a version control system
repository = "https://github.com/yourusername/my-rust-project"

# The license that the project is released under
license = "MIT"

# A list of dependencies for the project, with version constraints
[dependencies]
serde = "1.0"
reqwest = "0.10.8"
image = { version = "0.24", default-features = false, features = ["jpeg"] }

# A list of build dependencies for the project, with version constraints
# Build dependencies are only used when building the project, not when running it
[build-dependencies]
clippy = "0.0.183"

# A list of targets for the project, specifying the architecture and other configuration options
# Targets are used to build the project for different architectures and configurations
[target.'cfg(target_arch = "x86_64")'.dependencies]
num_cpus = "1.12.0"

# A list of dev-dependencies for the project, with version constraints
# Dev-dependencies are only used when developing the project, not when building or running it
[dev-dependencies]
tokio = "0.2.21"
```

### dependencies SemVer

[SemVer](https://semver.org) is the Semantic Versioning used to define dependency versions to be used.

For Example `0.8.5` allows for a version at least `0.8.5` but below `0.9.0`.

Dependencies can be updated to the last allowed version with:

``` bash
cargo update
```

## Install crate

``` bash
cargo add <cratename>
```

# crates

A crate is a collection of Rust source files.

-   *binary crate* - is an executable
-   *libaray crate* - code intended to use by other programs

# Statements vs Expression

Rust is an expression-based language. - Expression evaluate to a result value. - Statements are instructions that perform some action and do not return a value

- Expression delimiter by the `;` - Called expression statement
- Binding a name to a value with the `=` - Called declaration statement
- Type declarations, which include the `fn`, `struct` and `enum` keywords - Called declaration statement

``` rust
let y = {
  let x = 3;
  x+1
};

let x = 3;  // Statement doesn't return something

fn add(x:i32) -> i32 {
  x
}
```

## Ownership
### Ownership Rules

- Each value in Rust has an *owner*
- There can only be *one owner* at a time
- When the owner goes out of scope, the value will be dropped

#### Examples

``` rust
{
  let s = "hello"
}
// s no longer in scope
```

Multiple variables interact differently. **Static** types the assignation copies the value. They have a fixed size and live therefore on the Stack memory.

``` rust
let x = 5;   // binds 5 to x
let y = x;   // copies the values

// both contain the value 5
```

With **dynamic** types the assignation moves the ownership.

``` rust
let s1 = String::from("hello");
let s2 = s1;
```

This is represented in the picture below:

![Ownership on String types](img/ownership_string.svg){.center}

### Ownership and Functions

``` rust
fn main() {
  let s = String::from("hello"); // s comes into scope
  takes_ownership(s);            // s value moves into the function
                                 // s is no longer valid here

 let x = 5;                      // x comes into scope
 makes_copy(x);                  // x would move into the function
                                 // x is i32 and is copied,
                                 // x and can further be used
} // Here, x goes out of scope, then s.
  // However, because s value was moved, nothing special happens.

fn takes_ownership(some_string: String) { // some_string comes into scope
  println!("{some_string}");
} // Here, some_string goes out of scope and `drop` is called.
  // The backing memory is freed.

fn makes_copy(some_integer: i32) { // some_integer comes into scope
  println!("{some_integer}");
} // Here, some_integer goes out of scope. Nothing special happens.
```

### Return Values and Scope

``` rust
fn main() {
  let s1 = gives_ownership(); // gives_ownership moves its return value into s1

  let s2 = String::from("hello");    // s2 comes into scope
  let s3 = takes_and_gives_back(s2); // s2 is moved into takes_and_gives_back
                                     // takes_and_gives_back moves its return value into s3
} // s3 goes out of scope and is dropped.
  // s2 was moved, so nothing happens.
  // s1 goes out of scope and is dropped.

// gives_ownership will move its return value into the function that calls it
fn gives_ownership() -> String {
  let some_string = String::from("yours"); // some_string comes into scope
  some_string                              // some_string is returned and
}                                          // moves out to the calling function

// This function takes a String and returns a String.
fn takes_and_gives_back(a_string: String) -> String { // a_string comes into scope
  a_string  // a_string is returned and moves out to the calling function
}
```

Returning ownership of parameters

``` rust
fn main() {
  let s1 = String::from("hello");
  let (s2, len) = calculate_length(s1);
  println!("The length of '{s2}' is {len}.");
}

fn calculate_length(s: String) -> (String, usize) {
  let length = s.len(); // len() returns the length of a String
  (s, length)           // return parameters ownership and length
}
```

### References and Borrowing

A *reference* is like an pointer to the pointer of the data. The data is still owned by some other variable. Unlike a pointer a reference points always to a valid value for the life of that reference.

``` rust
fn main() {
  let s1 = String::from("hello");
  let len = calculate_length(&s1);
  println!("The length of '{s1}' is {len}.");
}

// s doesn't have ownership, therefore the variable is not dropped.
fn calculate_length(s: &String) -> usize {
  s.len()
}
```

![Reference on a string](img/reference_string.svg){.center}

!!! note
    `&` is referencing and `*` is dereferencing. The action of creating a *reference* is called *borrowing*.

#### Mutable References

A *mutable reference* allows to modify a borrowed value

``` rust
fn main() {
  let mut s = String::from("hello");
  change(&mut s);
}

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}
```

!!! warning
    A *mutable reference* cannot have another reference to that value.

The first *mutable reference* need to go out of scope in order to create a new ones

``` rust
let mut s = String::from("hello");
{
  let r1 = &mut s;     // r1 is a mutable reference to s
}                      // r1 goes out of scope here
let r2 = &mut s;        // r2 is a new mutable reference to s
```

#### Reference Rules

- At any given time, *either* **one mutable reference** *or* **any number of immutable references**.
- References must always be valid.
