---
tags:
- tools
- cli
- git
- submodules
---
#  Git Submodules

## Clone Repo with submodules

``` bash
git clone --recursive [URL to Git repo]
```

## Pull changes

### Pull all changes in the repo including changes in the submodules

``` bash
git pull --recurse-submodules
```

### Pull all changes for the submodules

``` bash
git submodule update --remote
```

## Add submodule and define the master branch as the one you want to track

``` bash
git submodule add -b master [URL to Git repo]

git submodule init
```

## Move Submodule

``` bash
git mv a b
```
