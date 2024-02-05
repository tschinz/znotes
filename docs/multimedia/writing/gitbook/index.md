---
tags:
- multimedia
- writing
- gitbook
---
# GitBook
![](img/logo.svg){.center width="20%"}

## Introduction

Gitbook is a tool to create and generate books using the Markdown or ASCIIDoc Syntax. It allows to create book in the following formats:

- PDF
- EPUB
- MOBI
- HTML

## Installation

For using gitbook locally on your machine you'll need a couple of tools.

- [npm](https://www.npmjs.com/)
- Install gitbook commandline tools with the command:
  ``` bash
  npm install gitbook-cli -g
  ```

- Install [calibre](http://calibre-ebook.com/) this is needed for having the `ebook-convert` command

## Usage

``` bash
gitbook init    # creates a new ebook folder and file structure

gitbook install # installs the required plugins for the book you want to build

gitbook build   # build the static html webpage

gitbook pdf ./myrepo ./mybook.pdf
gitbook pdf     # creates a pdf version of the book

gitbook epub ./myrepo ./mybook.epub
gitbook epub    # created a epub version fo the book

gitbook mobi ./myrepo ./mybook.mobi
gitbook mobi    # created a mobi version fo the book
```

### Cover

|            | Big               | Small |
| ---------- | ----------------- | ----------------- |
| Filename   | cover.jpg         | cover_small.jpg |
| Size       | 1800px x 2360px   | 200px x 262px |

## Links

- [Github Gitbook Repo](https://github.com/GitbookIO/gitbook)
- [GitBook Official Website](https://www.gitbook.com/)
- [GitBook Documentation](https://docs.gitbook.com/)
- [Tschinz Gitbook Swift Cheatsheet](https://github.com/tschinz/swift_cheat_sheet)
