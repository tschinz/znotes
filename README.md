<h1 align="center">
  <br>
  <img src="./docs/img/logo.svg" alt="Zentauri Logo" width="250">
  <br>
  Zentauri Knowledge Database
  <br>
</h1>

This is the static mkdocs documentation for myself

![Github Pages Deploy](https://github.com/tschinz/znotes/actions/workflows/action-mkdocs.yml/badge.svg)

# How to use the MKDocs Materials Documentation Platform
## MKDocs Materials Requirements

* just
    ``` bash
    cargo install just
    conda install -c conda-forge just
    brew install just
    npm install -g rust-just
    pipx install rust-just
    ```
* Python 3
   * [Python](https://www.python.org/downloads/)
   * [Anaconda](https://www.anaconda.com/distribution/)
* Python Modules (can be installed with pipenv)
  ``` bash
  just venv-create
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

## Continuous Integration (CI)
The CI is done with Github Actions with the file [action-mkdocs.yml](./.github/workflows/action-mkdocs.yml) will run on each master commit and create a `site/` folder which will be pushed onto the branch `gh-pages` and consequently be used by github to displayed static html pages.
