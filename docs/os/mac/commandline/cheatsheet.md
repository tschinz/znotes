---
tags:
- os
- operating system
- macos
- commandline
- cheatsheet
---
# Cheatsheet

See also the dedicated [Linux Commandline](../../linux/commandline/index.md) page

## General

``` bash title="general"
# open documents
open <filename>   # open any document in the default application
# Quicklook documents
qlmanage -p ~/Path/to/file.ext

# updates
softwareupdate -i -a

# kill
killall Dock      # kill all dock applications (launchpad, desktop etc.)
killall Finder    # kill all finder application

# Clean RAM Memory
purge

# paste data from Clipboard
pbpaste

# Hide/Unhide file or folder
chflags hidden
chflags nohidden
```

## Networkdrives

``` bash title="netdrives"
# Connect netdrive
# Two methods mount in the default /Volumes/$share location
open "smb://$user:$pass@$server/$share"
osascript -e "mount volume "smb://$user:$pass@$server/$share""

# Disconnect netdrive
diskutil unmount /Volumes/$share
umount /Volumes/$share
```