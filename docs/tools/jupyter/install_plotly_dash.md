---
tags:
- tools
- jupyter
- Plotly Dash
---
# Plotly Dash

``` bash
# The core dash backend
pip install dash==0.43.0
# DAQ components (newly open-sourced!)
pip install dash-daq==0.1.0
```

## Checking Versions

``` python
import dash_core_components
print(dash_core_components.__version__)
```

## Getting help

``` python
help(dcc.Dropdown)
```

## Jupyter integration install

``` bash
git clone https://github.com/plotly/jupyterlab-dash
cd jupyterlab-dash
npm install
npm run build
jupyter labextension link .
~/anaconda3/bin/./python -m pip install -e .
```

## To rebuild the package and the JupyterLab app

``` bash
npm run build
jupyter lab build
```

## Additional Packages

``` bash
pip install aiohttp
pip install django_plotly_dash
pip install jupyter_plotly_dash
```

## Install Dash DAQ

``` bash
pip install dash_daq
```