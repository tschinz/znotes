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
      - binary crate - code to execute
      - library crate - code to be use by others
    - modules - crates contains modules with privacy rules
    - workspaces - for big projects ans allows to store interrelated packages

## Crates

### Binary crate

A project containing `main.rs` file in the root of the project `scr/` directory. Cargo creates a binary crate with the binary name the same as the package name defined in `Cargo.toml`.

To create more binary crates. Add files with the crate name in a new subfolder `src/bin/`

``` rust
cargo new <packagename>
```

### Library crate

A project containing `lib.rs` file in the root of the project `scr/` directory. Cargo creates a library crate with the library name the same as the package name defined in `Cargo.toml``.

``` rust
cargo new --lib <packagename>
```

### Rules

1. A package needs to have at least one crate.
2. A package need to have 0 or 1 library crate.
3. A package can have any number of binary crates.
