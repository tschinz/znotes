---
tags:
- coding
- rust
- package
---
# Package Structure

- package - is the projects which happens when performing `cargo new` command.
    - crates - every package contains
        - crate types
            - _binary crate_ - code to execute
            - _library crate_ - code to be use by others
        - modules - crates contains modules with privacy rules
        - workspaces - for big projects ans allows to store interrelated packages

## Crates

In every project there are two main files `main.rs` and `lib.rs`. For a binary project, the `main.rs` file is the entry point of the program. For a library project, the `lib.rs` file is the entry point of the library. If there are multiple source files in the project there are different ways to intregrate them into your project.

### Binary crate

A project containing `main.rs` file in the root of the project `scr/` directory. Cargo creates a binary crate with the binary name the same as the package name defined in `Cargo.toml`.

To create more binary crates. Add files with the crate name in a new subfolder `src/bin/`

``` rust
cargo new <packagename>
```

#### Structure

file structure:

```
└── src/
   ├── main.rs
   ├── config.rs
   └── helpers.rs
```

```rust title="main.rs"
mod config;
mod helpers;

fn main() {
    config::read_config();
}
```

```rust title="config.rs"
crate::helpers::do_something();

pub fn read_config() {
    do_something();
    println!("Reading config");
}
```

```rust title="helpers.rs"
pub fn do_something() {
    println!("Doing something");
}
```

### Library crate

A project containing `lib.rs` file in the root of the project `scr/` directory. Cargo creates a library crate with the library name the same as the package name defined in `Cargo.toml``.

``` rust
cargo new --lib <packagename>
```

#### Structure

including a `main.rs`

file structure:

```
rustlib/
└── src/
   ├── main.rs
   ├── lib.rs
   ├── config.rs
   └── helpers.rs
```

```rust title="lib.rs"
pub mod config;
pub mod helpers;
```

```rust title="main.rs"
user rust_lib::config;

fn main() {
    config::read_config();
}
```

```rust title="config.rs"
crate::helpers::do_something();

pub fn read_config() {
    do_something();
    println!("Reading config");
}
```

```rust title="helpers.rs"
pub fn do_something() {
    println!("Doing something");
}
```

### Rules

1. A package needs to have at least one crate.
2. A package need to have 0 or 1 library crate.
3. A package can have any number of binary crates.
