---
tags:
- multimedia
- writing
- rst
- cheatsheet
---
# RST and Sphinx Cheatsheet

In this page you will get a quick overview about the most used syntax.

## Table of content

To include a table of content of all title in a page use

``` rst
.. contents:: :local:
```

## Titles

The lines have to be as long or longer than the text.

``` rst
=============
Section Title
=============

Titles
======

Paragraph
---------

Sub-Pragraph
^^^^^^^^^^^^
```

## Markup

``` rst
+--------------------------------------+-------------------------------+
|     *emphasis*                       | *emphasis*                    |
+--------------------------------------+-------------------------------+
|     **strong emphasis**              | **strong emphasis**           |
+--------------------------------------+-------------------------------+
|     `interpreted text`               | The rendering and meaning of  |
|                                      | interpreted text is domain-   |
|                                      | or application-dependent.     |
+--------------------------------------+-------------------------------+
|     ``inline literal``               | `inline literal`              |
+--------------------------------------+-------------------------------+
|     :markup:                         | markup                        |
|                                      |                               |
|                                      | :                             |
+--------------------------------------+-------------------------------+
|     > quote markup                   | \> quote markup               |
+--------------------------------------+-------------------------------+
```

## Links
### External Links
#### Internet

``` rst
`python <http://www.python.org/>`_
`<http://www.python.org/>`_
http://www.python.org/
```

#### Other Repo's

The plugin `sphinx.ext.extlinks` allows creating shortcuts

``` python
extlinks = {'config_repo': ('https://github.com/tschinz/config/%s', None),
            'znotes_repo': ('https://github.com/tschinz/znotes/%s', None)
           }
```

``` rst
:config_repo:`jupyter folder <tree/master/config/jupyter>`
:config_repo:`shell script <blob/master/scripts/shell/christmas_tree.sh>`
:znotes_repo:`znotes link <blob/master/src/conf.py>`
```

!!! note
    To access github files and folders you need to create the following link structure:
    - <https://> + `github_repo_link` + `tree/master/` + `folder/location`
    - <https://> + `github_repo_link` + `blob/master/` + `file/location.txt`


!!! tip
    **View/Download a pdf**

    <https://github.com> can be used to display a pdf from the repo without using the `:download` directive.

``` rst
https://github.com/tschinz/znotes/blob/master/src/coding/spinal/tools/docs/gtkwave.pdf

:pdf_view:`pdf view <source/coding/spinal/tools/docs/gtkwave.pdf>`
```

#### Other Sphinx Pages

``` rst
* absolute link from root
  :doc:`/about/index`

* relative link from document location
  :doc:`../../../about/index`
```

In the page to be jumped to add `.. _ref_name:`, and then you can:

``` rst
:ref:`ref_name`
:ref:`link title<ref_name>`
```

### Internal Links
#### Link to Titles

Link to titles directly is done with the extension `sphinx.ext.autosectionlabel`.

!!! tip
    You need to add the `folder_name` and `` subfolder(s)`_name `` name as well as `file_name` without `.rst` extension in order to reference a section title. This avoids the duplicated label warning.

``` rst
:ref:`Displayname <folder_name/subfolder_name/file_name/section_title>`
```

``` rst
:ref:`Back to top <multimedia/writing/rst/cheatsheet:RST and Sphinx Cheatsheet>`

:ref:`multimedia/writing/rst/cheatsheet:Images`
```

#### Internal References

In any place of the document a reference point can be inserted and later refered to.

``` rst
.. _ref-point:

see :ref:`ref-point`
```

#### File Links

To link to a file within the Sphinx file structure use the Role `:download:`

``` rst
:download:`../../../coding/tcl_tk_do/docs/tcl-tk-manual.pdf`

:download:`TCL/TK Manual </coding/tcl_tk_do/docs/tcl-tk-manual.pdf>`
```

## Images

``` rst
.. figure:: /img/logo.*
```

!!! tip
    Images should be either in `png` or `svg` format
    For `*.svg` files the file ending needs to be changed from `svg` to `*`. That way for html svg is used and pdf or pn for the latex or pdf output.

### Image Placement

``` rst
.. figure:: /img/logo.*
   :align: left
   :width: 100px

.. figure:: /img/logo.*
   :align: center
   :width: 100px

.. figure:: /img/logo.*
   :align: right
   :width: 100px

.. figure:: /img/logo.*
   :align: center
   :width: 100px
   :height: 100px
   :scale: 50 %
   :alt: this is the knowhow logo

   Caption of figure
```

### Side-by-Side Images

Images can be displayed side by side with the help of a list table

``` rst
.. list-table::

   * - .. figure:: img/logo.*
          :align: center
          :alt: logo 1
          :width: 200px

          Logo Text 1

     - .. figure:: img/logo.*
          :align: center
          :alt: logo 2
          :width: 200px

          Logo Text 2

     - .. figure:: img/logo.*
          :align: center
          :alt: logo 3
          :width: 200px

          Logo Text 3
```

### Inline Images

For inline images to work, a substitution needs to be made

``` rst
.. |folder_icon| image:: /img/icons/folder.*

After that the image |folder_icon| can be integrated inline.
```

#### Predefined Images

There are some predefined images in `conf.py` file.

``` rst
|folder|
|file|
|sign-check|
|upload|
|download|
|expand|
|minimize|
|arrow-up|
|arrow-down|
|arrow-left|
|arrow-right|
|star5|
|star4|
|star3|
|star2|
|star1|
|star|
|en|
|ch|
|de|
|china|
|uk|
|usa|
|it|
|jp|
|fr|
|linux|
|mac|
|win|
|word|
|excel|
|onenote|
|outlook|
```

## Lists

``` rst
* item 1

  * item 1.1
  * item 1.2

* item 2

  * item 2.1

    * item 2.1.1

#. auto enumerated list item 1
#. auto enumerated list item 1
#. auto enumerated list item 1
#. auto enumerated list item 1

3. enumerated list start with item 3
#. auto enumerated list item 4
#. auto enumerated list item 5
#. auto enumerated list item 6
```

## Tables

``` rst
+------------+------------+-----------+
| Header 1   | Header 2   | Header 3  |
+============+============+===========+
| body row 1 | column 2   | column 3  |
+------------+------------+-----------+
| body row 2 | Cells may span columns.|
+------------+------------+-----------+
| body row 3 | Cells may  | - Cells   |
+------------+ span rows. | - contain |
| body row 4 |            | - blocks. |
+------------+------------+-----------+
```

``` rst
=====  =====  ======
Inputs     Output
------------  ------
  A      B    A or B
=====  =====  ======
False  False  False
True   False  True
False  True   True
True   True   True
=====  =====  ======
```

!!! note
    `:widths: auto` will adapt the columnwidth automatically

``` rst
.. list-table::
   :header-rows: 1
   :stub-columns: 1
   :widths: 1 1 2
   :align: center

   * - Type
     - Literal
     - Description
   * - Boolean
     - true, false
     -
   * - Int
     - 3, 0x32
     - 32 bits integer
   * - Float
     - 3.14f
     - 32 bits floating point
   * - Double
     - 3.14
     - 64 bits floating point
   * - String
     - "Hello world"
     - UTF-16 string
```

``` rst
.. table:: Table caption

   =====  =====  ======
      Inputs     Output
   ------------  ------
     A      B    A or B
   =====  =====  ======
   False  False  False
   =====  =====  ======
```
## Code

see also [this](https://build-me-the-docs-please.readthedocs.io/en/latest/Using_Sphinx/ShowingCodeExamplesInSphinx.html) and [that](https://pygments.org/languages/)

For all available lexer see: `pygment_lexer`

``` rst
.. code-block:: python

   import antigravity

   def main():
       antigravity.fly()
   if __name__=='__main__':
       main()
```

``` rst
.. code-block:: python
   :linenos:
   :caption: Code Blocks can have captions.

   import antigravity

   def main():
       antigravity.fly()
   if __name__=='__main__':
       main()
```

``` rst
.. code-block:: python
   :linenos:
   :lineno-start: 10

   import antigravity

   def main():
       antigravity.fly()
   if __name__=='__main__':
       main()
```

## Infoboxes

``` rst
.. note::
   This is a Note Box
```

``` rst
.. warning::
   This is a Warning Box
```

``` rst
.. important::
   This is a Important Box
```

``` rst
.. seealso::
   This is a See Also Box
```

## Special Formatting

``` rst
.. versionadded:: 2.5
   The *spam* parameter.

.. versionchanged:: 2.5
   Feature description

.. deprecated:: 3.1
   Use :func:`spam` instead.
```

## Math

``` rst
Inline math :math:`a^2 + b^2 = c^2`.
```

``` rst
.. math::

   f(x) &= x^2\\
   g(x) &= \frac{1}{x}\\
   F(x) &= \int^a_b \frac{1}{3}x^3
```

## Exclude

In order to exclude some parts for a certain output use the `.. only:: output` directive.

``` rst
.. only:: html
.. only:: draft
.. only:: latex
.. only:: html or draft or latex
.. only:: html and draft
```

!!! warning
    This is needed for the all the [Wavedrom](cheatsheet.md#wavedrom) code

## Todo

If the extension `sphinx.ext.todo` is enabled and the variable `todo_include_todos` is set to True in `conf.py`, one can use the directive `todo` to write a todo task for a later completion.

```
.. todo::

   (example) This section need to be completed.
```

Then use the directive `todolist` to list all todos within the documentation:

```
.. todolist::
```

## GraphViz

Get more samples [here](https://graphviz.gitlab.io/gallery/)

``` rst
.. graphviz::

   digraph foo {
      "bar" -> "baz";
   }
```

``` rst
.. graphviz::

   digraph finite_state_machine {
     rankdir=LR;
     size="8,5"
     node [shape = doublecircle]; LR_0 LR_3 LR_4 LR_8;
     node [shape = circle];
     LR_0 -> LR_2 [ label = "SS(B)" ];
     LR_0 -> LR_1 [ label = "SS(S)" ];
     LR_1 -> LR_3 [ label = "S($end)" ];
     LR_2 -> LR_6 [ label = "SS(b)" ];
     LR_2 -> LR_5 [ label = "SS(a)" ];
     LR_2 -> LR_4 [ label = "S(A)" ];
     LR_5 -> LR_7 [ label = "S(b)" ];
     LR_5 -> LR_5 [ label = "S(a)" ];
     LR_6 -> LR_6 [ label = "S(b)" ];
     LR_6 -> LR_5 [ label = "S(a)" ];
     LR_7 -> LR_8 [ label = "S(b)" ];
     LR_7 -> LR_5 [ label = "S(a)" ];
     LR_8 -> LR_6 [ label = "S(b)" ];
     LR_8 -> LR_5 [ label = "S(a)" ];
   }
```

## Wavedrom

For more information see:

- [Wavedrom JSON Wiki](https://github.com/wavedrom/wavedrom/wiki/WaveJSON)
- [Wavedrom Tutorial](https://wavedrom.com/tutorial.html)

### Timing Diagrams

This documentation makes use of the `sphinxcontrib-wavedrom` plugin, So you can specify a timing diagram, or a register description with the `WaveJSON` syntax like so:

``` javascript
.. wavedrom::

   { "signal": [
      { "name": "pclk", "wave": 'p.......' },
      { "name": "Pclk", "wave": 'P.......' },
      { "name": "nclk", "wave": 'n.......' },
      { "name": "Nclk", "wave": 'N.......' },
      {},
      { "name": 'clk0', "wave": 'phnlPHNL' },
      { "name": 'clk1', "wave": 'xhlhLHl.' },
      { "name": 'clk2', "wave": 'hpHplnLn' },
      { "name": 'clk3', "wave": 'nhNhplPl' },
      { "name": 'clk4', "wave": 'xlh.L.Hx' },
   ]}
```

!!! note
    if you want the Wavedrom diagram to be present in the pdf export, you need to use the "non relaxed" JSON dialect. long story short, no javascript code and use `"` arround key value (Eg. `"name"`).

### Register
you can describe register mapping with the same syntax:

``` javascript
{"reg":[
  {"bits": 8, "name": "things"},
  {"bits": 2, "name": "stuff" },
  {"bits": 6},
 ],
 "config": { "bits":16,"lanes":1 }
 }
```

## PlantUML

This documentation makes use of the `sphinxcontrib.plantuml` plugin, for more information see the [sphinxcontrib.plantuml plugin](https://pypi.org/project/sphinxcontrib-plantuml/) and the [PlantUML Webpage](https://plantuml.com/). For a small Cheatsheet for PlantUML see [here](https://ogom.github.io/draw_uml/plantuml/)

``` rst
.. uml::

   class Foo1 {
     You can use
     several lines
     ..
     as you want
     and group
     ==
     things together.
     __
     You can have as many groups
     as you want
     --
     End of class
   }

   class User {
     .. Simple Getter ..
     + getName()
     + getAddress()
     .. Some setter ..
     + setName()
     __ private data __
     int age
     -- encrypted --
     String password
   }
```

``` rst
.. uml::

   Alice -> Bob: Authentication Request
   Bob --> Alice: Authentication Response

   Alice -> Bob: Another authentication Request
   Alice <-- Bob: Another authentication Response
```

``` rst
.. uml::

   actor actor
   agent agent
   artifact artifact
   boundary boundary
   card card
   cloud cloud
   component component
   control control
   database database
   entity entity
   file file
   folder folder
   frame frame
   interface  interface
   node node
   package package
   queue queue
   stack stack
   rectangle rectangle
   storage storage
   usecase usecase
```

## Mermaid

This documentation makes use of the `sphinxcontrib.mermaid` plugin, for more information see the [sphinxcontrib.mermaid plugin](https://pypi.org/project/sphinxcontrib-mermaid/) and the [Mermaid Webpage](https://mermaid-js.github.io/). For a small Cheatsheet for Mermaid see [here](https://jojozhuang.github.io/tutorial/mermaid-cheat-sheet/)

``` rst
.. mermaid::

   sequenceDiagram
      participant Alice
      participant Bob
      Alice->John: Hello John, how are you?
      loop Healthcheck
          John->John: Fight against hypochondria
      end
      Note right of John: Rational thoughts <br/>prevail...
      John-->Alice: Great!
      John->Bob: How about you?
      Bob-->John: Jolly good!
```

``` rst
.. mermaid:: docs/mermaid-gantt-code.mmd
```

## Buttons

``` rst
.. button:: Documentation
   :class: btn-large-square fa fa-book btn-hover-blue
   :link: #

.. button:: GitLab
   :class: btn-large-square fa fa-gitlab btn-hover-red
   :link: #
```

!!! note
    The button link opens a new browser page.

## Tags

For each page corresponding tags should be used, see `/about/tags` for all currently used tags.

``` rst
:tag:`RST`
:tag:`rst`
:tag:`Sphinx`
```
