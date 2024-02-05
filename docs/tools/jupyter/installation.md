---
tags:
- tools
- jupyter
---
#  Installation

see also [jupyter config]({{config_repo_folder}}/config/jupyter)

## My Extension list

``` bash linenums="1"
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install @jupyterlab/statusbar-extension
jupyter labextension install @jupyterlab/plotly-extension
jupyter labextension install @jupyterlab/toc
jupyter labextension install @deathbeds/jupyterlab_graphviz
jupyter labextension install @ryantam626/jupyterlab_sublime
jupyter labextension install jupyter-matplotlib
jupyter labextension install @mflevine/jupyterlab_html
jupyter labextension install jupyterlab-drawio
jupyter labextension install jupyterlab-flake8
jupyter labextension install jupyterlab_hidecode
jupyter labextension install @lckr/jupyterlab_variableinspector
jupyter labextension install @jupyter-widgets/jupyterlab-manager
```

### IDE Features

nbdev adds jupyter with the follwoing features:

- a variable explorer, a list of breakpoints and a source preview
- the possibility to navigate the call stack (next line, step in, step out etc.)
- the ability to set breakpoints intuitively, next to the line of interest
- flags to indicate where the current execution has stopped

``` bash linenums="1"
pip install nbdev
conda install xeus-python -c conda-forge
pip install jupyter_server
jupyter labextension install @jupyterlab/debugger
```

## All in one install

``` bash linenums="1"
jupyter labextension install @jupyter-widgets/jupyterlab-manager @jupyterlab/statusbar-extension @jupyterlab/plotly-extension @jupyterlab/toc @deathbeds/jupyterlab_graphviz @ryantam626/jupyterlab_sublime jupyter-matplotlib @mflevine/jupyterlab_html jupyterlab-drawio jupyterlab-flake8 jupyterlab_hidecode @lckr/jupyterlab_variableinspector @jupyter-widgets/jupyterlab-manager
```

### Add install R to jupyter

``` bash
conda install -c r r-essentials
```

### Add install pandoc and inkscape to conda

``` bash linenums="1"
conda install -c conda-forge pandoc
conda install -c conda-forge inkscape
```

## Install Python Additional Stuff
### Graphviz

Install Graphviz from [https://graphviz.gitlab.io/download/](https://graphviz.gitlab.io/download/) put Graphviz/bin in your `PATH`

``` bash
pip install graphviz
```

### Install python Libraries

``` bash linenums="1"
pip install pixiedust
pip install SchemDraw
pip install nbwavedrom
pip install flake8
pip install pyflakes
pip install nbconvert
pip install watermark
pip install sty
```

**oneline**

``` bash
pip install pixiedust SchemDraw nbwavedrom flake8 pyflakes nbconvert graphviz watermark
```

## Problems
### Anaconda Navigator not starting

When starting anaconda-navigator produces the follwowing error.

``` bash linenums="1"
$ anaconda-navigator.exe
Traceback (most recent call last):
  File "c:\Users\silvan.zahno\AppData\Local\Continuum\anaconda3\lib\site-packages\qtpy\__init__.py", line 202, in <module>
    from PySide import __version__ as PYSIDE_VERSION  # analysis:ignore
ModuleNotFoundError: No module named 'PySide'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "c:\Users\silvan.zahno\AppData\Local\Continuum\anaconda3\Scripts\anaconda-navigator-script.py", line 6, in <module>
    from anaconda_navigator.app.main import main
  File "c:\Users\silvan.zahno\AppData\Local\Continuum\anaconda3\lib\site-packages\anaconda_navigator\app\main.py", line 22, in <module>
    from anaconda_navigator.utils.conda import is_conda_available
  File "c:\Users\silvan.zahno\AppData\Local\Continuum\anaconda3\lib\site-packages\anaconda_navigator\utils\__init__.py", line 15, in <module>
    from qtpy.QtGui import QIcon
  File "c:\Users\silvan.zahno\AppData\Local\Continuum\anaconda3\lib\site-packages\qtpy\__init__.py", line 208, in <module>
    raise PythonQtError('No Qt bindings could be found')
qtpy.PythonQtError: No Qt bindings could be found
```

``` bash linenums="1"
pip uninstall PyQt5
conda update conda
conda update anaconda-navigator
anaconda-navigator.exe
```

## Install Plotly and Plotly Express

``` bash
conda install -c plotly plotly_express plotly-orca
```

## Better PDF Export

``` bash linenums="1"
sudo apt-get install texlive-xetex
pip install jupyter_contrib_nbextensions
pip install cite2c
```

## Enable HTTPS

See: [https://juno.sh/ssl-self-signed-cert/](https://juno.sh/ssl-self-signed-cert/)

``` bash
#!/bin/bash
# Create Directory Structure
mkdir ca ca/certs ca/crl ca/newcerts ca/private
chmod 700 ca/private
touch ca/index.txt
echo 1000 > ca/serial

# Generate CA root key
openssl genrsa -aes256 -out ca/private/ca.key.pem 4096
chmod 400 ca/private/ca.key.pem

# Use the root key (ca.key.pem) to create a root certificate (ca.cert.pem)
openssl req -config openssl.cnf -key ca/private/ca.key.pem -new -x509 -days 7300 -sha256 -extensions v3_ca -out ca/certs/ca.cert.pem
chmod 444 ca/certs/ca.cert.pem

# Generate SSL certificate
mkdir jupyter jupyter/csr jupyter/certs jupyter/private
chmod 700 jupyter/private
openssl genrsa -out jupyter/private/ssl.key.pem 2048
chmod 400 jupyter/private/ssl.key.pem

# Request certificate for your server
openssl req -config openssl.cnf -key jupyter/private/ssl.key.pem -new -sha256 -out jupyter/csr/ssl.csr.pem

# Finally, issue your server SSL certificate
openssl ca -config openssl.cnf -extensions server_cert -days 2048 -notext -md sha256 -in jupyter/csr/ssl.csr.pem -out jupyter/certs/ssl.cert.pem
chmod 444 jupyter/certs/ssl.cert.pem
```

Install the CA certificate on your device, located at `ca/certs/ca.cert.pem`

As of iOS 10.3 you must manually turn on trust for SSL when you install a certificate. In order to turn on SSL trust for CA certificate, go to `Settings > General > About > Certificate Trust Settings`. Under `Enable full trust for root certificates`, turn on trust for the certificate.

Once CA certificate is trusted on the device, all certificates signed with it will be trusted too, including the one we generated for SSL, located at jupyter/certs/ssl.cert.pem. You can now use it when launching Jupyter Notebook by providing absolute paths to both key and certificate. If you generate all your certificate and keys in `~/.ssh/` folder, your paths will be:

``` bash
jupyter notebook --certfile ~/.ssh/jupyter/certs/ssl.cert.pem --keyfile ~/.ssh/jupyter/private/ssl.key.pem
```

Alternatively, you can specify paths to key and certificate in [Jupyter configuration file](http://jupyter-notebook.readthedocs.io/en/latest/public_server.html#running-a-public-notebook-server).

