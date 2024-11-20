---
tags:
- coding
- rust
- cargo
- cargo add
- cargo bundle
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

```ìnfo
to use `cargo add` you need to install it first with: `cargo install cargo-edit`
```

## crates

A crate is a collection of Rust source files.

- *binary crate* - is an executable
- *library crate* - code intended to use by other programs

## Statements vs Expression

Rust is an expression-based language.

- Expression evaluate to a result value.
- Statements are instructions that perform some action and do not return a value
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
