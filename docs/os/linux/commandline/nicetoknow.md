---
tags:
- os
- operating system
- linux
- unix
- commandline
- rust
---
# Nice to Know
Herafter a list of handy nict to know CLI tools. Many of them are written in rust.

Check out also [Rust Utils](https://rustutils.com/)

| Tool                                              | Replaces   | Type            | Example                        | Description                                            |
|---------------------------------------------------|------------|-----------------|--------------------------------|--------------------------------------------------------|
| [bat](https://github.com/sharkdp/bat)             | `cat`      | Pager           | `bat src/main.rs`              | View files with syntax highlighting and Git integration |
| [exa](https://github.com/ogham/exa)               | `ls`       | Listing         | `exa -l -G`                    | List files with extended details and colored output     |
| [dust](https://github.com/bootandy/dust)          | `du`       | Disk Usage      | `dust -n 10`                   | Visualize disk usage of the current directory            |
| [duf](https://github.com/muesli/duf)              | `du`       | Disk Usage      | `duf -s`                       | Display disk usage with a simple and interactive interface |
| [procs](https://github.com/dalance/procs)         | `ps`       | Process Viewer  | `procs -a`                     | List all processes with a concise and readable format    |
| [ripgrep](https://github.com/BurntSushi/ripgrep)  | `grep`     | Search          | `rg -i TODO src/`              | Recursively searches directories for a regex pattern |
| [hyperfine](https://github.com/sharkdp/hyperfine) | -          | Benchmark       | `hyperfine 'cargo build'`      | Measure the execution time of 'cargo build' command      |
| [tokei](https://github.com/XAMPPRocky/tokei)      | -          | Code Statistics | `tokei src/`                   | Generate code statistics for the Rust source directory  |
| [delta](https://github.com/dandavison/delta)      | `diff`     | Visual Diff     | `git diff | delta`             | Enhance the git diff output with improved layout and styling |
| [zenith](https://github.com/bvaisvil/zenith)      | `top`      | Resource viewer | `zenith`                       | Zenith - sort of like top or htop but with zoom-able charts, network, and disk usage. |

**Finder tools**

| Tool                                               | Replaces   | Type            | Example                        | Description                                            |
|----------------------------------------------------|------------|-----------------|--------------------------------|--------------------------------------------------------|
| [fd](https://github.com/sharkdp/fd)                | `find`     | Search          | `fd '*.rs'`                    | Find files, user-friendlier than `find` |
| [skim](https://github.com/lotabout/skim)           | `fzf`      | Fuzzy Finder    | `skim`                         | Fuzzy Finder, integrated with commands for interactive file selection  |
| [fzf](https://github.com/junegunn/fzf)             | -          | Fuzzy Finder    | `fzf`                          | Fuzzy Finder, integrated with commands for interactive file selection  |
| [tv](https://github.com/alexpasmantier/television) | `fzf` `sk` s| Fuzzy Finder    | `tv`                           | Fuzzy Finder, with tui allow finding env vars, files, file content, git repos, alias |

## Commonly used commands

skim in interactive mode with preview script and bind `Ctrl-Y` to copy filename and `F4` open in Sublime Text
```bash
sk --ansi -i -c 'ag --color "{}"' --preview "./preview.sh {}" --bind 'f3:execute(subl -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort'
```

```bash
exa -la
```
