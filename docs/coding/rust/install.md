---
tags:
- coding
- rust
- install
---
# Install and Setup
## Install

See [Rustup](https://rustup.rs)

``` bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Additional Install

``` bash
cargo install racer      # Rust completion utility
cargo install rustfmt    # Rust formatting tool according to guidelines

xcode-select --install   # for macos install c compiler

cargo install cargo-edit # allows adding packages with the command cargo add
```

## VS Code

Install extension
[rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)

## SublimeText

Install extension [Rust Enhanced](https://packagecontrol.io/packages/Rust%20Enhanced)

## Update

``` bash
rustup update
```

## Uninstall

``` bash
rustup self uninstall
```

## Jupyter Notebook

``` bash
# install evcxr
cargo install evcxr_repl

# create conda environment
conda create --name evcxr
conda activate evcxr

# install conda packages
conda install -y -c conda-forge nb_conda_kernels

# install rust jupyter packages
cargo install evcxr_jupyter
evcxr_jupyter --install

# install jupyterlab
conda install -c conda-forge jupyterlab

# export conda environment
conda env export > condaenv.yml

# start jupyter notebook
jupyter notebook

# start jupyterlab
jupyter lab
```
