---
tags:
  - how to
  - mkdocs
---
![](img/hack.svg){align=right width="150px"}
# HACK this documentation
If you want to add your page to this documentation you need to add your source file `*.md` in the appropriate section. Every main section has its own folder structure and its own `img/` folder containing all images for this section.

This documentation uses a a main `yml`-file [mkdocs.yml](../static/mkdocs.yml){:download="mkdocs.yml"} that tell mkdocs which file, and in what order put it in the documentation tree.

```yaml
- Home: index.md
  - About:
      - about/index.md
      - Credits: about/credits.md
  - Blog: blog/index.md
```

If you don't have enough knowledge about Markdown then you can also use the [pandoc translator](https://pandoc.org/try/) or use the internal [Cheatsheet](../multimedia/writing/mkdocs/cheatsheet)

## New Section
A new section of subsection typically starts with an `index.md` file.

## Resource Folders
Add an image folder in the section/subsection folder `section/img`, in case of additional documents as a `section/docs` folder too.

## Write the contents
That's it, now you can add all you want in the new section/subsection and all pages will show up in the documentation automatically.