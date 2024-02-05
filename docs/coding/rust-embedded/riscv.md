---
tags:
- coding
- rust
- embedded
- risc-v
---
# RISC-V

More information on: [RISC-V Cross Compilation](https://danielmangum.com/posts/risc-v-bytes-rust-cross-compilation/)

## Install

Add cross compile tools to

``` bash
# Debian
apt-get install gcc-riscv64-linux-gnu
```

``` bash
# MacOS
brew tap riscv/riscv && brew install --cc=gcc-10 riscv-tools
```

Tier 3 target with `no_std` support

``` bash
rustup target add riscv32imac-unknown-none-elf
rustup target add riscv32i-unknown-none-elf
```

Tier 2 target with `std` support

``` bash
rustup target add riscv64gc-unknown-linux-gnu
```

## Compile

### `rustc`

``` bash
# compile for riscv target
rustc --target riscv32imac-unknown-none-elf <ifname>.rs
rustc --target riscv64gc-unknown-linux-gnu <ifname>.rs

# compile and get assembler code
rustc --target riscv32i-unknown-none-elf --emit asm <ifname>.rs
rustc --target riscv64gc-unknown-linux-gnu --emit asm <ifname>.rs
```

### `cargo`

``` bash
cargo rustc --target riscv32imac-unknown-none-elf -- --emit asm
cargo rustc --target riscv64gc-unknown-linux-gnu -- --emit asm
```

## Check

Check if the architecture is for riscv target

``` bash
readelf -h <binfname> | grep "Machine"
```
