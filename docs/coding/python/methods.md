---
tags:
- coding
- python
- methods
---
# Some Methods

## Raw Input

Wait for until the input is finished by pressing `Enter`.

``` python title="raw_input()"
# raw_input(string)
raw_input('Enter something:')
```

## Range

``` python title="range()"
# range(arg1, arg2, ...)
range(1,5)  # = [1, 2, 3, 4]
range(1,5,2)    # = [1, 3]
```

## Convert

``` python title="convert"
## Convert
int()
float()
complex()
long()
```

## Dir

Shows a list of names in the actual scope. Names can be functions,
classes, variables of a module

``` {.bash caption="dir()"}
$ python
>>> import sys
>>> dir(sys) # List all attribute of the sys-modul
['__displayhook__', '__doc__', '__excepthook__', '__name__',
 '__stderr__', '__stdin__', '__stdout__', '_getframe', 'api_version',
 'argv', 'builtin_module_names', 'byteorder', 'call_tracing',
 'callstats', 'copyright', 'displayhook', 'exc_clear', 'exc_info',
 'exc_type', 'excepthook', 'exec_prefix', 'executable', 'exit',
 'getcheckinterval', 'getdefaultencoding', 'getdlopenflags',
 'getfilesystemencoding', 'getrecursionlimit', 'getrefcount',
 'hexversion', 'maxint', 'maxunicode', 'meta_path','modules', 'path',
 'path_hooks', 'path_importer_cache', 'platform', 'prefix', 'ps1',
 'ps2', 'setcheckinterval', 'setdlopenflags', 'setprofile',
 'setrecursionlimit', 'settrace', 'stderr', 'stdin', 'stdout',
 'version', 'version_info', 'warnoptions']
>>> dir() # List all attributes of the actual module
['__builtins__', '__doc__', '__name__', 'sys']
>>>
>>> a = 5 # create new variable 'a'
>>> dir()
['__builtins__', '__doc__', '__name__', 'a', 'sys']
>>>
>>> del a # delete a name
>>>
>>> dir()
['__builtins__', '__doc__', '__name__', 'sys']
>>>
```

## Print

``` python title="print()"
age = 25
name = 'tschinz'
print '%s is %d Years old.' % (name, age)
print 'Why plays %s with this Python?' % name

Overwrite last print output
.. code-block:: python
   :caption: raw_input()

import time
for i in range(100):
    print("\rProgress {}%".format(i),end="")
    time.sleep(0.1)
```

## String Methods

### format

``` python title="format()"
"string {1} {1:03d} {2:04X} {2:08b}".format(42, 7)
# output string 42 042 0007 00000111
```

### Len

``` python title="len()"
len("Hello World!") # returns 12
```

### Concatenation

``` python title="concatenation"
"Hello " + "World" # = "Hello World"
"Hello " + "World" + 3*"!" # = "Hello World!!!"

s = "Hello World"
s[0]  # = 'H'
s[1]  # = 'e'
s[10] # = 'd'
s[11] # = IndexError : we cannot read past the end of the string

s[0:5]  # = "Hello"
s[6:11] # = "World"
s[6:20] # = "World" (no IndexError although 20 is past the end of the string)
s[10:6] # = "" (starting from a larger ending at a smaller index is always the empty string)
```

### `find(sub[, start[, end]])`

``` python title="find()"
"Hello world, hello".find("ell")       # 1
"Hello world, hello".find("ell", 3,10) # -1
"Hello world, hello".find("ell", 3,20) # 14
```

### `strip([chars])`

``` python title="strip()"
"  hello world  ".strip() # 'hello world'
```

### `lstrip([chars]), rstrip([chars])`

``` python title="lstrip() rstrip()"
"  \tHello there".lstrip()       # 'Hello there'
"  \tHello there".lstrip("H")    # '  \tHello there'
"  \tHello there".lstrip("\t H") # 'ello there'
"  \tHello there".rstrip()       # 'Hello there'
"  \tHello there".rstrip("e")    # '  \tHello ther'
"  \tHello there".rstrip("erh")  # '  \tHello t'
```

### `split([sep[, maxsplit]])`

``` python title="split()"
"apples, peaches, oranges, bananas".split(', ', 2)
# ['apples', 'peaches', 'oranges, bananas']
```

### `partition(sep)`

``` python title="partition()"
"Hello World".partition(" ")   # ('Hello', ' ', 'World')
"Hello World".partition(" Wo") # ('Hello', ' Wo', 'rld')
```

### `lower()`, `upper()`

``` python title="lower() upper()"
"Hello World!".lower() # 'hello world!'
"Hello World!".upper() # 'HELLO WORLD!'
```

``` python title="string"
name = 'abcdef'
if name.startswith('abc'):
    print 'Yes, starts with "abc".'
if 'a' in name:
    print 'Yes, contains "a".'
if name.find('cde') != -1:
    print 'Yes, contains  "cde".'
separator = '_*_'
mylist = ['Swiss', 'Germany', 'France', 'Italy']
print separator.join(mylist)
```
