---
tags:
- coding
- python
- packages
- Fuzzywuzzy
---
# Fuzzywuzzy

[Fuzzywuzzy](https://github.com/seatgeek/fuzzywuzzy) is a native python fuzzy string matching library. It uses [Levenshtein Distance](https://en.wikipedia.org/wiki/Levenshtein_distance) to calculate the differences between sequences in a simple-to-use package.

## Install

``` bash
pip install fuzzywuzzy
```

## Usage

### Import

``` python
from fuzzywuzzy import fuzz
from fuzzywuzzy import process
```

### Simple Ratio

``` python
fuzz.ratio("this is a test", "this is a test!")
# 97
```

### Partial Ratio

``` python
fuzz.partial_ratio("this is a test", "this is a test!")
# 100
```

### Process

``` python
choices = ["Atlanta Falcons", "New York Jets", "New York Giants", "Dallas Cowboys"]
process.extract("new york jets", choices, limit=2)
# [('New York Jets', 100), ('New York Giants', 78)]

process.extractOne("cowboys", choices)
# ("Dallas Cowboys", 90)
```