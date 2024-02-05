---
tags:
- coding
- python
- std
---
# Standart libraries

## Module Content

If you want to know the functions available of a module, import it and dir(<modulename>). It will give you a list of all accessible functions.

``` python
import math
print dir(math)
# ['acos', 'acosh', 'asin', 'asinh', 'atan', 'atan2', 'atanh', 'ceil', 'copysign', 'cos', 'cosh', 'degrees', 'e', 'exp', 'fabs', 'factorial', 'floor', 'fmod', 'frexp', 'fsum', 'hypot', 'isinf', 'isnan', 'ldexp', 'log', 'log10', 'log1p', 'modf', 'pi', 'pow', 'radians', 'sin', 'sinh', 'sqrt', 'tan', 'tanh', 'trunc']
```

## sys

### sys Variables

``` python
sys.<variable_name>
```

| Variable name                | Description |
| ---------------------------- | ------------------------------------------ |
| `argv`                       | Command line args |
| `builtin_module_names`       | Linked C modules |
| `byteorder`                  | Native byte order |
| `exec prefix`                | Root directory |
| `executable`                 | Name of executable |
| `modules`                    | Loaded modules |
| `path`                       | Search path |
| `platform`                   | Current platform (Windows, Linux, Darwin (Mac)) |
| `stdin`, `stdout`, `stderr`  | File Objects for I/O |

### Arguments

``` python title="sys args"
# sys.argv for $python foo.py bar -c qux --h

sys.argv[0] = foo.py
sys.argv[1] = bar
sys.argv[2] = -c
sys.argv[3] = qux
sys.argv[4] = --h
```

## os

### os Variables

``` python
os.<variablename>
```

| Variable name            | Description |
| ------------------------ | ---------------------------------------------- |
| `altsep`                 | Alternative separator |
| `curdir`                 | Current dir string |
| `defpath`                | Default search path |
| `devnull`                | Path of null device |
| `extsep`                 | Extension separator |
| `linesep`                | Line separator |
| `name`                   | Name of os (posix, nt, mac, os2, ce, java, riscos) |
| `pardir`                 | Parent dir string |
| `pathsep`                | Patch separator |
| `sep`                    | Path seperator |

These functions are platform indepentend and should work on Linux, Windows und Mac.

``` python title="os"
os.getcwd()              # Return actual working directory
os.listdir()             # Return NAmes of all files and folders from the given loction
os.getenv()              # Read environment variables
os.putenv()              # Write environment variables
os.remove(file)          # delete file
os.sysrtem()             # put the command into the Terminal
os.path.split(filepath)  # Returns location and filename
os.path.isfile(filepath) # Check if location is a file
os.path.isdir(path)      # Check if location is a folder
os.path.exist(path|file) # Check if location exists
os.path.splitext(file)   # Splits filename and extention file, ext = os.path.splitext(f)
os.path.dirname(path)    #
```

For searching wihtin a folder root use the `os.walk()`

``` python
for dirpath, dirnames, filenames in os.walk(folder_location):
    # dirpath = root dir of file
    # dirnames = [] list of dirs in dirpath
    # filenames = [] list of files in dirpath
    pass
```

``` python
path_win = "C://user/file.txt"
path_lin = "/home/user/file.txt"
os.path.basename(path_win)   # 'file.txt'
os.path.dirname(path_win)    # 'C://user'
os.path.basename(path_lin)   # 'file.txt'
os.path.dirname(path_lin)    # '/home/user'
os.path.split(path_win)      # ('C://user', 'file.txt')
os.path.split(path_lin)      # ('/home/user', 'file.txt')
os.path.splitext(path_lin)   # ('/home/user/file', '.txt')
```

## re & RegExp

``` python
import re
def myRegEx_Checker(expression,data):
    reg=re.compile(expression);
    if reg.match(data):
        return True
    return False
```

``` python
# replace multiple space with one
re.sub("\s+"," ",  "   Python  Regexpr   ")    # " Python Regexpr "

# remove front and leading spaces
re.sub("^\s+|\s+$","",  "   Regexpr     ")     # "Regexpr"

# remove comment (# or -- or //) and all after it
re.sub("(--|#|//).*","",  "Regexpr --comment") # "Regexpr "

# search only
re.findall("(\d{1,2}\/\d{1,2}\/\d{4})", "asdfsadf31/02/2012dsfsdf") # Date (e.g. 31/3/2006))
# returns a list of found strings
```

## time

``` python title="time"
import time
strftime("%Y-%m-%d %H:%M:%S", gmtime())           # 2009-01-05 22:14:39
strftime("%Y-%m-%d %H:%M:%S", localtime())        # 2009-01-05 22:14:39
strftime("%a, %d %b %Y %H:%M:%S +0000", gmtime()) # Tue, 06 Jan 2009 04:54:56 +0000
```

``` python title="sleep"
import time
time.sleep(6)    # Sleep in seconds
</code>
```

## random

``` python title="random"
import random

# Random number between 0.0 and 1.0
random.random()             # e.g. 0.28396990573542813

# Uniform random number between a and b  (a <= x < b)
uniform(a, b)
random.uniform(1, 10)       # e.g. 6.3970639899381769

# Gauss random number of mean value "mu" and standard deviation "sigma"
gauss(mu, sigma)
random.gauss(5, 2)          # e.g. 6.3865365546439046

# Other functions
betavariate(alpha, beta)    # Beta deviation
expovariate(lambd)          # Exponential deviation
gammavariate(alpha, beta)   # Gamma-deviation
lognormvariate(mu, sigma)   # logarithmische deviation
vonmisesvariate(mu, kappa)  # Von-Mises-deviation
paretovariate(alpha)        # Pareto-deviation
weibullvariate(alpha, beta) # Weibull-deviation

# Random integer between a and b (a <= x <= b) like throw dice
randint(a, b)
random.randint(1, 6)        # e.g. 4

# Random picked number of a list
randrange( [start,] stop[, step])

range(0, 21, 2)             # e.g. [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
random.randrange(0, 21, 2)  # e.g. 10
```
