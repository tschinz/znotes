---
tags:
- coding
- python
- pip
- environment
---
# pipenv

Pipenv is a tool that aims to bring the best of all packaging worlds (bundler, composer, npm, cargo, yarn, etc.) to the Python world.

It automatically creates and manages a virtualenv for your projects, as well as adds/removes packages from your Pipfile as you install/uninstall packages. It also generates the ever-important Pipfile.lock, which is used to produce deterministic builds.

## Installation

``` bash
pip install pipenv
```

!!! note
    Generally, keep both `Pipfile` and `Pipfile.lock` in version control.

## `Pipfile`

`Pipfile` contain information for the dependencies of the project, and supersedes the `requirements.txt` file used in most Python projects.

### Import from existing file

The import will search first for a `Pipfile` and `Pipfile.lock` file. If found a virtual environemnt with that packages will be created. If there files are not found `pipenv` will search for a `requirements.txt` and create a new `Pipfile` with its content. Afterwards a virtual environment will be created from it.

``` bash
pipenv install
```

## `Pipfile.lock`

This file lock all dependencies of the current installed packages

``` bash
pipenv lock
```

## Packages

### Install

`*` meant the latest version on that level

``` python
# Install from requirements.txt
pipenv install

# Install one package
pipenv install <packagename>
pipenv install <packagename>=='<version>'
pipenv install Flask=='0.11.*'

# Install dev packages
pipenv install --dev <packagename>
```

### Uninstall

``` python
# uninstall one package
pipenv uninstall <packagename>

# uninstall all packages
pipenv uninstall --all

# uninstall all dev packages
pipenv uninstall --all-dev
```

### Update

Update all installed packages to the latest pip version

``` bash
pipenv update
```

## Run

### pipenv shell

Each virtualenvironemnt has its own shell. In order to access it you have to launch it.

``` bash
# Goto project folder with Pipfile
cd myproject

# Launch virtual environment
pipenv shell

# Exit virtual environment
exit
```

### Run command in pipenv

If you don't want to use the virtual environment shell you can also just launch one command with:

``` bash
pipenv run <commandname>
pipenv run python app.py
```

## Virtual environment

### Create new pipenv

In order to create a new virtual environment define the python version.

``` bash
pipenv --python 3.6
```

### Remove pipenv

If you want to remove a virtual envrironment launch

``` bash
pipenv --rm
```

## Dependency Graph

``` bash
pipenv graph
```

## Workflow

``` bash
# Goto git repo
cd myproject

# Install environment if there is a Pipfile
# Also imports from requirements.txt if there is one
pipenv install

# Add new package to the project
pipenv install <package>

# Activate Pipenv shell
pipenv shell
python --version

# Lock all dependencies in file Pipenv.lock
pipenv lock

# Run environment for project
pipenv run <command>
```