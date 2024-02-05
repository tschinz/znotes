---
tags:
- os
- operating system
- linux
- commandline
- dd
---
# dd and ddfldd

Use for creating and copying iso files from and to a medium.

The `dd` command doesn't has a output during copy but `dcfldd` does. It gives an output all X blocks written. This means in the commands below you can also just replace `dd` with `dcfldd`.

## Install

``` bash title="dcfldd install"
sudo apt-get install dcfldd
```

## On Linux

``` bash title="dd usage"
# Create usb stick or sdcard => image
fdisk -l                                  # get disk info
unmount /dev/sdX                          # unmount disk
dd if=/dev/sdX of=/location/for/image.iso bs=1M conv=noerror,sync # copy usb stick to image

# Copy image => usb stick or sdcard
fdisk -l                                  # get disk info
unmount /dev/sdX                          # unmount disk
dd if=/location/of/image.iso of=/dev/sdX bs=1M conv=noerror,sync # copy image to usb stick
```

[dd](dd.md#dd-and-ddfldd) has no output normally, if you want to watch the status of the copy then open a new Terminal and try one of the following commands

``` bash title="watch dd"
sudo kill -USR1 $(pgrep '^dd$')                            # dd will display status once
sudo watch -n <interval in sec> kill -USR1 $(pgrep '^dd$') # dd will display status continously
```

## On MacOs

``` bash title="dd usage"
# Create usb stick or sdcard => image
diskutil list                               # get disk info
diskutil unmountDisk /dev/diskX             # unmount disk
dd if=/dev/diskX of=/location/for/image.iso bs=1m # copy usb stick to image

# Copy image => usb stick or sdcard
diskutil list                              # get disk info
diskutil unmountDisk /dev/diskX            # unmount disk
dd if=/location/of/image.iso of=/dev/diskX bs=1m conv=noerror,sync # copy image to usb stick
```