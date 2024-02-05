---
tags:
- coding
- python
- virtualenv
---
# Virtual Environments

A short overview about python virutal environment tool. For more detailed informations see [pipenv](./pipenv.md)

## `pip`

The **p**ackage **i**nstaller for **p**ython (pip) has in in itself a feature to save and install python modules automatically. All installed modules of the current enviroment can be saved into a file called `requirements.txt`.

``` bash
pip freeze > requirements.txt
```

if such a file exist, all modules can automatically be installed in the current python environemnt.

``` bash
pip install -r requirements.txt
```

More information about pip can be found at: [pip_general](./pip_general.md)

But there are some missing features.

- Version depended modules are difficult to manage
- The notion of a virtual environemnt is completely missing

## Overview

Because `pip` only manages packages many virtual environment tools existg in python. It is always recommended to use a virtual environemnt for a project to not run into compatibility issues especially if working on multiple projects in parallel and multiple developers on the same code.

Existing virtual environments systems, there are confliciting standards. It is recommended to not use multiple packages in parallel.

- [pipenv](./pipenv.md)
- [pew](https://pypi.org/project/pew)
- [virtualenv](https://pypi.python.org/pypi/virtualenv)
- [pyenv](https://github.com/yyuu/pyenv)
- [pyenv-virtualenv](https://github.com/yyuu/pyenv-virtualenv)
- [virtualenvwrapper](https://pypi.python.org/pypi/virtualenvwrapper)
- [pyenv-virtualenvwrapper](https://github.com/yyuu/pyenv-virtualenvwrapper)
- [venv](https://docs.python.org/3/library/venv.html)

### pipenv

Aims to combine `Pipfile`, `pip` and `virtualenv` into one command on the command-line. The `virtualenv` directory typically gets placed in `~/.local/share/virtualenvs/XXX`, with `XXX` being a hash of the path of the project directory. This is different from `virtualenv`, where the directory is typically in the current working directory. `pipenv` is meant to be used when developing Python applications (as opposed to libraries). For more informations see: `pipenv`{.interpreted-text role="doc"}.

### pew

`pew` acts as a wrapper and you only need to remember this command once you start working with it as it can be used for all commands that we would need.

### virtualenv

A very popular tool that creates isolated Python environments for Python libraries. It works by installing files in a directory eg: `env/`, and then modifying the `PATH` environment variable to prefix it with a custom bin directory eg: `env/bin/`. An exact copy of the python or python3 binary is placed in this directory, but Python is programmed to look for libraries relative to its path first, in the environment directory. Once activated, you can install packages in the virtual environment using `pip`.

### pyenv

Used to isolate Python versions. For example, you may want to test your code against Python 2.7, 3.6, 3.7 and 3.8, so you'll need a way to switch between them. Once activated, it prefixes the `PATH` environment variable with `~/.pyenv/shims`, where there are special files matching the Python commands (`python`, `pip`). These are not copies of the Python-shipped commands; they are special scripts that decide on the fly which version of Python to run based on the `PYENV_VERSION` environment variable, or the `.python-version` file, or the `~/.pyenv/version` file. `pyenv` also makes the process of downloading and installing multiple Python versions easier, using the command `pyenv install`.

### pyenv_virtualenv

A plugin for `pyenv`, to allow you to use `pyenv` and `virtualenv` at the same time conveniently. However, if you're using Python 3.3 or later, `pyenv-virtualenv` will try to run `python -m venv` if it is available, instead of `virtualenv`. You can use `virtualenv` and `pyenv` together without `pyenv-virtualenv`, if you don't want the convenience features.

### virtualenvwrapper

A set of extensions to `virtualenv`. It gives you commands like `mkvirtualenv`, `lssitepackages`, and especially `workon` for switching between different `virtualenv` directories. This tool is especially useful if you want multiple `virtualenv` directories.

### pyenv-virtualenvwrapper

A plugin for `pyenv`, to conveniently integrate `virtualenvwrapper` into `pyenv`.

### venv

A package shipped with Python 3, which you can run using `python3 -m venv`. It serves the same purpose as `virtualenv`, but only has a subset of its features. `virtualenv` continues to be more popular than `venv`, especially since the former supports both Python 2 and 3.
