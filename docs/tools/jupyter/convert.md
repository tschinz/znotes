---
tags:
- tools
- jupyter
---
#  Jupyter Converts

Some help to getting jupyter book to non developers

## nbconvert

Converts jupyter notebook to other formats

``` bash
jupyter nbconvert --to <format> notebook.ipynb
```

formats are:

- `--to html` - HTML
    - `--template full` (default)
    - `--template basic`
- `--to latex` - LaTeX
    - `--template article` (default)
    - `--template report`
    - `--template basic`
- `--to pdf` - PDF
    - `--template article` (default)
    - `--template report`
    - `--template basic`
- `--to sildes` - Reveal.js HTML slideshow
- `--to markdown` - Markdown
- `--to rst` - reStructuredText
- `--to script` - executable script (`.py`)
- `--to notebook` -

### Convert to python for linting

``` bash
jupyter nbconvert --to script test.ipynb
```

### Convert to html

``` bash
jupyter nbconvert --to html test.ipynb
```

### Convert to pdf

needs Latex installed see: [LaTeX](../../multimedia/writing/latex/install.md)

``` bash
jupyter nbconvert --to latex test.ipynb
```

## Execute a notebook in cmdline

More info in [official doc](https://nbconvert.readthedocs.io/en/latest/execute_api.html)

``` bash
jupyter nbconvert --to notebook --execute --inplace notebook.ipynb
```

## Little Mix of everything

``` bash
#!/bin/bash

# merge two jupyter notebooks
nbmerge Chapter1.ipynb Chapter2.ipynb  > Ebook.ipynb

# convert jupyter notebook to html
jupyter nbconvert --to html Ebook.ipynb --template=basic

# convert html to ebook with calibre tools
ebook-convert.exe Ebook.html Ebook.epub
ebook-convert.exe Ebook.html Ebook.azw3

# Convert single chapters from notebook to html
jupyter nbconvert --to html Chapter1.ipynb
jupyter nbconvert --to html Chapter2.ipynb

# with wktohtml convert html to pdf
wkhtmltopdf --enable-internal-links -L 10mm -R 9.5mm -T 10mm -B 9.5mm Chapter1.html Chapter1.pdf
wkhtmltopdf --enable-internal-links -L 10mm -R 9.5mm -T 10mm -B 9.5mm Chapter2.html Chapter2.pdf

# combine pdfs with cpdf
cpdf Chapter1.pdf Chapter2.pdf -o Ebook.pdf
```
