---
tags:
- os
- operating system
- linux
- scripts
- config
---
# Config Files

- [My linux configfiles]({{config_repo_folder}}/config/home/zac)

## `/etc/profile`

`/etc/profile` contains Linux system wide environment and startup programs. It is used by all users with `bash`, `zsh`, `sh` shell. Usually used to set `PATH` variable, user limits, and other settings for user. It only runs for login shell. If you wanted to make large changes or application specific changes use `/etc/profile.d` directory.

[My profile]({{config_repo_folder}}/config/home/server/profile)

### Add Program to`PATH`

``` bash
export PATH=$PATH:/opt/sublime_text
```

## `~.bashrc` `.zshrc`

Execute commands at start of a shell instance for a given users only

- [.bashrc]({{config_repo_file}}/config/home/zac/.bashrc)
- [.zshrc]({{config_repo_file}}/config/home/zac/.zshrc)

### Create a cmd alias

``` bash title="alias" linenums="1"
# Common home locations
alias home='cd ~'
alias root='cd /'
alias dtop='cd ~/Desktop'
alias dwld='cd ~/Downloads'
alias docs='cd ~/Documents'
alias www='cd /var/www/html'
# Common data directories
# Common commands
alias o=open
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
# Common command shortcuts
alias cls=clear
alias ll='ls -la'
alias owner-wwwdata='sudo chown -R www-data:www-data ./'
alias permission-file='sudo find . -type f -exec chmod 644 {} \;'
alias permission-folder='sudo find . -type d -exec chmod 755 {} \;'
# commands
alias backup='~/Documents/backup.bash'
```

### Add custom functions

``` bash title="function" linenums="1"
# Draw Mandelbrot Factral
function mandelbrot_zsh {
  local lines columns colour a b p q i pnew
  ((columns=COLUMNS-1, lines=LINES-1, colour=0))
  for ((b=-1.5; b<=1.5; b+=3.0/lines)) do
    for ((a=-2.0; a<=1; a+=3.0/columns)) do
      for ((p=0.0, q=0.0, i=0; p*p+q*q < 4 && i < 32; i++)) do
        ((pnew=p*p-q*q+a, q=2*p*q+b, p=pnew))
      done
      ((colour=(i/4)%8))
      echo -n "\\e[4${colour}m "
    done
    echo
  done
}
```

## `etc/fstab`

There's a file called /etc/fstab in your Linux system. Learn what its
contents mean and how it's used in conjunction with the mount command.
When you learn to understand the fstab file, you'll be able to edit its
contents yourself, too.

[My fstab]({{config_repo_file}}/config/home/server/fstab)

1. column - Device
    - `UUID=...`
    - `/dev/hda2`
2. column - Default mount point
    - `/`
    - `mnt/data`
    - `media/disk`
3. column - Filesystem type
    - `ext2`
    - `ext4`
    - `ntfs`
    - `vfat`
    - `auto`
4. column - Mount options
    - `auto and noauto` - mounted automatically at bootup
    - `user and nouser` - allows normal user to mount the device
    - `exec and noexec` - lets execute binaries from that partition
    - `ro and rw` - **R** ead- **O** nly and **R** ead- **W** rite
    - `sync and async` - data can be writte synchron or asynchron
    - `default` - means `rw,suid,dev,exec,auto,nouser,async`
5. column - Dump options
    - In most cases `0`
6. column - fck options
    - In most cases `0`

``` bash title="fstab" linenums="1"
UUID=3d3920bb-91c7-4632-8fd0-1d87b110a496 /                 ext4    errors=remount-ro 0       1
/swapfile                                 none              swap    sw                0       0

# internal WD 1TB Harddisk on /dev/sda1
#UUID=377d6d5c-3d62-4155-b7f1-3f07fe09a0c2 /mnt/data2        ext4    defaults          0       0


# external Lacie Rugged 2TB Harddisk on /dev/sda1
UUID=0c6f2eed-3ec0-493e-9ab8-e954a9e3a25d /media/zas_backup ext3    nofail,nobootwait 0       0

# external WD Passport 1TB Harddisk on /dev/sde1
UUID=20F605D47F5FE7AC                     /media/zas_media  ntfs    nofail,nobootwait 0       0
```