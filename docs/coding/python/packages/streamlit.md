---
tags:
- coding
- python
- packages
- streamlit
- dashboard
---
# Streamlit
![](img/streamlit.svg){.center width="30.0%"}

[Streamlit](https://www.streamlit.io/) is the fastest way to build data apps.

- [Documentation](https://docs.streamlit.io/en/stable/)
- [Sample gallery](https://www.streamlit.io/gallery)

## Cheatsheet

Instead of listing its funcitionalities here you can find an exhaustive example as standalone repo: [Streamlit Cheastsheet](https://github.com/tschinz/streamlit_cheatsheet)

## Install

``` bash
pip install streamlit

streamlit hello
```

## Import

``` python
import streamlit as st

st.title("Hello World")
```

## Run

``` bash
streamlit run pythonscript.py
```

## Caching

In order to cache parts of the website, functions which are not needed to be reexecuted each time can be caches with the help of a python decorator.

``` bash
@st.cache(persist=True)
def someTimeconsumingFunction():
  sleep(100)
```