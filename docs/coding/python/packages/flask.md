---
tags:
- coding
- python
- packages
- flask
---
# Flask
![](img/flask.svg){.center width="60.0%"}

[Flask Webpage](https://flask.palletsprojects.com) is a micro web developement framework. By default, Flask does not include a database abstraction layer, form validation or anything else where different libraries already exist that can handle that. Instead, Flask supports extensions to add such functionality to your application as if it was implemented in Flask itself. Numerous extensions provide database integration, form validation, upload handling, various open authentication technologies, and more. Flask may be "micro", but it's ready for production use on a variety of needs.

## Install

``` bash
pip install Flask
```

## Usage

### Import

``` python
from flask import Flask
```

### Minimal Example

``` python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
```