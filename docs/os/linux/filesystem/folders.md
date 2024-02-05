---
tags:
- os
- operating system
- linux
- filesystem
---
# Folders

## Foreword

Like UNIX, Linux chooses to have a single hierarchical directory structure.

Everything starts from the root directory, represented by `/`, and then expands into sub-directories instead of having so-called 'drives'. In the Windows environment, one may put one's files almost anywhere: on C drive, D drive, E drive etc. Such a file system is called a hierarchical structure and is managed by the programs themselves (program directories), not by the operating system. On the other hand, Linux sorts directories descending from the root directory / according to their importance to the boot process.

## Root directory `/`

As we all know Linux file system starts with `/`, the root directory. All other directories are 'children' of this directory. The partition which the root file system resides on is mounted first during boot and the system will not boot if it doesn't find it. On our reference system, the root directory contains the following sub-directories:

![[https://www.blackmoreops.com/](https://www.blackmoreops.com/)](img/linux_filesystem.png)

| Folder        | Description                                            |
|---------------|------------------------------------------------------- |
| `/bin`        | Essential command binaries                             |
| `/boot`       | Static files of the boot loader                        |
| `/dev`        | Device files                                           |
| `/etc`        | Host-specific system configuration                     |
| `/root`       | Home directory for the root user (optional)            |
| `/home`       | User home directories (optional)                       |
| `/lib`        | Essential shared libraries and kernel modules          |
| `/lib<qual>`  | Alternate format essential shared libraries (optional) |
| `/media`      | Mount point for removeable media                       |
| `/mnt`        | Mount point for mounting a filesystem temporarily      |
| `/opt`        | Add-on application software packages                   |
| `/sbin`       | Essential system binaries                              |
| `/srv`        | Data for services provided by this system              |
| `/tmp`        | Temporary files                                        |
| `/usr`        | Secondary hierarchy                                    |
| `/var`        | Variable data                                          |

### `/bin`

The bin directory contains several useful commands that are of use to both the system administrator as well as non-privileged users. It usually contains the shells like bash, csh, etc. and commonly used commands like cp, mv, rm, cat, ls. For this reason and in contrast to `/usr/bin`, the binaries in this directory are considered to be essential. The reason for this is that it contains essential system programs that must be available even if only the partition containing `/` is mounted. This situation may arise should you need to repair other partitions but have no access to shared directories (ie. you are in single user mode and hence have no network access). It also contains programs which boot scripts may depend on.

### `/boot`

This directory contains everything required for the boot process except for configuration files not needed at boot time (the most notable of those being those that belong to the GRUB boot-loader) and the map installer. Thus, the `/boot` directory stores data that is used before the kernel begins executing user-mode programs. This may include redundant (back-up) master boot records, sector/system map files, the kernel and other important boot files and data that is not directly edited by hand. Programs necessary to arrange for the boot loader to be able to boot a file are placed in `/sbin`. Configuration files for boot loaders are placed in `/etc`. The system kernel is located in either `/` or `/boot` (or as under Debian in `/boot` but is actually a symbolically
linked at `/`.

#### `/boot/map`

Contains the location of the kernel.

#### `/boot/vmlinuz` `/boot/vmlinuz-kernel-version`

Normally the kernel or symbolic link to the kernel.

#### `/boot/grub`

This subdirectory contains the GRUB configuration files including boot-up images and sounds. GRUB is the GNU GRand Unified Bootloader, a project which intends to solve all bootup problems once and for all. One of the most interesting features, is that you don't have to install a new partition or kernel, you can change all parameters at boot time via the GRUB Console, since it knows about the filesystems.

#### `/boot/grub/grub.conf` `/boot/grub/menu.lst`

Grub configuration file.

### `/dev`

`/dev` is the location of special or device files. It is a very interesting directory that highlights one important aspect of the Linux filesystem - everything is a file or a directory. Look through this directory and you should hopefully see hda1, hda2 etc ... which represent the various partitions on the first master drive of the system. `/dev/cdrom` and `/dev/fd0` represent your CD-ROM drive and your floppy drive. This may seem strange but it will make sense if you compare the characteristics of files to that of your hardware. Both can be read from and written to. Take `/dev/dsp`, for instance. This file represents your speaker device. Any data written to this file will be re-directed to your speaker. If you try `cat /boot/vmlinuz > /dev/dsp` (on a properly configured system) you should hear some sound on the speaker. That's the sound of your kernel! A file sent to `/dev/lp0` gets printed. Sending data to and reading from `/dev/ttyS0` will allow you to communicate with a device attached there - for instance, your modem.

3 Informations are relevant:

- Kind of the Access
  - bloc oriented (b) - buffered access e.g. Harddisks
  - characteroriented (c) - non buffered access e.g. Screen, Printer
- Major device number
  - Specify the driver to be used.
- Minor device number
  - To describe the actual instance of a device. In case multiple devices of the same driver are used

Some common device files as well as their equivalent counterparts under Windows that you may wish to remember are:

``` title="deviceslist.txt"
/dev/ttyS0 (First communications port, COM1)
    First serial port (mice, modems).

/dev/psaux (PS/2)
    PS/2 mouse connection (mice, keyboards).

/dev/lp0 (First printer port, LPT1)
    First parallel port (printers, scanners, etc).

/dev/dsp (First audio device)
    The name DSP comes from the term digital signal processor, a specialized processor chip optimized for digital signal analysis. Sound cards may use a dedicated DSP chip, or may implement the functions with a number of discrete devices. Other terms that may be used for this device are digitized voice and PCM.

/dev/usb (USB Devices)
    This subdirectory contains most of the USB device nodes. Device name allocations are fairly simplistic so no elaboration is be necessary.

/dev/sda (C:\, SCSI device)
    First SCSI device (HDD, Memory Sticks, external mass storage devices such as CD-ROM drives on laptops, etc).

/dev/scd (D:\, SCSI CD-ROM device)
    First SCSI CD-ROM device.

/dev/js0 (Standard gameport joystick)
    First joystick device.

/dev/hd*
    Mounted Harddisk Partitions
```

### `/etc`

Contains all local configurationfiles.

### `/root`

Home folder for the root user. In most systems it was eliminated

### `/home`

Home folder for all system users. Each user has a own RWX folder with
his name inside /home/

### `/lib`

Needed systemlibraries and kernelmodules

### `/lib<qual>`

Needed systemlibraries and kernelmodules

### `/media`

Debian automatic mountpoint for Plug&Play programms

### `/mnt`

Temporary mountpoint

### `/opt`

Place for optional Software installed be the user.

### `/sbin`

Important systemprogramms. They are used for the startup of the system.
Only executable by root user.

### `/tmp`

All users can use this foder to store temporary files

### `/usr`

User Data

### `/var`

Variable data