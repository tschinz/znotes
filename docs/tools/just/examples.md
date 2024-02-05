---
tags:
- tools
- just
render_macros: false
---
#  Examples Just

Here just a unassorted examples of justfiles and how to run it.

Just examples can be found on the [SPL-Docs repo](https://gitlab.hevs.ch/SPL/spl-docs/-/blob/master/justfile) as
well as the typst-templates repo [here](https://gitlab.hevs.ch/course/templates/typst-templates/-/blob/main/justfile)
and [here](https://gitlab.hevs.ch/course/templates/typst-templates/-/blob/main/01-templates/script/justfile).

## Run Just recipes

``` bash
just               # run default recipe
just <recipe-name> # run recipe with the name <recipe-name>
just -l            # list all available recipes
```

## Default

The first recipe is the default one. Best to define your default recipe as such

``` bash
# List all commands
default:
  just --list
```

## Recipe

### Documentation

Every recipe can be documented by prefix the recipe with a comment.

``` bash
# build main
build:
  cc *.c -o main
```

### Silenced

You can silence a recipe or a command only with the **@** symbol. It will surpess the display of the executed command and only show the commands output

```
# silence recipe
@clean:
  echo "--------------------------------------------------"
  echo "-- Clean {{project_lib}}"
  echo "--"
  rm {{compileOrder_file}} || true
  rm {{componentCommission_file}} || true
  rm {{componentDesign_file}} || true
  rm -r {{commission_dir}} || true

# silence only echo commands
clean:
  @echo "--------------------------------------------------"
  @echo "-- Clean {{project_lib}}"
  @echo "--"
  rm {{compileOrder_file}} || true
  rm {{componentCommission_file}} || true
  rm {{componentDesign_file}} || true
  rm -r {{commission_dir}} || true
```

### Dependencies

``` bash
# run a couple of recipes
@commission-all: buildLists commission removeOrphans writeCompileOrder compileFileSet

# one recipe depends on another
build:
  cc *.c -o main

test-all: build
  ./test -all
```

### OS-dependend

Recipes can be available on only certain os'es. The choice is windows, linux, macos, unix (linux & macos). Comment needs to be written in both and above the environment definition.

``` bash
# Information about the environment
[unix]
@info:
  echo "Environment Informations"
  echo "------------------------"
  echo "    OS             : {{os()}}({{arch()}})"

# Information about the environment
[windows]
@info:
  echo Environment Informations
  echo ------------------------
  echo     OS             : {{os()}}({{arch()}})
```

### Arguments

A recipe can have as much arguments you want with or without a default value

``` bash
# default values of agruments
doc_name   := doc_name      := "main"
output_dir := "05-pdf"
project_name  := file_stem(justfile_directory())

# build, rename and copy a typ file to a pdf
@pdf file_name=doc_name:
  typst c {{file_name}}.typ
  mkdir -p {{output_dir}}
  mv {{file_name}}.pdf "{{output_dir}}/{{project_name}}.pdf"
  just clean

# build, rename and copy a typ file in all variants
@pdf-all file_name=doc_name:
  just pdf {{file_name}}
```

### Conditionals in recipes

In recipes the conditionals form just can't be used. To circumvent the problem you need to do this (depending if its bash or bat)

``` bash
[unix]
commission dryrun="0":
  if [[ "{{dryrun}}" == "0" ]] ;then \
    {{python}} {{commission_script}}; \
  else \
    {{python}} {{commission_script}} -n; \
  fi

[windows]
@commission dryrun="0":
  if "{{dryrun}}" == "0" ( \
    {{python}} {{commission_script}} \
  ) else ( \
    {{python}} {{commission_script}} -n \
  )
```

### Variables

Variables can be created, exported as Environment variables and created with the help of conditionals and functions

``` bash
# just a string
project           := "Just a string"

# lowercase a string
design_name       := lowercase(project)

# name of parentfolder
project_name      := file_stem(justfile_directory())

# path of justfile directory
project_path      := justfile_directory()

# directory path based created (works on win, lin & macos alike)
scripts_path      := join(project_path, "..", "Scripts")

# export variable as environment variable (available in the shell of the recipes)
export hds_home := "C:\\eda\\MentorGraphics\\HDS"
```

### Conditionals

Conditionals work only for variables **not in recipes**

``` bash
# define a tool base on the operating system
python := if os() == "windows" {
  "python"
} else {
  "python3"
}

# search for an existing path in windows and export it as an environment variable
export hds_home := if path_exists("C:\\eda\\MentorGraphics\\HDS") == 'true' {
  "C:\\eda\\MentorGraphics\\HDS"
} else if path_exists("C:\\tools\\eda\\HDS") == 'true' {
  "C:\\tools\\eda\\HDS"
} else {
  "ERROR: No valid installation of Mentor HDL-Designer found."
}
```

### Executed variables

a variable can be evaluated at a given location with backticks **\`**

``` bash
# while creating a variable
python_version := `python -V`

# within a recipe
[linux]
[macos]
@info:
  echo "Python : `{{python}} -V`"
```

### Access variable in recipes

``` bash
@run-hdld:
  {{hdl_script_file + ".bash"}} -v -n {{design_name}} -d {{project_dir}} -m hds.hdp -y "Board/libero"
```
