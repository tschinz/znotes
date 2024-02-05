---
tags:
- coding
- python
- pip
---
# PIP
![](img/pip_logo.svg){.center width="30%"}

Check out also:

- [Jupyter](../../tools/jupyter/index.md)
- [Conda](../../tools/anaconda/conda.md)

## Admin

``` bash
# Show pip help
pip --help

# Show installed pip version
pip --version

# Update pip (Linux)
pip install --upgrade pip

# Update pip (Windows)
python -m pip install --upgrade pip
```

## Package

``` bash
# Search a package
pip search <packagename>

# See package version
pip show <packagename>

# See all installed packages
pip list

# Install
pip install <packagename>
pip install -I <packagename>==<package version>
pip install -I ipython==5.4.0

# Update
pip install -U <packagename>

# Uninstall
pip uninstall <packagename>
```

## requirements

### File content `requirements.txt`

``` text title="requirements.txt"
###### Requirements without Version Specifiers ######`
nose
nose-cov
beautifulsoup4

###### Requirements with Version Specifiers ######`
docopt == 0.6.1             # Version Matching. Must be version 0.6.1
keyring >= 4.1.1            # Minimum version 4.1.1
coverage != 3.5             # Version Exclusion. Anything except version 3.5
Mopidy-Dirble ~= 1.1        # Compatible release. Same as >= 1.1, == 1.*
package >= 1.0, <=2.0       # two requirements combinesd with and
```

## Create `requirements.txt`

``` bash
pip freeze > requirements.txt
```

### Install `requirements.txt`

``` bash
pip install -r requirements.txt
```
