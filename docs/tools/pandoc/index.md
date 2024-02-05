---
tags:
- tools
- pandoc
---
#  Pandoc

![](img/logo.svg){.center width="20%"}

If you need to convert files from one markup format into another, pandoc is your swiss-army knife.

- [Pandoc Online](https://pandoc.org/try/)
- [Pandoc Download](https://pandoc.org/installing.html)

## Additional Arguments

### Highlight Styles

``` bash
# List all Highlight Styles
pandoc --list-highlight-styles
pygments
tango
espresso
zenburn
kate
monochrome
breezedark
haddock

## Pandoc Argument
--highlight-style breezedark
```

### PDF Output

``` bash
--pdf-engine=xelatex
```

#### For my template needed packages

- cm-super
    - Error no Scalable font
- koma-script
    - ! LaTeX Error: File `scrartcl.cls` not found.

### Template

Latex Template needs to be in the following folders

#### Windows

``` bash
C:\\Users\\<username>\\AppData\\Roaming\\pandoc\\templates
```

#### Linux

``` bash
~/.pandoc/templates/
```

``` bash
--template=<template>.latex
```
