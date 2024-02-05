---
tags:
- coding
- spinal hdl
- hdl
---
# Project Files

## Project Structure

Every SpinalHDL Project is created as a Scala Project This means the Scala folder definition applies, of course this can be changes if needed.

### General Project Structure

- `etc/` - external project libraries for example VexRISCV
- `project/` - sbt project configuration
  - `build.properties` - contains only sbt version to be used for this project
  - `plugins.sbt` - contains only sbt plugins to be used for this project
- `src/` - contains all source files synthesizable or not
  - `main/` - contains a folder for each programming language
    - `<language>/`
    - `c/` - src files for c ex. for hard- or softcore
    - `scala/` - src files for scala resp. SpinalHDL
      - `<project_name>/` - custom folder structure for project
        - `sim/` - optional simulation directory
    - `test` - same structure are `src/` files for test purpose only
      - `<language>/`
      - `cpp/` - test files for cpp ex. for hard- or softcore
      - `scala/` - test files for scala resp. SpinalHDL
- `target/` - temp folder where scala keeps compiled files
- `build.sbt`

### My Project Structure

```
+-- (.idea/)                    # temp intellij settings folder
+-- ext/                        # folder for external IP imported normally via submodules
+-- img/                        # project images
+-- project/                    # sbt project folder
+-- scripts/                    # general scripts for the project
+-- sim/                        # temp folder for simulation files
+-- scr/                        # folder for all project source files
|   +-- hardware/               # folder for all hw related stuff
|   |    +-- netlist/           # spinalHDL generated VHDL and Verilog Code ready for synthesis
|   |    +-- scala/
|   |    |   +-- <projectname>/ # all chrono project related scala files
|   |    |       +-- board/     # boardlevel Files (one folder per board)
|   |    +-- synthesis/         # folder for synthesis projects (one folder per board)
|   +-- test/                   # folder for testbench files
|       +-- scala/
|           +-- <projectname>/  # Testbenches for chrono project
+-- (target/)                   # temp folder for scala and sbt
+-- .gitignore
+-- build.sbt                   # main sbt project file
+-- LICENSE                     # The project license
+-- README.md                   # This file
```

## Create your first Project

Clone the [https://github.com/SpinalHDL/SpinalTemplateSbt](https://github.com/SpinalHDL/SpinalTemplateSbt) sample project and get started.

``` bash
git clone https://github.com/SpinalHDL/SpinalTemplateSbt.git
cd SpinalBaseProject/
sbt run
ls MyTopLevel.vhd
```

## Sample `build.sbt`

``` {.scala caption="build.sbt example"}
// project name & version
name := "eln-chrono-spinal"
version := "0.1"

// scala version
scalaVersion := "2.11.12"

EclipseKeys.withSource := true

// scala plugins dependencies
libraryDependencies ++= Seq(
  "com.github.spinalhdl" % "spinalhdl-core_2.11" % "1.3.8",
  "com.github.spinalhdl" % "spinalhdl-lib_2.11" % "1.3.8"
)

// changing the src folder for compile and test code
scalaSource in Compile := baseDirectory.value / "src"/ "hardware" / "scala"
scalaSource in Test    := baseDirectory.value / "src" / "test" / "scala"

// For allowing Simulation fork tasks
fork := true
```

## SBT Commands

``` bash
sbt                     # enter sbt shell
sbt clean               # clean repo from sbt generated files
sbt compile             # compiles all code in hardware/scala
sbt run                 # run all compiled code
```

## Add Submodule to Project

Need to be in the `ext/` folder

``` bash
git submodule add -b <branch> <url> ext
```
