---
tags:
- coding
- python
- syntax
---
# Syntax

## General

### Sourcefile

``` python title="sourcefile"
#!/usr/bin/python
# -*- coding: utf-8 -*-
# -*- coding: latin1 -*-
# -*- coding: iso-8859-1 -*-
# durch coding auch umlaut möglich
print('Hello Wörld')
```

### Help informations

``` python
help(command or object)
q => Exit help
```

## Import

There are two ways to import modules.

### import <module>

You import the module. you have to call each time modulname.function to access each function

``` python
import <modulname>
<modulname>.<modulfunction>
```

### from <module> import <function>

In the second way you import one one or with * all functions of a module. But if you import the same function of two different modules, or if you import * from two modules which has common function names the interpreter won't know which one you are calling.

``` python
from <modulname> import <function>
<function>
```

#### Example

``` python
# First way
import math
math.sqrt(25)

# Second way
from math import sqrt
sqrt(25)

# Second way but import everything (need for math. anymore)
from math import *
sqrt(25)
log(10)
```

## Strings and Numbers

``` python
'' => Spaces and symbols will be taken
"" => Same as Strings with ''
''' ''' or """ """
Multiline Strings, inside '' and "" can be used
'This is a String.' / "This too!"
''' This is a Multiline String. Frist Line
And this is the "Second Line"
'''
```

### Escape Characters

``` python
'                  # = '
"                  # = "
\\                  # = \
\n                  # = New Line
\t                  # = Tabulator
\                   # = Line feed
```

### Types

| Type       | Example |
| ---------- | ---------- |
| int        | 5 |
| long       | 1.23 |
| float      | 9.25e-3 |
| complex    | 5.3+3j |

## Convertions

``` python
int()               # to int
float()             # to float
complex()           # to complex
long()              # to long
unichr()            # int to 1 char
ord()               # 1 element string to int
str()               # int to string
```

### String Bin Hex convertions

``` python
hex_bin = binascii.unhexlify(hex_string)
hex_string = binascii.hexlify(hex_bin)

def hex2bin(self, str):
    bin = ['0000','0001','0010','0011',
           '0100','0101','0110','0111',
           '1000','1001','1010','1011',
           '1100','1101','1110','1111']
    aa = ''
    for i in range(len(str)):
        aa += bin[int(str[i],base=16)]
    return aa

# END hex2bin
bin_string = hex2bin(hex_string)

hex_string = hex(int_number)
int_number = int(hex_string,16)

# 2 digit hex string
hex_string = "0x%0.2X" % 255 # = 0xFF
hex_string = "%0.2X" % 255   # = FF

# Format strings the easy way
string = "{0} {1}".format(firstReplacer , secondReplacer))
print("{:03} {:3}".format(nbr1 , nbr2))
# {:03} = right aligned 3 numbers filled with 0 e.g. 005 or 015
# {:3}  = right aligned 3 numbers               e.g.   5     15

# More examples
print("{0: >6,.4}".format(nbr0, nbr1)
# print nbr0,  align right,  fill with " ", 6 places width, 4 digits precision
```

## Operator

```
+                   # Plus         3 + 5 = 8 'a' + 'b' = 'ab'
-                   # Minus        -5.2 order 5 - 2
*                   # Multiplcation 2 * 3 = 6
**                  # Power        3 ** 4 = 3 * 3 * 3 * 3 = 81
/                   # Division     4 / 3 = 1 oder 4.0/3 = 1.3333...
//                  # Integer  Division 4 // 3.0 = 1.0
%                   # Modulo       8 % 3 = 2
<<                  # Bitwise left 2 << 2 = 8   (in binary)
>>                  # Bitwise right 11 >> 1 = 5 (in binary)
&                   # Bitwise AND  5 & 3 = 1    (in binary)
¦                   # Bitwise OR   5 | 3 = 7    (in binary)
^                   # Bitwise XOR  5 ^ 3 = 6    (in binary)
~                   # Bitwise NOT  ~5 = -6
<                   # Smaller as
>                   # Bigger as
<=                  # Smaller Equal
>=                  # Bigger Equal
==                  # Equal
!=                  # Not Equal
not                 # log NOT
and                 # log AND
or                  # log OR
```

### Priority

A Line will be evaluated from left to right

``` python
## High priority
lambda              # lambda function
or                  # log OR
and                 # log AND
not x               # log NOT
in, not in          # Part of test (in Sequences)
is, is not          # Identity test
<,<=,>,>=,!=,==     # Comparison
|                   # Bitwise OR
^                   # Bitwise XOR
&                   # Bitwise AND
<<,>>               # Bitwise Shift
+,-                 # Add, Sub
*,/,%               # Mul, Div, Mod
+x,-x               # pos-, neg-sign
~x                  # Bitwise NOT
**                  # Pow
x.attribut          # Attribut reference
x[index]            # Index
x[index:index]      # range of a sequence
f(param ...)        # function call
(ausdruck, ...)     # brackets
[ausdruck, ...]     # List
{key:value, ...}    # Dictionaries
'ausdruck, ...'     # Umwandlung in Stringdarstellung
## Low priority
```

## Statement

### if elif else

``` python
number = 23
guess = int(raw_input('Enter a number: '))
if guess == zahl:
    print('YES')
elif guess < number:
    print('Higher')
else:
    print('Lower')
```

### while

``` python
number = 23
nostop = True
while nostop:
    guess = int(raw_input('Enter a number: '))
    if number == guess:
        print('Yes')
    nostop = False # End of while
    elif guess < number:
        print('Higher')
    else:
        print('Lower')
else:
    print('End of while loop')
```

### for

``` python
for i in range(1, 5):
    print(i)
else:
    print('End of for loop')
```

## break

``` python
while True:
    s = raw_input('Enter something: ')
    if s == 'end':
        break
    print('The length of the string is', len(s))
```

### continue

continue use for `while` and `for`

``` python
while True:
    s = raw_input('Enter something: ')
    if s == 'end':
        break
    if len(s) < 3:
        continue
    print('Sufficient long')
    # Treat input here
```

### pass

``` python
# pass is used to create an empty block
def function():
    pass
```

## Functions

### General Functions

``` python
def hello_world():
    print 'hello cruel world!'
# End of function
hello_world() # function call

def printMax(a, b):
    if a > b:
        print(a, 'is max value')
    else:
        print(b, 'is max value')
printMax(3, 4) # function call with number
x = 5
y = 7
printMax(x, y) # function call with arguments
```

### Global variable

``` python
def func():
    global x
    print('x ist', x)
    x = 2
    print('global x is now', x)
x = 50
func()
print('The value of x is', x) # x = 2 because of global var
```

### Predefined Arguments

If a function parameter is not given, the default value will be used. All parameter with default values need to be at the end of the parameter list.

``` python
def sag(message, loops = 1):
    print(message * loops)
sag('Hello')
sag('World', 5)
```

### Keywords with param

``` python
def func(a, b=5, c=10):
    print('a is', a, 'and b is', b, 'and c is', c)
func(3, 7)
func(25, c=24)
func(c=50, a=100)
```

### Return

``` python
def maximum(x, y):
    if x > y:
        return x
    else:
        return y
print maximum(2, 3)
```

## Modules

### Definition of a Module

Everything in Python is a module (almost)

``` python
def hello():
    print('Hello, this is a module')
version = '0.1'
```

### Usage of a Module

The Module need to be in the same folder

``` python
import myModule
myModule.hello()
print('Version', mmyModule.version)
```

### from .. import

``` python
from myModule import hello, version
# OR:
from myModule import *
hello()
print('Version', version)
```

## Data structures

### List

``` python
# This is a list
list = ['Book', 'Pencil', 'Apple', 'Glass']
print('I have ', len(list), ' to buy.')
print('These things are:', # Don't forget the comma at the end)
for thing in list:
    print(thing,)

print('\nI also have to buy Bananas')
list.append('Banans')
print('My list is now', list)

print('Sort My list')
list.sort()
print('The sorted list is ', list)

print('First I'll buy', list[0])
oldthing =list[0]
del list[0]
print('I did buy ', oldthing)
print('My list is now', list)
```

### Tuple

``` python
zoo = ('Wolf', 'Elefant', 'Pinguin')
print('The number of animals in the Zoo is: ', len(zoo))
new_zoo = ('Ape', 'Delfin', zoo)
print('The number of animals in the new Zoo is: ', len(new_zoo))
print('All animals in the new Zoo are: ', new_zoo)
print('The animals from the old Zoo are', new_zoo[2])
print('The last animal is a: ', new_zoo[2][2])
```

### Dictionaries

``` python
ab = { 'Swaroop'   : 'swaroopch@byteofpython.info',
       'Larry'     : 'larry@wall.org',
       'Matsumoto' : 'matz@ruby-lang.org',
       'Spammer'   : 'spammer@hotmail.com'
     }
print("Swaroops Adresse ist %s" % ab['Swaroop'])
# Ein Schluessel/Wert-Paar hinzufuegen
ab['Guido'] = 'guido@python.org'
# Ein Schluessel/Wert-Paar loeschen
del ab['Spammer']
print('\nEs gibt %d Kontakte im Adressbuch\n' % len(ab))
for name, adresse in ab.items():
    print('%s hat die Adresse %s' % (name, adresse))
if 'Guido' in ab: # oder: ab.has_key('Guido')
    print("\nGuidos Adresse ist %s" % ab['Guido'])
```

### Sequence

``` python
list = ['Book', 'Pencil', 'Apple', 'Glass']
# Index
print('Pos 0 is', list[0])           # Book
print('Pos 1 is', list[1])           # Pencil
print('Pos 2 is', list[2])           # Apple
print('Pos 3 is', list[3])           # Glass
print('Pos -1 is', list[-1])         # Glass
print('Pos -2 is', list[-2])         # Apple
# List range
print('Pos 1 to 3 is', list[1:3])    # ['Pencil', 'Apple']
print('Pos 2 to End is', list[2:])   # ['Apple', 'Glass']
print('Pos 1 to -1 is', list[1:-1])  # ['Pencil', 'Apple']
print('Pos begin to is', list[:])    # ['Book', 'Pencil', 'Apple', 'Glass']
# List range on a string
name = '1234567'
print('Chars 1 bis 3 ist', name[1:3])    # 23
print('Chars 2 bis Ende ist', name[2:])  # 34567
print('Chars 1 bis -1 ist', name[1:-1])  # 3456
print('Chars Begin to End', name[:])     # 1234567
```

### References and Objects

``` python
list = ['Book', 'Pencil', 'Apple', 'Glass']
mylist = list
```

"mylist" is another name pointing to the same object.

Delete one item

``` python
del list[0]
print('list is', list)
print('mylist is', mylist)
```

Both list return it's items without the deleted item "Book". This shows that both point to the same object

``` python
print('Copy with range')
mylist = list[:] # this copies the whole list
del mylist[0]
print('list is', list)
print('mylist is', mylist)
```

Both lists are different now, will the copy created a new list.

## Oriented Objects Programming

`self` == `this` == addr des Objektes

### `__init__`-Method

``` python
class Person:
    def __init__(self, name):
        self.name = name
    def sagHallo(self):
        print('Hallo, mein Name ist', self.name)
p = Person('Swaroop')
p.sagHallo()
# Dieses kurze Beispiel kann auch als
# Person('Swaroop').sagHallo() geschrieben werden.
```

### Klassen und Objekt variablen

``` python
class Person:
    '''Stellt eine Person dar.'''
    bevoelkerung = 0
    def __init__(self, name):
        '''Initialisiert die Daten der Person.'''
        self.name = name
        print('(Initialisiere %s)' % self.name)
        # Wenn diese Person erzeugt wird,
        Person.bevoelkerung += 1
    def __del__(self):
        '''Ich sterbe.'''
        print('%s verabschiedet sich.' % self.name)
        Person.bevoelkerung -= 1
        if Person.bevoelkerung == 0:
            print('Ich bin der letzte.')
        else:
            print('Es gibt noch %d Leute.' % Person.bevoelkerung)
    def sagHallo(self):
        '''Begruessung durch die Person.
        Das ist wirklich alles, was hier geschieht.'''
        print('Hallo, mein Name ist %s.' % self.name)
    def wieViele(self):
        '''Gibt die aktuelle Bevoelkerungszahl aus.'''
        if Person.bevoelkerung == 1:
            print('Ich bin ganz allein hier.')
        else:
            print('Es gibt hier %d Leute.' % Person.bevoelkerung)
```

- Alle Variablen sind normalerweise public
- Mit `__privatvar` wird es zu einer Privaten Variable
- Mit `__doc__` kann auf die `'''` Infos zugegriffen werden `Person.__doc__` or `Person.sagHallo.__doc__`
- `__init__` wird immer bei der erzeugung eines Objektes ausgeführt
- `__del__` wird automatisch aufgerufen falls das Objekt nicht mehr gebraucht wird

### inherit

``` python
class SchulMitglied:
    '''Repraesentiert ein beliebiges Mitglied der Hochschule.'''
    def __init__(self, name, alter):
        self.name = name
        self.alter = alter
        print('(SchulMitglied %s initialisiert)' % self.name)
    def auskunft(self):
        '''Gib Auskunft ueber das Mitglied.'''
        print('Name: "%s" Alter: "%s"' % (self.name, self.alter),)
class Dozent(SchulMitglied):
    '''Repraesentiert einen Dozenten der Hochschule.'''
    def __init__(self, name, alter, gehalt):
        SchulMitglied.__init__(self, name, alter)
        self.gehalt = gehalt
        print('(Dozent %s initialisiert)' % self.name)
    def auskunft(self):
        SchulMitglied.auskunft(self)
        print('Gehalt: "%d Euro"' % self.gehalt)
class Student(SchulMitglied):
    '''Repraesentiert einen Studenten der Hochschule.'''
    def __init__(self, name, alter, note):
        SchulMitglied.__init__(self, name, alter)
        self.note = note
        print('(Student %s initialisiert)' % self.name)
    def auskunft(self):
        SchulMitglied.auskunft(self)
        print('Letzte Pruefungsnote: "%1.1f"' % self.note)
d = Dozent('Mrs. Shrividya', 40, 30000)
s = Student('Swaroop', 22, 1.7)
mitglieder = [d, s]
for mitglied in mitglieder:
    mitglied.auskunft() # geht bei Dozenten und Studenten
```

## Input & Output

### File

``` python
text = 'sein oder nicht sein'

# Write
f = file('gedicht.txt', 'w') # "w" = Schreiben
f.write(text)                # schreibe den Text in die Datei
f.close()                    # schliesse die Datei

# Read
f = file('gedicht.txt')      # kein Modus bedeutet "r" = Lesen
while True:
    line = f.readline()
    if len(line) == 0:       # eine leere Zeile = Dateiende (EOF)
        break
    print(line,)              # das , für Zeilenvorschub Unterdrückung
    f.close()                # schliesse die Datei
```

### Freeze and Unfreeze

``` python
import cPickle as p
# Datei, in der das Objekt speichert wird
einkaufsdatei = 'einkaufsliste.data'
einkaufsliste = ['Aepfel', 'Mangos', 'Karotten']

# Schreibe in die Datei
f = file(einkaufsdatei, 'w')

#Einfrieren
p.dump(einkaufsliste, f) # speichere das Objekt in der Datei
f.close()
del einkaufsliste        # loesche die einkaufsliste
# Lies die Einkaufsliste aus der Datei wieder ein
f = file(einkaufsdatei)

#Auftauen
gespeicherteliste = p.load(f)
print(gespeicherteliste)
```

## Exceptions

### `try .. except`

Each `try` needs to have at least one `except`

``` python
try:
    s = raw_input('Geben Sie etwas ein --> ')
except EOFError:
    print('\nWarum haben Sie die Eingabe abgebrochen?')
    sys.exit() # beendet das Programm
except:
    print('\nIrgendein Fehler hat eine Ausnahme ausgeloest.')
print('Fertig')
```

### throw exception

``` python
class KurzeEingabeAusnahme(Exception):
    '''Eine benutzerdefinierte Ausnahmeklasse.'''
    def __init__(self, laenge, mindestens):
        Exception.__init__(self)
        self.laenge = laenge
        self.mindestens = mindestens
try:
    s = raw_input('Geben Sie etwas ein --> ')
    if len(s) < 3:
        raise KurzeEingabeAusnahme(len(s), 3)
    # Hier kann man ganz normal mit der Arbeit fortfahren
except EOFError:
    print('\nWarum haben Sie die Eingabe abgebrochen?')
except KurzeEingabeAusnahme, x:
    print('KurzeEingabeAusnahme: Eingabe hatte die Laenge %d,' \
          ' gefordert war mindestens %d.' % (x.laenge, x.mindestens)
else:
    print('Es wurde keine Ausnahme ausgeloest.')
```

### `try .. finally`

If an exception is raised in the program, e.g. `Ctrl + c` Keyboard interrupt, the finally clause is raised before the program is closed

``` python
import time
try:
    f = file('gedicht.txt')
    while True: # unsere uebliche Weise, Dateien zu lesen
    zeile = f.readline()
    if len(zeile) == 0:
        break
    time.sleep(2)
    print(zeile,)
finally:
    f.close()
    print('Raeume auf... Datei geschlossen.')
```

## Buildin Methods

### `__init__()`

Is executed before an object is returned

``` python
__init__(self, ...)
```

### `__del__()`

Is called before an object is destroyed

``` python
__del__(self)
```

### `__str__()`

Is called if print or str() is used

``` python
__str__(self)
```

### `__it__()`

Is called if `<` is used `lt == less than` There are also such methods for other operators

``` python
__it__(self, other)
```

### `__getitem__()`

Is called if an indexing operator is used `x[key]`

``` python
__getitem__(self, key)
```

### `__len__()`

Is called if the `len()` function is used

``` python
__len__(self)
```
