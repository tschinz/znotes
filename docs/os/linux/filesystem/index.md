---
tags:
- os
- operating system
- linux
- filesystem
---
# Filesystem
![](img/logo.svg){.center width="20%"}

## Comandline Tools

### Disk Infos

#### df

``` bash title="df"
# check partitions and the available space
df -k
df -h                           # humand readable
```

``` bash title="df example"
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            7.8G     0  7.8G   0% /dev
tmpfs           1.6G   12M  1.6G   1% /run
/dev/sdc1       229G   86G  134G  39% /
tmpfs           7.8G   46M  7.8G   1% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           7.8G     0  7.8G   0% /sys/fs/cgroup
/dev/loop1       97M   97M     0 100% /snap/core/9804
/dev/loop2       13M   13M     0 100% /snap/dmd/102
/dev/loop3       13M   13M     0 100% /snap/dmd/99
/dev/sda1       1.8T  148G  1.6T   9% /mnt/data2
/dev/sdb1       3.6T  2.2T  1.3T  63% /mnt/data
tmpfs           1.6G   16K  1.6G   1% /run/user/1000
/dev/loop4       98M   98M     0 100% /snap/core/9993
```

#### fdisk

``` bash title="fdisk"
sudo fdisk -l
```

``` bash title="fdisk example"
$ sudo fdisk -l

Disk /dev/sda: 1.8 TiB, 2000398934016 bytes, 3907029168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: dos
Disk identifier: 0x000f0848

Device     Boot Start        End    Sectors  Size Id Type
/dev/sda1        2048 3907028991 3907026944  1.8T 83 Linux


Disk /dev/sdb: 3.7 TiB, 4000787030016 bytes, 7814037168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: 25BCB5B9-0133-4561-AF05-050B47B56F84

Device     Start        End    Sectors  Size Type
/dev/sdb1   2048 7814035455 7814033408  3.7T Linux filesystem
```

#### lsblk

``` bash title="lsblk"
lsblk
```

``` bash title="lsblk example 1"
$ lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 465.8G  0 disk
├─sda1   8:1    0    70G  0 part
├─sda2   8:2    0     1K  0 part
├─sda5   8:5    0  97.7G  0 part /media/4668484A68483B47
├─sda6   8:6    0  97.7G  0 part /
├─sda7   8:7    0   1.9G  0 part [SWAP]
└─sda8   8:8    0 198.5G  0 part /media/13f35f59-f023-4d98-b06f-9dfaebefd6c1
sdb      8:16   1   3.8G  0 disk
└─sdb1   8:17   1   3.8G  0 part
sr0     11:0    1  1024M  0 rom
```

``` bash title="lsblk example 2"
$ lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,STATE,MODEL,UUID
NAME     SIZE TYPE MOUNTPOINT      STATE   MODEL            UUID
loop1   96.6M loop /snap/core/9804
loop2     13M loop /snap/dmd/102
loop3     13M loop /snap/dmd/99
loop4   97.1M loop /snap/core/9993
sda      1.8T disk                 running WDC WD20NPVT-00Z
└─sda1   1.8T part /mnt/data2                               25c04a96-63f6-4307-800d-66928e4e1261
sdb      3.7T disk                 running ST4000LM024-2AN1
└─sdb1   3.7T part /mnt/data                                d56c1a6b-6871-4a27-8051-19747339b9ce
sdc    232.9G disk                 running Samsung SSD 860
└─sdc1 232.9G part /                                        3d3920bb-91c7-4632-8fd0-1d87b110a496
sdd      3.7T disk                 running Rugged USB-C
└─sdd1   3.7T part                                          88fdbcc0-809a-48c7-bdda-d75cd5f79bb4
```

#### blkid

Can help getting the disk label as well as UUID.

``` bash title="blkid"
blkid
```

``` bash title="blkid example 1"
sudo blkdid
/dev/loop0: TYPE="squashfs"
/dev/loop1: TYPE="squashfs"
/dev/sda1: LABEL="LACIE_4TB" UUID="88fdbcc0-809a-48c7-bdda-d75cd5f79bb4" BLOCK_SIZE="4096" TYPE="ext4" PARTLABEL="LACIE_4TB" PARTUUID="1951a976-0553-4e41-babf-0669c4f72abc"
/dev/sdb1: LABEL_FATBOOT="UNRAID" LABEL="UNRAID" UUID="2732-64F5" BLOCK_SIZE="512" TYPE="vfat"
/dev/nvme1n1p1: UUID="e8a4f1eb-9c45-4788-acd3-983bc648c190" UUID_SUB="23295689-1a38-4733-ae64-99f20365e737" BLOCK_SIZE="4096" TYPE="btrfs"
/dev/nvme0n1p1: UUID="e8a4f1eb-9c45-4788-acd3-983bc648c190" UUID_SUB="29bc6eff-23cf-47eb-a034-a636a7eaf126" BLOCK_SIZE="4096" TYPE="btrfs"
/dev/sdd1: UUID="3f43c35a-5efe-4a87-a3ae-51569bdbb6c9" BLOCK_SIZE="512" TYPE="xfs" PARTUUID="45fe7ed1-a032-4dfc-8733-bb4539703d0c"
/dev/sde1: UUID="21e3222c-f905-4c37-b4ef-885a4eb20c0e" BLOCK_SIZE="512" TYPE="xfs" PARTUUID="3e51cf36-79a9-4766-bdef-91cee3b24a40"
/dev/sdf1: UUID="4bfaa2ae-bcd8-4ad0-a177-5ac8de82f05a" UUID_SUB="b997b622-2292-4efc-8417-98a237206802" BLOCK_SIZE="4096" TYPE="btrfs"
/dev/md1: UUID="21e3222c-f905-4c37-b4ef-885a4eb20c0e" BLOCK_SIZE="512" TYPE="xfs"
/dev/md2: UUID="3f43c35a-5efe-4a87-a3ae-51569bdbb6c9" BLOCK_SIZE="512" TYPE="xfs"
/dev/loop2: UUID="3192fb1a-5f2f-46b9-81c7-b4a70ffd2d1f" UUID_SUB="d96394e4-3eee-4e48-8516-0831e05d5701" BLOCK_SIZE="4096" TYPE="btrfs"
/dev/loop3: UUID="f6fab2f6-1061-47a7-b930-072a0db7b77b" UUID_SUB="7a2f7129-4e27-4f5f-8ca5-43ec4e904a5e" BLOCK_SIZE="4096" TYPE="btrfs"
/dev/sdc1: PARTUUID="a4bf5ca2-9c51-4e9a-aa7f-668788558417"
/dev/sdg1: LABEL="WDPASSPORT_1TB" UUID="2741496b-5e41-428f-b704-ca09c13921c5" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="27461b98-01"
```

### Parted

Parted is a commandline tool which allows to add, modify, delete

``` bash title="parted"
# Create partition tables
# GPT
sudo parted /dev/sda mklabel gpt

# MBR
sudo parted /dev/sda mklabel msdos

# Format a drive fully as ext4
sudo parted -a opt /dev/sda mkpart primary ext4 0% 100%

# Format the drive
mkfs /dev/sda1
```

``` bash title="parted server"
$ parted

(parted) unit MiB
(parted) print
```

| Command                          | Description |
|----------------------------------|-------------|
| `unit`                           | Sets the kind of unit. I always use MiB. I always make this my first command. |
| `print`                          | Show the disk and partition information, complete with sizes in your selected unit. |
| `help`                           | Lists available commands. If followed by a command, gives help on that command's syntax and choices. |
| `mklabel`                        | Makes a partition table on the disk. If you use Linux, the type should always be either "msdos" or "gpt". |
| `mkpart`                         | Make Partition. You'll be asked primary or secondary, format type, start and end (in your chosen units). Always make sure your unit setting is "MiB". Always make your first partition starts at 1, and if your last one is intended to fill the rest of the disk, make its end be -1, which means end of disk. You can't put in a size directly: You must do the math and put in start and end. |
| `rm <#>`                         | Delete partition number <#>, which can be found using the print command. Obviously, use caution. |
| `set <number> <flag> <state>`    | This is how you set flags of partitions. To make partition 1 bootable, perform the following command: `(parted) set 1 boot on` |
| `align-check`                    | This queries you whether you want optimal or minimal alignment, and I always say optimal. Then it asks you for the partition number,  (which can be found using the `print` command), and when you put in the partition number, it reports it as being either aligned or not. Aligned partitions are a good thing for top notch disk performance. |
| `quit`                           | Exit the Parted program. |

| Command                                    | Description |
|--------------------------------------------|-------------|
| `lsblk -o +label,fstype,uuid`              | Command to see all relevant info on all partitions, without being root. |
| `mkfs.ext4 -L <mystring> /dev/<partition>` | Create an ext4 filesystem, with label `<mystring>`, on partition `/dev/<partition>`, where `<partition>` is something like `sda1` or `sda2` or `sdb1` |
| `mkswap -L <mystring> /dev/<partition>`    | Create a swap filesystem, with label `<mystring>`, on partition `/dev/<partition>`, where `<partition>` is something like `sda1` or `sda2` or `sdb1` |

### Partition Table and formatting

fdisk helps creating the partition table

``` bash title="partitiontable"
# Unmount the drive safely
sync
umount /dev/sdb1

# Prepare the drive
fdisk /dev/sdb

# delete filesystem on disk
d

# create new partition
n

# create primary partitions
p

# partition number
1

# set type, blocksize, start and end
(use defaults)

# write changes to disk
w

# Create Filesystem
mkfs.ext4 /dev/sdb1

# Mount the new formatted drive
mnt /dev/sdb1 /mnt/use/ext/
```

### Mounting

For permanent mount see: `/etc/fstab`

``` bash title="mounting"
sudo vim /etc/fstab             # To edit default mount drives
sudo fdisk -l           # Drive info
ls -l /dev/disk/by-uuid         # get Drive UUID's
mkdir -p /media/d       # make folder for HD
mount -t vfat -o iocharset-utf8, umask=000 /dev/sda3 /media/d

mkdir -p /mnt/mountplace
mount /dev/sda1 /mnt/mountplace

unmount /mnt/mountplace

mount -U <UUID>                 # mount drive according to fstab definition
```

### Wipe Disk

``` bash title="wipe disk"
# unmount disk
sudo umount /dev/sdXY -l

# use /dev/random to write Zeros on entire disk
sudo dd if=/dev/urandom of=/dev/sdX bs=10M
```
