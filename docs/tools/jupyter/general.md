---
tags:
- tools
- jupyter
---
#  General
## Config

``` bash
# Show the location of the config directory
jupyter --config-dir

# Show the location of the data directory
jupyter --data-dir

# Show all Jupyter directories and search paths
jupyter --paths

# List notebook extensions
jupyter nbextension list

# List running notebook servers
jupyter notebook list
```

### Change Password

``` bash
jupyter notebook password
```

## Jupyterlab

Create a config file

``` bash
jupyter lab --generate-config
```

The Config file is located at the config repo:
[jupyterlab_settings.json]({{config_repo_file}}/config/jupyter/jupyterlab_settings.json)
[jupyter_notebook_config.py]({{config_repo_file}}/config/jupyter/.jupyter_zell/jupyter_notebook_config.py)

### Extensions

Get installed extensions

``` bash
jupyter labextension list
```

Install extension

``` bash
jupyter labextension install <extensionsname>
```

For Matplotlib see: [https://github.com/matplotlib/jupyter-matplotlib](https://github.com/matplotlib/jupyter-matplotlib)

See all Jupyterlab Extensions: [https://www.npmjs.com/search?q=keywords:jupyterlab-extension](https://www.npmjs.com/search?q=keywords:jupyterlab-extension)

## Kernels

Inspect available Kernels

``` bash
jupyter kernelspec list
```

Use a specific kernel

``` bash
jupyter qtconsole --kernel=machine-learning-jh44uwir
```

## Troubleshoot

``` bash
jupyter troubleshoot
```
