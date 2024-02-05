---
tags:
- tools
- just
---
#  Installation

## From source

Since just is written in rust you can install it with rust's cargo package manager if you have [rust installed](https://www.rust-lang.org/tools/install). This works on all operating systems.

``` bash
# install rust and cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install just
cargo install just
```

## MacOS

With macOS install it with the help of [homebrew](https://formulae.brew.sh/formula/just#default)

``` bash
brew install just
```

## Windows

On windows you can either use a package manager such as chocolaty, winget or scoop.

``` bash
# Scoop
scoop install just
# Chocolatey
choco install just
# Winget
winget install --id Casey.Just --exact
```

Or install the prebuild binaries which can be found on the github repo.

<https://github.com/casey/just/releases>

## Linux

On linux use the package manager of your choice

``` bash
# Alpine
apk install just
# Ubuntu
sudo apt get install just
# Arch
pacman -S just
```
