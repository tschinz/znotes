---
tags:
- multimedia
- writing
- typst
---
# Installation

## From source

Since typst is written in rust you can install it with rust's cargo package manager if you have [rust installed](https://www.rust-lang.org/tools/install). This works on all operating systems.

``` bash
# install rust and cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install a specific version of typst
cargo install --git https://github.com/typst/typst --tag v0.7.0

# install latest version of typst
cargo install --git https://github.com/typst/typst
```

## Pre-build binaries

Download the prebuild binaries the the [github release page](https://github.com/typst/typst/releases) onto your computer and put it's location into the `PATH`.
