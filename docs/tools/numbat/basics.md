---
tags:
- tools
- numbat
- cli
- calculator
- uasge
---

# Basics of `numbat`

## Usage
Interactive mode
```bash
numbat

  █▄░█ █░█ █▀▄▀█ █▄▄ ▄▀█ ▀█▀    Numbat 1.12.0
  █░▀█ █▄█ █░▀░█ █▄█ █▀█ ░█░    https://numbat.dev/

>>>
```

Run a numbat program
```bash
numbat script.nbt
```

Evaluate a single calculation
```bash
numbat -e "40 + 2"
```

## Commands
In the interactive mode there are several special commands available:

```numbat
help, ?                # Show help
quit, exit             # Quit the program

clear                  # Clear the screen

list, ls               # List all functions, dimensions, variables and units
list <item>            # List all of an item (functions, dimensions, variables, units)

info <identifier>      # info about a spcific function, dimension, variable or unit
```

most used
```numbat
list variables
```

## Tab completion
You can use the `Tab`  respectively `Tab+Tab` key to autocomplete commands and functions.

## Config Path
The configuration file is located:

| Platform | Path |
|----------|-------------|
| Linux    | `$HOME/.config/numbat or $XDG_CONFIG_HOME/numbat` |
| macOS    | `$HOME/Library/Application Support/numbat` |
| Windows  | `C:\Users\<username>\AppData\Roaming\numbat` |
