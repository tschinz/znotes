---
tags:
- coding
- spinal hdl
- hdl
- gtkwave
---
# GtkWave

- [Cheatsheet GTKWave 3.3 Wave Analyzer User's Guide](docs/gtkwave.pdf)

## Manual Reload

If you want to manually via command-line reload the file the gconf2 tool needs to be installed

``` bash
sudo apt-get install gconf2
```

Afterwards the reload command can be executed

``` bash
gconftool-2 --type string --set /com.geda.gtkwave/0/reload 0
```

## Supported Dumpfile

- `VCD`: **V**alue **C**hange **D**ump. This is an industry standard file format generated by most Verilog simulators and is specified in IEEE-1364. This is the slowest of the formats for the viewer to process and requires the most memory, however the format is ubiquitous and almost all tools support it, which is why native support remains.
- `LXT`: Inter **L**aced e **X**tensible **T**race. This is an optimized format utilizing interleaved back pointers and value changes. Processing LXT files is faster than VCD. It was created specifically for use with GTKWave, however some other simulators (notably, Icarus Verilog) support it natively.
- `LXT2`: Inter **L**aced e **X**tensible **T**race Version **2**. This is a block-based variant of LXT that allows for greater compression and access speeds than can be achieved with LXT. It allows random-access at the block level and also optionally allows partial loading of blocks for even faster operation.
- `VZT`: **V**erilog **Z**ipped **T**race. This is an outgrowth of LXT2 as it is also block based, however it employs a different heuristic for compression that allows for file sizes much smaller than most other dumpfile formats including commercial ones.
- `GHW`: **GH**DL **W**ave file. This is a nine state ("01XZHUWL-") file format written by the VHDL simulator GHDL.
- `AET2`: **A**ll **E**vents **T**race **V**ersion **2**. This is a format used by various IBM EDA tools.
- `IDX`: VCD Recoder **I**n **d**e **x**File. This format is written by GTKWave when instructed to generate fastload files.
- `FST`: **F**ast **S**ignal **T**race. This format is a block-based variant of IDX which is designed for very fast sequential and random access.

## TwinWave

With TwinWave it is possible to open two sessions at the same time. Concatenate the files with a `+` sign

``` bash
twinwave a.vcd a.sav + b.vcd b.sav
```