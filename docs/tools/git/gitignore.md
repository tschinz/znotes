---
tags:
- tools
- cli
- git
- gitignore
---
# .gitignore

Get useful gitignore at [gitignore.io](https://gitignore.io/)

Gitignore entries

```
*.bak           # all files with a given ending
DS_Store        # specific files
._*             # all ._ files

build/          # folder
build/out       # subfolder

build/*         # all files in folder
build/out/*     # all files in subfolder

!build/file.txt # except the given file

**/Entity/*~    # some subfolder name
```