---
tags:
- tools
- virtualbox
---
# VirtualBox

![](img/logo.svg){.center width="20%"}

## Contents

{nav}

## Introduction

Oracle VM VirtualBox is an x86 virtualization software package. VirtualBox is installed on an existing host operating system as an application; this host application allows additional guest operating systems, each known as a Guest OS, to be loaded and run, each with its own virtual environment. Supported host operating systems include Linux, Mac OS X, Windows XP, Windows Vista, Windows 7, Solaris, and OpenSolaris; there is also a port to FreeBSD. Supported guest operating systems include versions and derivations of Windows, Linux, BSD, OS/2, Solaris and others.

## Links

- [Virtualbox Official Webpage](https://www.virtualbox.org/)

## Useful Commands

### Change UUID of a VirtualDisk

``` bash
VBoxManage internalcommands sethduuid copiedfile.vdi
```

### Clone VirtualDisk

``` bash
VBoxManage clonevdi /path/to/existing.vdi new.vdi
```

### Shrink dynamic image

``` bash
VBoxManage modifyvdi vm_hd.vdi compact
```

### Resize VirtualDisk

After resizing the harddisk file it, the partition needs to be resized to in gparted for Linux of Disk Management in Windows

``` bash
VBoxManage modifyhd YOUR_HARD_DISK.vdi --resize SIZE_IN_MB
VBoxManage modifyhd pentaho_vm.vdi --resize 40000 # resize to 40GB
```

## Access to shared folder

In order to access a shared folder in the guest os you need to add the user to the group `vboxsf`

``` bash
sudo adduser $USER vboxsf
```
