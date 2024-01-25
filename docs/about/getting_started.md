---
tags:
    - about
    - how to
    - mkdocs
---
# How to use MKDocs Material Documentation
The method below allows you to write and preview the doc easily thanks to **VSCode** and the [Dev Container](https://containers.dev) technology.

[condaenv.yml](./../condaenv.yml){:download="condaenv.yml"}
[condaenv.yml](../condaenv.yml){:download="condaenv.yml"}
[condaenv.yml](../../static/condaenv.yml){:download="condaenv.yml"}

<a href="../condaenv.yml" download>condaenv.yml</a>
<a href="/condaenv.yml" download>condaenv.yml</a>
<a href="/docs/condaenv.yml" download>condaenv.yml</a>

!!! info
    We do not provide support for other installation methods. A [condaenv.yml](./../condaenv.yml){:download} file is available at the root of the documentation one can consult the content of the `.devcontainer` folder to install the required programs and tools to build the documentation on its own.

## Requirements
-   [Visual Studio Code](https://code.visualstudio.com/download)
-   [Docker engine](https://www.docker.com/products/docker-desktop/)
-   [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Quick start
Clone the repository and open the folder in VSCode.

```bash
git clone https://github.com/tschinz/znotes.git && cd znotes && code .
```

The `.devcontainer` folder within the root of the documentation will be detected by VSCode and this latter will ask you to open the folder in a container. Confirm the action. If the dialog doesn't show up, open the command palette (`Ctrl+Shift+P` or `F1`) and search for `Dev Containers: Open Folder in Container...`.

Once the container is built, you are ready to read and write some doc. A live preview is available at <http://localhost:1950>. This live preview update whenever a change in the source folder is detected.

# Install new package
If you write a documentation and find an useful extension or package to be added, use the standard `pip install` command. Note that this will install the package only on your local devcontainer. As long as you don't rebuild the container, you don't have to reinstall the package again. To make the installation of the package permanent, don't forget to add this latter in the `requirements.txt` file.

# Available commands

This documentation comes with a `justfile` (Makefile replacement). Use
`just -l` to see the availabe recipes:

``` bash
$ just --list
Available recipes:
    build        # Build HTML static site
    clean        # Delete build folder(s)
    conda-create # Create the build environment
    env-export   # Export the build environment
    info         # Information about the environment
    serve        # Build HTML static site and serve it locally
    venv-create  # Create and source the python environment
```

# Commit your changes

Before performing a commit the following steps are required:

-   Verify the build of the documentation locally:
    ```bash
    just clean && just build
    ```
-   Solve important build `Warnings` and `Errors` (if any) in the
    output.
-   Commit and push your changes

## Continuous Integration (CI)

The CI is done with Github Actions with the file `action-mkdocs.yml </../.github/workflows/action-sphinx.yml>`{.interpreted-text
role="download"} will run on each `master` commit and create a `_build/`
folder which will be pushed onto the branch gh-pages and consequently be
used by github to displayed static html pages.

`sphinx`{.interpreted-text role="tag"}
`getting started`{.interpreted-text role="tag"}
