---
tags:
- tools
- cmder
---
#  cmder

![](img/logo.svg){.center width="30.0%"}

## Introduction

Cmder is a portable console emulator for Windows

## Additional Information

- [cmder](https://cmder.net/)
- [cmder wiki](https://www.docker.com/) - Official cmder wiki

My cmder config files can be found in: [cmder config folder]({{config_repo_folder}}/config/cmder)

## Taskfile

The taskfile can be found in `cmder/config/cmder_tasksfile.txt`. It allows to start preconfigured consoles. Hereafter my setting

``` title="cmder taskfile"
wsl --distribution Ubuntu-20.04 -cur_console:pm:/mnt
*cmd /k "%ConEmuDir%\..\init.bat" -new_console:d:%USERPROFILE% -new_console:t:CmderAdmin
cmd /k "%ConEmuDir%\..\init.bat" -new_console:d:%USERPROFILE% -new_console:t:Cmder
cmd /k "%ConEmuDir%\..\init.bat" -new_console:d:%USERPROFILE% -new_console:t:Cmder
```

## User Alias

Allows for writing alias commands, it can be found in `cmder/config/user_aliases.cmd`. Hereafter just some useful examples.

!!! note
    Commands can be concatenated with `$t`.

``` title="alias"
-refresh_envvar="c:\work\OneDrive - HESSO\config\scripts\bat\envvar_refresh.bat"

;= goto alias
-goto-tmp=cd "c:\temp"
-goto-work=cd "c:\work"

;= Anaconda
-conda-py38=conda activate py38
-conda-jlab-export=cd C:\work\repo $t conda env export > condaenv.yml

;= SSH alias
-ssh-relia=ssh -p 98 -L 5900:localhost:5900 -L 9090: localhost:9090 user@url.com

;= Common commands
o=open
..=cd ..
...=cd .. $t cd ..
....=cd .. $t cd .. $t cd ..
.....=cd .. $t cd .. $t cd .. $t cd ..
......=cd .. $t cd .. $t cd .. $t cd .. &t cd ..
.......=cd .. $t cd .. $t cd .. $t cd .. &t cd .. &t cd ..
........=cd .. $t cd .. $t cd .. $t cd .. &t cd .. &t cd .. &t cd ..
.........=cd .. $t cd .. $t cd .. $t cd .. &t cd .. &t cd .. &t cd .. &t cd ..

;= Common command shortcuts
cls=clear
ll=ls -la --show-control-chars -F --color $*
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
ls=ls --show-control-chars -F --color $*
pwd=cd
unalias=alias /d $1
vi=vim $*
```

## User Userprofile

The user profile allows to run custom command at the start of a terminal. It can be found `cmder/config/user_profile.cmd`

``` title="user profile"
:: start ssh agent and load ssh key
call "%GIT_INSTALL_ROOT%/cmd/start-ssh-agent.cmd" /k exit
ssh-add.exe "C:\Users\zas\.ssh\id_rsa"

:: Activate conda environment
"c:\Users\zas\anaconda3\Scripts\activate.bat"
```