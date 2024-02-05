---
tags:
- tools
- make
---
# Syntax

## Make Commands
The execution of make isn't hard. Below a list of possible make commands.

``` bash title="make_commands"
make                     # search "Makefile" file and executes it
make makefilename        # search "makefilename" file and executes it
make -C /.../other_path/ # search "make" file in given path
make -d                  # gives debug informations
make -file               # read file as makefile
make -t                  # make updates the date of the targets
```

## Generation Makefile

### Targets, Rules, Dependencies
A makefile generates a **Target**. This is done with help of **Rules**. Each target is dependend of other files, these are the **Dependencies**.

In the example the target is depending on file.c and file.h. It will be created with the file.c

``` bash title="make"
target: file.c file.h
    gcc file.c -o target
```

The target will be generated if ``file.cv or ``file.h`` are newer than the existing target.

### Pattern

With help of pattern can define dependencies on a group of files in one line.

for example all ``.o`` files depend on the appropriate ``.c`` files

``` make
%.o: %.c
    gcc -Wall -g -c $<
```

Most used predefined variables

``` make title="predefined_variables"
$<     # Name of the first dependency
$@     # Name of the target
$+     # List of all dependencies
$^     # List of all dependencies, doubles will be eliminated
```

variabels can be accessed by ``$``. In order to write a real ``$``, ``$$`` need to be typed.

### Variables

It is possible to work with variables to save names. Usually these vrariables are kept UPPERCASE. Here some of the most used variables

``` make title="variables"
CC       # Compiler e.g. fcc
CFLAGS   # Compiler options r.g. -Wall
LDFLAGS  # Linker options
OBJ      # Objectfiles *.o
SRC      # Sourcefiles *.c
HDR      # Headerfiles *.h
```

An access of a variable can be done by ``$()``. And it can be changes and used as ofter as necessary.

``` make
OBJ = file1.o file2.o file3.o # Variable declaration
    Rm -rf $(OBJ)             # Use of the variable OBJ
```

### Phony Targets

Phony targets have no dependencies, that the difference to the normal targets. But unlike normal targets with no depencies, they need to be **executed all the time**.

``` make
.PHONY clean
clean:
    rm -rf file1.o file2.o
```

### Includes

A Makefile can with the help of the inlcude command use the variable and makros of other Makefiles

``` make
INC_FILE = makefile2

include dateiname
include ${INC_FILE}
```

### Recursiv

If you work on a big project. Sourcefiles can be widely spread among different folders. Instead to put all dependencies in one Makefile, they can be splitted so different makefile in the different folder.

In the **Toplevel Makefile** the general rules are set, and the Makefiles of the subfolders are called.

``` make
# Pos of the different Sub Makefiles
DIRS = Module1 Module2 Module3

Make:
    for i in $(DIRS); do make -c $$i; done
    # do "make" for all Makefiles in the Subfolders
```

The make ``-c`` flag tells that it has first to change to the new directory

A file called **Toplevel Makefiles.rules** defines all variables needed in the subfolders.

``` make title="Makefile.rules"
CFLAGS = -Wall -g
%.o: %.c                 # all .o depend on .c
    gcc $(CFLAGS) -c $<  # generation .o files
```

**Makefile in the subfolders**
Depending in the defined Object files and the Rules in Makefile.rules, the executed code will be defined.

``` make
Include ../Makefile.rules
OBJ = file1.o file2.o
all: $(OBJ)
```

### Make dep

Make dep is practical tools, which allows to search automatically dependencies in the sourcefiles.

``` make
DEPENDFILE = depend                 # Var for filename

dep: $(SRC)
    $(CC) -MM $(SRC) > $(DEPENDFILE)# put output > file depend

-include $(DEPENDFILE)           # search for include commands
```

with the flag ``-MM`` make will search in the ``SRC`` files for include directives. the command ``-include $(DEPENDFILE)`` adds the found dependencies into the Makefile

Specialsigns


``` make
   #                         # is a comment
   first part of command \   # Command split
   second part of command \  # into multiple
   third part of command     # lines
```