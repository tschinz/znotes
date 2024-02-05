---
tags:
- coding
- python
- flake8
---
# Flake8

``` bash
python -m flake8 test.py
```

## `.flake8`

Flake8 configuration file is formated at `ini` File. and located at:

- Linux - `~/.config/flake8`
- Windows - `%userprofile%\.flake8`

see [my config]({{config_repo_file}}/.flake8)

``` ini
[flake8]
max-line-length = 200

ignore =
  #E501: Line too long
  E501

  #E722 do not use bare 'except'
  E722

  #W504 line break after binary operator (one has to disable one of the W503/W504 pair)
  W504

  #W391 blank line at end of file
  W391

exclude =
    .git,
    __pycache__,
    docs/src/conf.py,
    old,
    build,
    dist
```