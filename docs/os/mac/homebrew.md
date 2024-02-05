---
tags:
- os
- operating system
- macos
- brew
- homwbrew
---
# Homebrew

![](img/homebrew.svg){.center width="20%"}

[https://brew.sh](https://brew.sh)

## Installation

``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Commands

``` bash
# update Homebrew
brew update

# install application
brew install --cask <graphical_programname> # gui application
brew install <programname>                  # cmdline application

# update application
brew upgrade <programname>

# uninstall application
brew uninstall <programname>

# search application
brew search <programname>

# info about application
brew info <programname>
```

## Useful Applications

- Krusader
- kdiff3
- md5deep
- unrar
- pzip
- putty
- tightvnc
- ...

