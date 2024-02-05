---
tags:
- os
- operating system
- linux
- scripts
---
# Scripts

Here you can dowload some example files for Linux. It can be neither Scripts or Links or config files

A lot of scripts and configurations can be found in my config repo:

- [Shell Scripts]({{config_repo_folder}}/scripts/shell)

## Script Basics

### Shell Bangs

At the beginning of a file there need to be a line to indentify the program or the file. IF the `#!/usr/bin/env` is used the system will search the command in your `$PATH` folders.

``` bash
#!interpreter [optional arguments]

#!/bin/sh
#!/bin/bash
#!/usr/bin/env python
#!/usr/bin/env bash
```

### Begin

``` bash
base_directory="$(dirname "$(readlink -f "$0")")"
pushd $base_directory
scriptname=`basename $0 .bash`

SEPARATOR='--------------------------------------------------------------------------------'
INDENT='  '

echo "$SEPARATOR"
echo "-- ${0##*/} Started!"
echo ""
```

### End

``` bash
echo ""
echo "-- ${0##*/} Finished!"
echo "$SEPARATOR"
popd
```

``` bash
exit 0
```

## Variables

``` .bash title="variables"
# Var
SEPARATOR='--------------------------------------------------------------------------------'
INDENT='  '

# Array
MOUNT_POINTS=( 'elem1' 'elem2')

# Use Env var
Linux_user="$USER"

# Check if variables exist
if [ -n "$verbose" ] ; then
  echo "$SEPARATOR\n * Git clone spl repositories\n"
fi
```

### Preexisting special variables

This is just a small incomplete list.

| Var name            | Description |
| ------------------- |--------------------------------------------------- |
| `$0`                | The name of the current script |
| `$1` ... `$9`      | The first 9 arguments of the script |
| `$#`                | Number of arguments passed tothe script |
| `$@`                | All the arguments passed to the script |
| `$USER`             | User name of the user running the script |
| `$HOSTNAME`         | Hostname of the machine running the script |
| `$PATH`             | List of folders in the current environment |
| `$SECONDS`          | Number of seconds since the script started |
| `$RANDOM`           | Returns a random number each time |
| `$LINENO`           | Return the current line number in the Bash script |

### Useful Variables

``` bash
base_directory="$(dirname "$(readlink -f "$0")")"
base_directory_alt=`dirname ${BASH_SOURCE[0]}`
scriptname_with_ext=${0##*/}
scriptname_without_ext=`basename $0 .bash`
```

## Strings
``` bash
file="/home/user/test.txt"
filename=$(basename -- "$file")
extension="${filename##*.}"
filename_withoutext="${filename%.*}"
path=$(dirname "${file}")
```

## Command line arguments

``` bash title="cli arguments"
usage='Usage: script.bash [-v] [-h]'
usage="$usage\n\t[-n input_n] [-u input_u]"

while getopts "n:u:vh" options; do
  case $options in
    n ) var_n=$OPTARG;;
    u ) var_u=$OPTARG;;
    v ) verbose=1;;
    h ) echo -e $usage
          exit 1;;
    * ) echo -e $usage
          exit 1;;
  esac
done

if [ -n "$verbose" ] ; then
  echo "Verbose"
fi
```

### Long and short arguments

``` bash title="short long cli arguments"
usage="usage: git-clone [options]
options:
  -m | --my      Clone my repos
  -a | --all     Clone all repos"

if [ $? != 0 ] ; then echo "No option given \n $usage \n\nTerminating..." >&2 ; exit 1 ; fi

# Transform long options to short ones
for arg in "$@"; do
  shift
  case "$arg" in
    "--my") set -- "$@" "-m" ;;
    "--all")   set -- "$@" "-a" ;;
    *)        set -- "$@" "$arg"
  esac
done

# Parse short options
OPTIND=1
while getopts "hvmfepsi" opt
do
  case "$opt" in
    "h") echo "$usage"; exit 0 ;;
    "v") verbose=true ;;
    "m") my=true ;;
    "a") all=true; my=true ;;
    "?") echo "$usage" >&2; exit 1 ;;
  esac
done
shift $(expr $OPTIND - 1) # remove options from positional parameters
```

## Conditions

Check if variable length is zero

``` bash
if test -z "$1"
then
  echo "Usage: $0 <Your name>"
else
  echo "Hello $1, from $0"
fi
```

Compare two values

``` bash
for i in {1..10}
do
  if test $i -eq 3
  then
    echo "I found the 3!"
  fi
done
```

## For Loops

## Functions

``` bash title="functions"
# Define function
function test () {
  local arg1=$1 ; local arg2=$2

  $result = $arg1 + $arg2

  return 1
}

# Usage function
test 1 2
```

## Console prints

Display message welcome on screen

``` bash title="echo"
# Console print
echo 'Welcome'

# Write message File deleted to /tmp/log.txt
echo 'File has been deleted' > /tmp/log.txt

# Append message File deleted /tmp/log.txt
echo 'File has been deleted' >> /tmp/log.txt

# Append message and command output on screen, print variable
echo "Today's date is $(date)"
```

## User Inputs

``` bash title="user inputs 1"
echo -n "Please enter: "

stty -echo
read user_text
stty echo

echo ""         # force a carriage return to be output
```

``` bash title="user inputs 1"
read -n1 -r -p "Press space to continue..." key
if [ "$key" = '' ]; then
    # Space pressed, do something
    # echo [$key] is empty when SPACE is pressed # uncomment to trace
else
    # Anything else pressed, do whatever else.
    # echo [$key] not empty
fi
```

Ask yes or no question with select

``` bash
select yn in "y" "n"; do
    case $yn in
        y ) install_license=true;;
        n ) install_license=false;;
    esac
done
```

## Files & Folders

``` bash title="extract path, filename, extension"
fpath=$(basename $fullpath)
fname=$(basename -- "$fullpath")
ext="${filename##*.}"
fname_withoutext="${filename%.*}"
```

### Check if file exists

``` bash title="check if file exists"
if test -f "$file"; then
  echo "$file found"
else
  echo "$file not found"$
fi
```

### Check and create folder

``` bash title="check and create folder"
if [ ! -d "/folder/location" ]; then
  sudo mkdir /folder/location
fi
```

## Lockfile

Lockfiles you can wait until another process is finished.

``` bash title="check and create folder"
# Define path and lockfile
lockDir="/path/to/lock_files"
lockFilePath="$lockDir/lockfile.lock"
# Loop until file no longer exist
while [ -e "$lockFilePath" ]
do
   exit
done

# Create new lockfile
touch $lockFilePath

TO SOMETHING THE LOCK IS YOURS

# Remove lockfile
rm -f $lockFilePath
```

# Find

``` bash title="find samples"
# Find all in current location
find .

# Find directory and execute commands
find . -maxdepth 1 -type d -exec sh -c '(cd {} && git pull)' ';'

# Find files and delete it
find $base_directory -type f -name '.cache.dat' | xargs -r rm -v

# Find folders and delete it
find $base_directory -type d -name '.xrf' | xargs -r rm -Rv

# Find files and RegEx replace some content
find $project_directory -type f -name '*._epf' | xargs sed -i "s/$actual_view/$new_view/g"

# Find with executing multiple command
find ./ -iname "*.md" -type f |while read file;
do
 filename_withoutext="${file%.*}"
 echo "pandoc $file -o $filename_withoutext.$out_type"
 pandoc $file -o $filename_withoutext.$out_type
done
```

## xargs

Xargs reads items from standard input (meaning, you can pipe data to it) and executes the specified command. In addition you can parallize the commands.

``` bash
xargs [options] [command [initial-arguments]]
```

``` bash
# Find mpeg files launch 4 parallel processes of ffmpeg
find . -name "*.mpeg" | xargs -P 4 -I {} ffmpeg -i {} -o {}.mp4
```

## Samples

``` bash
DIR="$( cd "$( dirname "$0" )" && pwd )" # get dir of executed file
```
