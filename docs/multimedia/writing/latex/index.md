---
tags:
- multimedia
- writing
- latex
---
# LaTeX
![](img/logo.svg){.center width="20%"}

## Introduction
### Some LaTeX helppages

- [HEI SPL Latex Templates](https://gitlab.hevs.ch/SPL/miscellaneous/spl-latex-template)
- [Cheatsheet A Guide to Latex](docs/Guide-to-Latex.pdf)
- [Cheatsheet A Guide to Latex Presentation](docs/Guide-to-Presentation.pdf)
- [Tex Stackexchange Forum](https://tex.stackexchange.com/)

### Generate PDF files
Latex is best suited to insert images as pdf. In order to convert images or svg into pdf use inkscape Convert `*.svg` images with inkscape to `*.pdf` and `*.pdf_tex`

``` bash
inkscape -D -z --file=image.svg --export-pdf=image.pdf --export-latex
```