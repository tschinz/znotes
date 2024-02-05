---
tags:
- tools
- jupyter
---
#  Common Functions
## Common Jupyterlab and Nodejs functions
### install nvm

``` bash
https://github.com/creationix/nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | zsh
### Install latest nodejs
npm install node # "node" is an alias for the latest version
```

### Install nodejs via conda

``` bash
conda install -c conda-forge nodejs
```

### update npm

``` bash
sudo npm install -g npm
```

### Rebuild Jupyterlab

``` bash
jupyter lab build
```

### Remove nodejs and npm

``` bash
conda remove nodejs npm
```

## Auto import of Libraries

- Navigate to `~/.ipython/profile_default`
- Create a folder called `startup` if it's not already there
- Add a new Python file called `start.py`
- Put your favorite imports in this file
- Launch IPython or a Jupyter Notebook and your favorite libraries will be automatically loaded every time!

Example `start.py`

``` python linenums="1"
import pandas as pd
import numpy as np

# Pandas options
pd.options.display.max_columns = 30
pd.options.display.max_rows = 20

from IPython import get_ipython
ipython = get_ipython()

# If in ipython, load autoreload extension
if 'ipython' in globals():
    print('\nWelcome to IPython!')
    ipython.magic('load_ext autoreload')
    ipython.magic('autoreload 2')

# Display all cell outputs in notebook
from IPython.core.interactiveshell import InteractiveShell
InteractiveShell.ast_node_interactivity = 'all'

# Visualization
import plotly.plotly as py
import plotly.graph_objs as go
from plotly.offline import iplot, init_notebook_mode
init_notebook_mode(connected=True)
import cufflinks as cf
cf.go_offline(connected=True)
cf.set_config_file(theme='pearl')

print('Your favorite libraries have been loaded.')
```

## Check

Confirm that Libraries are loaded with

``` python
globals()
```
