---
tags:
- coding
- python
- packages
- pillow
---
# Pillow

- [Pillow on PIP](https://pypi.org/project/Pillow/)
- [Pillow RTD](https://pillow.readthedocs.io/en/stable/)

## Install

``` bash
pip install pillow
```

## Usage

### Import

``` python
import PIL
from PIL import Image
```

### Open Image

``` python
from PIL import Image

im = Image.open("kittens.jpg")
im.show()
print(im.format, im.size, im.mode)
# JPEG (1920, 1357) RGB
```