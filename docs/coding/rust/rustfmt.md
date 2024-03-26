# Rustfmt

[Rustfmt](https://github.com/rust-lang/rustfmt) is a tool for formatting Rust code according to the official Rust style guidelines. It helps ensure consistent code formatting across projects and improves code readability.

All configuration options are stored in a `.rustfmt.toml` file in the root of your project. This file can be used to customize the formatting rules to suit your project's needs.

- [Configuration Documentation](https://rust-lang.github.io/rustfmt/)

## Features

- Automatic code formatting: Rustfmt automatically formats your code based on the official Rust style guidelines.
- Configurable options: You can customize the formatting rules by modifying the `.rustfmt.toml` configuration file.
- Integration with build systems: Rustfmt can be integrated into your build system or editor to automatically format code on save or on demand.
- IDE support: Rustfmt is supported by popular Rust IDEs such as Visual Studio Code, IntelliJ Rust, and Atom.

## Installation

To install Rustfmt, you can use the following command:
```bash
rustup component add rustfmt
```

## Usage
```bash
cargo fmt
```

## My config

```toml title="rustfmt.toml"
edition = "2021"

tab_spaces = 2
max_width = 160

#indent_style = "Block"
#trailing_comma = "Always"

#merge_imports = true
reorder_imports = true
```