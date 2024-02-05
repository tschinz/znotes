---
tags:
- tools
- sphinx
---
#  Sphinx Documentation

![](img/logo.png){.center width="40%"}

## Contents

## Introduction

Python has a build in Documentation system called [DocString](http://legacy.python.org/dev/peps/pep-0257/). [Sphinx](http://sphinx-doc.org/) is building on top of that, to automatically create a documentation of your python code. You can then later create different output file formats of your documentation. Addintionally a Sphinx documentation source can also be a plain `.rst` or `.md` filesystem.

This page and subpages are only a small CheatSheet references for installing, writing and building SPHINX documentation.

## Installation

### Linux

``` bash
sudo apt-get install python-sphinx

echo "Install sphinx extensions
pip install sphinx-rtd-theme
pip install sphinxcontrib-wavedrom
pip install sphinxcontrib-plantuml
pip install recommonmark
pip install sphinxemoji

echo "Install build-essentials (for make)"
sudo apt-get update
sudo apt-get install -y build-essential

echo "Install graphviz"
sudo apt-get install -y graphviz

echo "Install Inkscape"
sudo apt-get install -y inkscape

echo "Install texlive"
sudo apt-get install -y texlive-full

echo "Install Java"

sudo dpkg --configure -a
mkdir -p /usr/share/man/man1
sudo apt-get install -y default-jdk
```

## Check installation

``` bash
which sphinx-quickstart
```

## Configuration

see [znotes conf.py]({{base_repo_file}}/docs/tools/sphinx/docs/conf.py)
