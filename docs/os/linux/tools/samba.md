---
tags:
- os
- operating system
- linux
- tools
- samba
---
# Samba
![](img/samba.svg){.center width="20%"}

Samba is useful for a creating a Network directory and share it with other PC, especially Windows.

## Server

For creating a server who shares a drive

### Installation Server

``` bash
sudo apt-get install samba
```

### Configuration

Under `global` add the following lines or uncomment them in your file `etc/samba/smb.conf`

``` bash linenums="1" title="/etc/samba/smb.conf"
[global]
        # Permission on newly created files and folders
        create mask = 0644
        directory mask = 0755

        # add user security
        security = user
        encrypt passwords = true
        map to guest = bad user
```

### User

``` bash
# Create User
sudo  smbpasswd -a username

New SMB password:
Retype new SMB password:
Added user username.

# Activate User
sudo smbpasswd -e username
Enabled user username.
```

### Creating Share

Add the end of the file `/etc/samba/smb.conf` add your shares

``` bash title="/etc/samba/smb.conf"
[multimedia]
        comment = multimedia
        path = /mnt/multimedia
        browseable = yes
        read only = no
```

### Restart Samba

``` bash
# Linux in general
sudo /etc/init.d/samba restart
# Ubuntu >10.04
sudo initctl restart smbd
```

### Test

To test samba and display all available shares for the current user type:

``` bash
smbclient -L <hostname or ipname>
```

## Client

For mounting a shared drive

### Installation Client

Install samba tools.

``` bash
sudo apt-get install samba smbfs
```

### Create shared folder

Create before an empty folder where you want to mount your samba drive.

``` bash
sudo mkdir /mnt/shared_folder_name
```

### Set Up FSTAB

Open `etc/fstab` file and add a new entry.

``` title="/etc/fstab"
# only read access
//SERVER/shares /MOUNTPOINT smbfs username=samba_user,password=samba_pass 0 0

# read / write access
//SERVER/shares /MOUNTPOINT smbfs username=samba_user,password=samba_pass,uid=this_user,gid=this_group 0 0
```
