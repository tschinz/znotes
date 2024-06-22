<h1 align="center">
  <br>
  <img src="./docs/img/logo.svg" alt="Z-Notes Logo" width="250">
  <br>
  Z-Notes Knowledge Database
  <br>
</h1>

This is the static sphinx documentation for myself

![Github Pages Deploy](https://github.com/tschinz/znotes/actions/workflows/action-mkdocs.yml/badge.svg)

# How to use the MKCods Materials Documentation Platform
## MKDocs Materials Requirements

* just
    ``` bash
    sudo apt-get install build-essential
    ```
* Python 3
   * [Python](https://www.python.org/downloads/)
   * [Anaconda](https://www.anaconda.com/distribution/)
* Python Modules (can be installed with pipenv)
  ``` bash
  just venv-create
  ```
* Inkscape (for `.svg` to `.pdf` and to `.png` conversion)
   * Windows - [Inkscape](https://inkscape.org/release/)
   * Linux
     ``` bash
     sudo apt-get install inkscape
     ```

## Just file recipes

```bash
just --list
Available recipes:
    build        # Build HTML static site
    clean        # Delete build folder(s)
    conda-create # Create the build environment
    deploy       # Deploy on gh-pages
    env-export   # Export the build environment
    info         # Information about the environment
    serve        # Build HTML static site and serve it locally
    venv-create  # Create and source the python environment
```

## How to Build MKDocs

```bash
just build
```

all the outputs will be in `site` folder.

## How to Build MKDocs incrementally

```bash
just serve
```

all the outputs will be in `site` folder. Open the webpage[http://127.0.0.1:8000/tschinz/znotes/](http://127.0.0.1:8000/tschinz/znotes/)


## With devcontainers

* Start VS Code in project folder.
  ```bash
  code .
  ```
* Start Docker and open folder in devcontainers
  ![open in devcontainers](./docs/img/start_in_devcontainers.png)

## Deploy on github

```bash
just gh-deploy
```

## Continuous Integration (CI)
The CI is done with Github Actions with the file [action-sphinx.yml](./.github/workflows/action-mkdocs.yml) will run on each master commit and create a `site/` folder which will be pushed onto the branch `gh-pages` and consequently be used by github to displayed static html pages.