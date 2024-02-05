---
tags:
- tools
- make
---
#  Examples

In this section you can find some example Makefile which you can take and adapt to any needs.

## Detect OS in makefile

``` bash title="makefile os"
###########################################################################
# Detect OS                                                               #
###########################################################################
ifeq ($(OS),Windows_NT)
detected_OS := Windows
else
detected_OS := $(shell uname)
endif

echo "..."

ifeq ($(detected_OS),Windows)
   echo "..."
endif

ifeq ($(detected_OS),Darwin)
   echo "..."
endif

ifeq ($(detected_OS),Linux)
   echo "..."
endif
```

``` make title="makefile conda"
ifeq ($(detected_OS),Windows)
    PDFVIEWER = 'start "" /max'
    CONDA_ENV_FILE = ./../../condaenv-win.yml
ifeq (,$(shell where conda))
    HAS_CONDA = False
else
    HAS_CONDA = True
    SEARCH_ENV = $(shell conda.bat info --envs | grep $(CONDA_ENV_NAME))
    FOUND_ENV_NAME = $(word 1, $(notdir $(SEARCH_ENV)))
    # check if conda environment is active
ifneq ($(CONDA_DEFAULT_ENV),$(FOUND_ENV_NAME))
    CONDA_ACTIVATE := source $$(conda.bat info --base)/etc/profile.d/conda.sh ; conda activate $(CONDA_ENV_NAME)
else
    CONDA_ACTIVATE := true
endif
endif
endif

ifeq ($(detected_OS),Darwin)
    PDFVIEWER = open
    CONDA_ENV_FILE = ./../../condaenv-mac-arm64.yml
ifeq (,$(shell which conda))
    HAS_CONDA = False
else
    HAS_CONDA = True
    ENV_DIR = $(shell conda info --base)
    MY_ENV_DIR = $(ENV_DIR)/envs/$(CONDA_ENV_NAME)
    CONDA_ACTIVATE = source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate $(CONDA_ENV_NAME)
endif
endif

ifeq ($(detected_OS),Linux)
    PDFVIEWER = xdg-open
    CONDA_ENV_FILE = ./../../condaenv-linux.yml
ifeq (,$(shell which conda))
    HAS_CONDA = False
else
    HAS_CONDA = True
    ENV_DIR = $(shell conda info --base)
    MY_ENV_DIR = $(ENV_DIR)/envs/$(CONDA_ENV_NAME)
    CONDA_ACTIVATE = source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate $(CONDA_ENV_NAME)
endif
endif
```

## Sphinx Makefile

``` make title="makefile sphinx"
# Makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    = -Dversion=$(shell git describe --tags)
SPHINXBUILD   = sphinx-build
SOURCEDIR     = source
BUILDDIR      = _build
OUTPUTDIR     = pdf
FILENAME      = znotes
# IMAGEDIRS can be a list of directories that contain SVG files and are relative to the SOURCEDIR
IMAGEOBJS     = $(sort $(dir $(wildcard src/img/* src/*/img/* src/*/*/img/* src/*/*/*/img/* src/*/*/*/*/img/*)))
IMAGEDIRS     = $(patsubst src/%/, %, $(IMAGEOBJS)) # remove src/ and last /
IMAGEDIRS    += img/icons
# SVG to PDF conversion
SVG2PDF       = inkscape
SVG2PDF_FLAGS = -C

# Put it first so that "make" without argument is like "make help".
help:
    @$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Pattern rule for converting SVG to PDF
%.pdf : %.svg
    $(SVG2PDF) $(SVG2PDF_FLAGS) -f $< -A $@

# Build a list of SVG files to convert to PDFs
PDFs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.pdf,$(wildcard $(SOURCEDIR)/$(dir)/*.svg)))

# Make a rule to build the PDFs
images-pdf: $(PDFs)


# Make a rule to build the images
images: images-png

clean-pdf:
    -rm $(PDFs)

clean-images: clean-pdf

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
#%: Makefile
#   @$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: clean
clean: clean-images
    rm -rf $(BUILDDIR)/*

.PHONY: clean-quick
clean-quick:
    rm -rf $(BUILDDIR)/*

.PHONY: html
html: # images-png
    if [ -a $(SOURCEDIR)/index.rst ]; then rm $(SOURCEDIR)/index.rst; fi;
    cp $(SOURCEDIR)/index_html.rst $(SOURCEDIR)/index.rst
    $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
    @echo
    @echo "Build finished. The HTML pages are in $(BUILDDIR)/html."
    #mkdir -p $(OUTPUTDIR)/html/
    #cp -R $(BUILDDIR)/html/* $(OUTPUTDIR)
    @echo "html files copied; the html files are in $(OUTPUTDIR)/html/."


    @echo "Build finished; now you can run "qcollectiongenerator" with the" \
          ".qhcp project file in $(BUILDDIR)/qthelp, like this:"
    @echo "# qcollectiongenerator $(BUILDDIR)/qthelp/Example.qhcp"
    @echo "To view the help file:"
    @echo "# assistant -collectionFile $(BUILDDIR)/qthelp/Example.qhc"

.PHONY: latexpdf
latexpdf: images-pdf
    if [ -a $(SOURCEDIR)/index.rst ]; then rm $(SOURCEDIR)/index.rst; fi;
    cp $(SOURCEDIR)/index_latex.rst $(SOURCEDIR)/index.rst
    $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
    @echo "Running LaTeX files through pdflatex..."
    $(MAKE) -C $(BUILDDIR)/latex all-pdf
    @echo "xelatex finished; the PDF files are in $(BUILDDIR)/latex."
    mkdir -p $(OUTPUTDIR)/
    cp $(BUILDDIR)/latex/$(FILENAME).pdf $(OUTPUTDIR)/$(FILENAME).pdf
    @echo "pdf copied; the PDF files are in $(OUTPUTDIR)/$(FILENAME).pdf."
```

## Simple C/C++ Project

Here a simple editable Makefile where only the standart stuff is used.

``` make title="makefile simple cpp"
# check for host development system
TOOLS = ../../bin

# define access paths for tools
CCP =  cpp
AS = $(TOOLS)/asm_hrms

# define access path for header files and libraries
INCDIRS = ../../include

# list target files
all: a664_rx.d a664_rx a664_rx.bin

# produce Test Processor target files
a664_rx.s: a664_rx.S Makefile
    cpp -I $(INCDIRS) -o a664_rx.s a664_rx.S
a664_rx.d: a664_rx.s
    $(AS) -d -o a664_rx.d a664_rx.s > a664_rx.d.dis
a664_rx: a664_rx.s
    $(AS) -o a664_rx a664_rx.s > a664_rx.dis
a664_rx.bin: a664_rx.s
    $(AS) -o a664_rx.bin a664_rx.s > a664_rx.dis

# clean up
clean:
    rm -f *.bin *~ *.dis *.bin *.s *.d a664_rx
```

# C/C++ Project

This is a C/C++ Project where as much make is used as possible.

First you can see the C/C++ project files to the given Makefile

``` {.c caption="hellomake.c"}
#include

int main() {
  // call a function in another file
  myPrintHelloMake();

  return(0);
}
</code>
<code c hellofunc.c>
#include
#include

void myPrintHelloMake(void) {

  printf("Hello makefiles!\n");

  return;
}
```

``` title="hellomake.h"
// example include file
void myPrintHelloMake(void);
</code>

Here the appropriate complete Makefile to the project above.
<code make Makefile>
CC=gcc
CFLAGS=-I.
DEPS = hellomake.h
OBJ = hellomake.o hellofunc.o

%.o: %.c $(DEPS)
    $(CC) -c -o $@ $< $(CFLAGS)

hellomake: $(OBJ)
    gcc -o $@ $^ $(CFLAGS)
```

or here the more complex project file

``` make title="makefile cpp"
IDIR =../include
CC=gcc
CFLAGS=-I$(IDIR)

ODIR=obj
LDIR =../lib

LIBS=-lm

_DEPS = hellomake.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = hellomake.o hellofunc.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS)
    $(CC) -c -o $@ $< $(CFLAGS)

hellomake: $(OBJ)
    gcc -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
    rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~
```