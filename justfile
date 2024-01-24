##################################################
# Variables
#
PROJECT_DIR  := justfile_directory()
PROJECT_NAME := file_stem(justfile_directory())
VENV_NAME    := ".venv"
ENV_TOOL     := "conda"
ENV_NAME     := "mkdocs"
ENV_FILE     := "condaenv.yml"
SOURCE_DIR   := "docs"
OUTPUT_DIR   := "site"
GIT-TAG      := `git describe --tags --always`
YEAR         := `date +%Y`
DATE         := `date +%Y-%m-%d`
BUILDER      := "mkdocs"
BUILDER_VERSION := BUILDER + " -V"

python := if os() == "windows" {
  "python"
} else {
  "python3"
}

pip := if os() == "windows" {
  "pip"
} else {
  "pip3"
}

sourceVenv := if os() == "windows" {
  PROJECT_DIR + "\\" + VENV_NAME + "\\Scripts\\activate.bat"
} else{
  "source " + PROJECT_DIR + "/" + VENV_NAME + "/bin/activate"
}

##################################################
# COMMANDS
#
# List all commands
_default:
  just --list

# For windows shell to be supported (suppose code is multi-platforms ready)
#set shell := ["bash", "-uc"]
#set windows-shell := ["cmd.exe", "/c"]

# Information about the environment
@info:
  echo "Environment Informations"
  echo "========================"
  echo "    OS          : {{os()}}({{arch()}})"
  echo "    Projectdir  : {{PROJECT_DIR}}"
  echo "    ----------------------------"
  echo "    ENV Tool    : {{ENV_TOOL}}"
  echo "    ENV name    : {{ENV_NAME}}"
  echo "    ----------------------------"
  echo "    Python cmd  : {{python}}"
  echo "    Pip cmd     : {{pip}}"
  echo "    ----------------------------"
  echo "    Source dir  : {{SOURCE_DIR}}"
  echo "    Output dir  : {{OUTPUT_DIR}}"
  echo "    ----------------------------"
  echo "    Builder     : `{{BUILDER_VERSION}}`"

# Create and source the python environment
@venv-create:
  #!/usr/bin/env bash
  set -euo pipefail

  # create venv and upgrade pip
  echo "Checking venv" && \
  test -d {{VENV_NAME}} || { {{python}} -m venv {{VENV_NAME}} &&
  {{sourceVenv}} &&
  {{pip}} install --upgrade pip &&
  {{pip}} install -r requirements.txt; }

# Create the build environment
@conda-create:
  {{ENV_TOOL}} env create -f {{ENV_FILE}}

# Export the build environment
@env-export:
  {{ENV_TOOL}} env export > {{ENV_FILE}}
  pip freeze > requirements.txt

# Source the build environment
env-source:
  {{ENV_TOOL}} activate {{ENV_NAME}}

# Build HTML static site
@build: venv-create
  #!/usr/bin/env bash
  {{sourceVenv}} && \
  {{BUILDER}} build

# Build HTML static site and serve it locally
@serve: venv-create
  #!/usr/bin/env bash
  {{sourceVenv}} && \
  {{BUILDER}} serve

# Delete build folder(s)
[linux]
[macos]
@clean:
  rm -rf {{OUTPUT_DIR}}

[windows]
@clean:
  del {{OUTPUT_DIR}}