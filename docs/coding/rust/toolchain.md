---
tags:
- coding
- rust
- toolchain
---
# Toolchain

## `rustup`

`rustup` is an installer for the systems programming language Rust.

### `rustup` Commands

```
SUBCOMMANDS:
    show           Show the active and installed toolchains or profiles
    update         Update Rust toolchains and rustup
    check          Check for updates to Rust toolchains and rustup
    default        Set the default toolchain
    toolchain      Modify or query the installed toolchains
    target         Modify a toolchain's supported targets
    component      Modify a toolchain's installed components
    override       Modify directory toolchain overrides
    run            Run a command with an environment configured for a given toolchain
    which          Display which binary will be run for a given command
    doc            Open the documentation for the current toolchain
    man            View the man page for a given command
    self           Modify the rustup installation
    set            Alter rustup settings
    completions    Generate tab-completion scripts for your shell
```

### Common `rustup` commands

``` bash
rustup show                                     # shows installed toolchain
rustup target add riscv32imac-unknown-none-elf  # adds riscv target
rustup update                                   # updates the toolschain
rustup toolchain list                           # lists the toolchain
rustup doc                                      # opens the local documentation
```

## `rustc`

`rustc` is the compiler for Rust.

``` bash
# Compile rust file
rustc <ifname>.rs -o <ofname> -v

# Compile with different outputname and verbose flag
rustc <ifname>.rs -o <ofname> -v

# Compile rust to a library
rustc --crate-type lib rustc <ifname>.rs

# Compile rust file for a specifiy target
rustc --target target_arch <ifname>.rs

# Create documentation for a Rust library
rustc --document <ifname>.rs
```

| Target                           | Explanation |
| -------------------------------- | --------------------------------- |
| `x86_64-unknown-linux-gnu`       | x86 64bit Linux |
| `x86_64-apple-darwin`            | x86 64bit MacOS |
| `x86_64-pc-windows-gnu`          | x86 64bit MinGW on Windows |
| `aarch64-unknown-linux-gnu`      | Arm 64bit Linux |
| `aarch64-apple-darwin`           | Arm 64bit MacOS (Apple Silicon) |
| `riscv32imac-unknown-none-elf`   | RISC-V rv32i |

### Example

``` bash
rustc hello.rs
```

``` bash
rustc --target riscv32imac-unknown-none-elf -o hello main.rs
```

## Cargo

### Cargo Commands

```
Some common cargo commands are (see all commands with --list):
  build, b    Compile the current package
  check, c    Analyze the current package and report errors, but don't build object files
  clean       Remove the target directory
  doc, d      Build this package's and its dependencies' documentation
  new         Create a new cargo package
  init        Create a new cargo package in an existing directory
  add         Add dependencies to a manifest file
  remove      Remove dependencies from a manifest file
  run, r      Run a binary or example of the local package
  test, t     Run the tests
  bench       Run the benchmarks
  update      Update dependencies listed in Cargo.lock
  search      Search registry for crates
  publish     Package and upload this package to the registry
  install     Install a Rust binary. Default location is $HOME/.cargo/bin
  uninstall   Uninstall a Rust binary
```

### Install a package

``` bash
cargo search <searchstring>
```

``` bash
cargo install <packagename>
```

### Create project

``` bash
cargo new <projectname>       # creates package folder and initialises it
cargo new --lib <projectname> # creates library package folder and initialises it
cargo init                    # creates project in current folder
```

#### Hello World project

``` bash
cargo new hello         # create new hello world project in folder hello
cd hello                # move into folder
cargo run               # build and run project
```

## Compile

``` bash
# Build debug verions of the project with its dependencies
cargo build

# Build release version of the project with its dependencies
cargo build --release

# Build and generate also assember file
# need to be assembler with tools like gas
cargo rustc -- -- emit asm

# Build and generate also assember file for another target
cargo rustc --target riscv32i-unknown-none-elf -- --emit asm
```

### Common cargo commands

``` bash
# Build debug verions of the project with its dependencies
cargo build

# Build release version of the project with its dependencies
cargo build --release

# Builds debug version if necessary and runs the generated executable
cargo run

# Check project of errors without building a binary
cargo check

# Updates dependencies of a project with the latest version (patch version)
cargo update

# Cleans build artifacts
cargo clean

# Build html documentation for the code and its dependencies
cargo doc
cargo doc --open

# Add package to current project
# only works if ``cargo install cargo-edit`` is installed
cargo add rand
```

## Cargo Profiles

Release Profiles configure the code compilation for `cargo`.

Two main profiles are available ba default: `dev` and `release`

``` bash
cargo build           # dev build
cargo build --release # release build
```

### Customise

``` toml title="Cargo.toml"
# ...

[profile.dev]
opt-level = 0  # default

[profile.release]
opt-level = 3  # default

# ...
```

## Publishing Crate at cratess.io

Unter [crates.io](https://crates.io) generate a accesstoken for your
device and enter it via the command line

``` bash
cargo login <api token>
```

Verify crates metadata:

``` bash title="Cargo.toml"
[package]
name = "crates_name" # must be unique within crates.io
version = "1.0.0"
authors = ["tschinz"]
edition = "2023"
description = "library description"
license = "MIT"

# ...
```

Publish the crate to [crates.io](https://crates.io)

``` bash
cargo publish
```

Disallow the download of a specific crate version in
[crates.io](https://crates.io)

``` bash
cargo yank --vers 1.0.0
```