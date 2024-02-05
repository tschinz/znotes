---
tags:
- tools
- anaconda
---
#  Conda

At installation (Anaconda), conda creates a generic environment called `base` which is activated by default. Therefore, when installing a package with `conda install`, the package will be installted in that environment. You can be more explicit and activate the environment by typing `conda activate` or `conda activate base` in a terminal.

To have a full in depth introduction to environment management with conda read the official docs: [Manage Environments](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html).

## Conda Environments

### Create

Create an environment from file

``` bash
conda env create -f condaenv.yml
```

Create an empty environment

``` bash
conda create -n <envname>
conda create -n <envname> python=3.6.5
```

### Rename

You can't! You need to clone the environment and give a new name:

``` bash
conda create --name <new_envname> --clone <old_envname>
conda remove --name <old_envname> --all
```

### Delete

``` bash
conda env remove --name <envname>
```

### Export

``` bash
conda env export > condaenv.yml
```

The file contains the parameter `prefix` at the end of the file which points to your local installation. This information can be ignored or removed from the file without any impact when creating a new environment on a different machine.

## Commands

### Update

Update all Conda packages

``` bash
conda update --all
```

Update Anaconda only

``` bash
conda update conda
conda update anaconda
```

### Info

Get information about conda installation

``` bash
conda info
```

### Search

Search a package within the configured channels

``` bash
conda search <package>
```

### Install

Install a package

``` bash
conda install <package>
conda install -c <channelname> <package>$
conda install -c conda-forge <package>
```

### Remove

Remove a package

``` bash
conda remove nodejs npm
```

### List

List conda environments

``` bash
conda env list
```

List current environment packages

``` bash
conda list
conda -n <envname> list
```

### Configuration

Create a conda configuration file .condarc

``` bash
conda config
```

Get all conda configuration

``` bash
conda config --get
```

Add channel

``` bash
conda config --add channels <channelname>
```

## Channels

To see the configured channels use the command `conda info`.

The defaults channel points to several channels at the [repo.anaconda.com](https://repo.anaconda.com/) repository.

| Channel     | Description |
|-------------|-------------|
| pkgs/main   | Includes packages built by Anaconda, Inc. with the new compiler stack |
| pkgs/msys2  | Windows only. Included in conda's defaults channel. Necessary for Anaconda, Inc.'s R conda packages and some others in pkgs/main and pkgs/free |
| pkgs/r      | Microsoft R Open conda packages and Anaconda, Inc.'s R conda packages. |

  Defaults channels (<https://repo.anaconda.com/pkgs/>)

| Channel     | Description |
|-------------|-------------|
| conda-forge | A community repository that provides conda packages for a wide range of software. ([conda forge info](https://conda-forge.org/docs/user/introduction.html)) |
| anaconda    | A mirror of the packages available in main, free, and pro hosted on repo.anaconda.com |

Other channels

## Custom config

Official docs about conda configuration: [Configuration User-Guide](https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/index.html)

If you have a very fast SSD, you might increase the number of threads to shorten the time it takes for conda to create environments and install/remove packages ([conda config info](https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html#configuring-number-of-threads)).

```
Run conda with 6 thread (use number of processors available)
conda config --set default_threads 6

# Add ``conda-forge`` channel but with lowest priority:
conda config --append channels conda-forge
```

## Conda env in Jupyter lab

!!! warning
    You Jupterlab can become cluttered. It is not recommended

If you want all your conda environments to be listed in Jupyter notebook and lab, make sure you've installed the packages `ipykernel` and `nb_conda_kernels` in the environment from which you run Jupyter.

```
conda install -n myenv ipykernel nb_conda_kernels
```

It is recommanded to add the kernel manually and give an explicit name. To do so, while in the environment, run the following command:

```
python -m ipykernel install --user --name=<envname>
```