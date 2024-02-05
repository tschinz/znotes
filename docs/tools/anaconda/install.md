---
tags:
- tools
- anaconda
---
#  Install

Download [Anaconda](https://www.anaconda.com/products/individual) here.

## Conda

At installation (Anaconda), conda creates a generic environment called `base` which is activated by default. Therefore, when installing a package with `conda install`, the package will be installted in that environment. You can be more explicit and activate the environment by typing `conda activate` or `conda activate base` in a terminal.

See dedicated conda page for more information about conda: [Conda](./conda.md)

## ZSH Config

In order to configure the location of the anaconda environment within the shell perform the following actions.

Execute the command to hide the conda environments

``` bash
conda config --set changeps1 false
```

Add to your `.zshrc`
[conda-setup.bash]({{config_repo_file}}/scripts/shell/conda-setup.bash)

## Jupyter

See the dedicated jupyter pages for more information about jupyter: [Jupyter](../../tools/jupyter/index.md)

## PIP

See the dedicated pip page for more information about pip install [PiP](../../coding/python/pip_general.md)

## Conda Environment Setup

Setup an conda environment contains many times the same stuff

``` bat title="Windows conda environmnt setup"
set CONDAENV=envname
conda create -n %CONDAENV%

:: default packages
conda install pip

:: pip packages
pip install IPython
pip install ipykernel
pip install numpy
pip install plotly
pip install pandas
pip install matplotlib
pip install jupyter-kite
pip install seaborn

:: jupyterlab extensions
set NODE_OPTIONS=--max-old-space-size=4096
jupyter labextension install @jupyter-widgets/jupyterlab-manager plotlywidget@4.9.0 --no-build
jupyter labextension install jupyterlab-plotly --no-build
jupyter labextension install run-tag-cells-jlab --no-build
jupyter labextension install "@kiteco/jupyterlab-kite" --no-build

jupyter lab build
set NODE_OPTIONS=
```

## Additional Installs

### Sphinx

Install requirements for sphinx

``` bash
pip install sphinx
pip install sphinx-rtd-theme
pip install pydata-sphinx-theme
pip install sphinxcontrib-wavedrom
pip install sphinxcontrib-plantuml
pip install recommonmark
pip install sphinxemoji
pip install sphinx-copybutton
pip install nbsphinx
pip install jupyter_sphinx
pip install sphinx-panels
pip install nbsphinx
pip install IPython
pip install ipykernel
pip install numpy
pip install plotly
pip install pandas
pip install matplotlib
```

### Kite

Install requirements for Kite

``` bash
pip install jupyter-kite
jupyter labextension install "@kiteco/jupyterlab-kite"
```
