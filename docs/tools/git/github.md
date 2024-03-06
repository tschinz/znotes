---
tags:
- tools
- cli
- git
- github
---
# Github

## Access Files and Folder

### Access a folder on github *tree*
```raw
https://github.com/<user>/<repo>/tree/<branch>/<folder>/<subfolder>
```
```raw
https://github.com/tschinz/znotes/tree/main/docs/coding/rust/docs
```
[https://github.com/tschinz/znotes/tree/main/docs/coding/rust/docs](https://github.com/tschinz/znotes/tree/main/docs/coding/rust/docs)

### Access a file on github *blob*
```raw
https://github.com/<user>/<repo>/blob/<branch>/<folder>/<subfolder>/<file>
```
```raw
https://github.com/tschinz/znotes/blob/main/docs/coding/rust/docs/rust_container-cheatsheet.pdf
```
[https://github.com/tschinz/znotes/blob/main/docs/coding/rust/docs/rust_container-cheatsheet.pdf](https://github.com/tschinz/znotes/blob/main/docs/coding/rust/docs/rust_container-cheatsheet.pdf)

### Download a file from github *raw*
```raw
https://github.com/<user>/<repo>/raw/<branch>/<folder>/<subfolder>/<file>
```
```raw
https://github.com/tschinz/znotes/raw/main/docs/coding/rust/docs/rust_container-cheatsheet.pdf
```
[https://github.com/tschinz/znotes/raw/main/docs/coding/rust/docs/rust_container-cheatsheet.pdf](https://github.com/tschinz/znotes/raw/main/docs/coding/rust/docs/rust_container-cheatsheet.pdf)

### View a PDF from github in the browser with *raw* and google docs
```raw
https://docs.google.com/viewer?url=https://github.com/<user>/<repo>/raw/<branch>/<folder>/<subfolder>/<file>
```
```raw
https://docs.google.com/viewer?url=https://github.com/tschinz/znotes/raw/main/docs/coding/rust/docs/rust_container-cheatsheet.pdf
```
[https://docs.google.com/viewer?url=https://github.com/tschinz/znotes/raw/main/docs/coding/rust/docs/rust_container-cheatsheet.pdf](https://docs.google.com/viewer?url=https://github.com/tschinz/znotes/raw/main/docs/coding/rust/docs/rust_container-cheatsheet.pdf)

## Advanced Search

### General

```
user:<user-name>
user:tschinz

repo:<repo-name>
repo:cheatsheet
repo:tschinz/znotes
```

## Files

```
filename:<filename>
filename:conf.py

extension:<fileextension>
extension:jpg
extension:py

path:<folder_path>
path:/src/_static/
```

## Date Time

```
created:>2019-12-01
created:2019-12-01
```

## Language

Languages start with a big letter

`C`, `Python`, `Perl`, `C++`, `Tcl`, `TeX`

```
lang:<languagename>
lang:Python
```

## Repo Options

```
stars:0..100
stars:200
stars:>200

forks:0..100
forks:200
forks:>200

size:<inKb>
size:

fork:only
fork:true
fork:false
```