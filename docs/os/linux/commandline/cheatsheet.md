---
tags:
- os
- operating system
- linux
- commandline
- cheatsheet
---
# Cheatsheet

## Admin rights

!!! note
    In order to gain administrative rights, for a session or only for a command

``` bash title="admin"
sudo su
sudo "command"
sudo -s           # Longtime root
su -              # root preserved env
sudo !!           # execute previous command as root
chsh -s /bin/zsh  # change login shell to zsh
```

## Quit

``` bash title="quit<y>"
sudo halt          # Sleep
sudo reboot        # Reboot
sudo shutdown now  # Shutdown
```

## Filesystem

See independent page: [filesystem](../filesystem/index.md)

## Environment variables

They can be set permanently system wide `/etc/profile` or per user shell `/etc/.bashrc` `/etc/.zshrc`

``` bash title="environment variables"
# Licenses
export LM_LICENSE_FILE=$LM_LICENSE_FILE:portnumber@serverip

# Print Environmemt variables
printenv
echo $name_env_var

# Set env var
setenv name value
```

## User

``` bash title="user"
# Access to different PC with unknown Password
chroot path/of/new/systemroot    # change root of FileSys
# Useful for hacking another PC
# 1. with LiveUSB / CD login
# 2. mount HD
# 3. chroot to his filessystem
# 4. Change user / password and everything else you want

# User information
who                              # returns all users logged in
whoami                           # return actual username
id <username>                    # return groups & id's of user

# Change to user
sudo -u user2 bash               # open bash of user2

# Send info
write <username> <tty>           # write to a logged user
                                 # see command who output

# Add user
sudo useradd -d /home/<username> -m <username>

# Add user to group
usermod -a -G <groupname> <username>

# Change user password
sudo passwd <username>
```

## Alias

``` bash title="alias"
# Set up aliases
alias <aliasname>="<command>"

# Common aliases
# Common home locations
alias home='cd ~'
alias root='cd /'
alias dtop='cd ~/Desktop'
alias dbox='cd ~/Dropbox'
alias dwld='cd ~/Downloads'
alias docs='cd ~/Documents'
alias www='cd /var/www/html'

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
```

## Permissions

``` bash title="permissions"
chmod xxx file|folder                # xxx = rwx|xnumber
chmod -x  file |folder               # add only executable Flag
chown -R user:group file|folder      # change owner recursively

find . -type d -exec chmod 755 {} \; # find dir's and set 755
find . -type f -exec chmod 644 {} \; # find files and set 644
```

**Rights**

| read    | write | execute | Abbreviation |
|---------|-------|---------|--------------|
| -       | -     | -       | 0            |
| -       | -     | x       | 1            |
| -       | x     | -       | 2            |
| -       | x     | x       | 3            |
| x       | -     | -       | 4            |
| x       | -     | x       | 5            |
| x       | x     | -       | 6            |
| x       | x     | x       | 7            |

## Threads

**PID = Process ID**

``` bash title="threads"
ps -x                             # view executed threads
ps -ax | grep name                # search for specific process name
kill <pidnumber>                  # kill thread with given PID
kill signal <pidnumber>           # kill with a signal type see table below
```

Signal Name   | Single Value               | Effect
------------- | -------------------------- | -------------------------
`SIGHUP`      | `1`                        | Hangup
`SIGINT`      | `2`                        | Interrupt from keyboard
`SIGKILL`     | `9`                        | Kill signal
`SIGTERM`     | `15`                       | Termination signal
`SIGSTOP`     | `17`, `19`, `23`           | Stop the process

## General

``` bash title="general"
uname -a                           # Distribution & Kernel informations
cat /etc/os-release                # General OS Informations
id -i <username>                   # Get UID
id -u <username>                   # Get GID

whereis command                    # returns location of command

mkdir /existing/path/dirname       # creates a directory
mkdir -p /non/existing/path/name   # creates a directory path
mkdir -p project/{lib/ext,bin,src,doc/{html,info,pdf},demo/stat/a}
                                   # creates a tree structure
pwd                                # print working directory
ls                                 # list content
ls -la                             # list flags
ll                                 # short list flags
cd                                 # change dir
rm name                            # remove file
rm -r                              # remove directory with content
rm -R name                         # remove recursively folder with its content
rm !(delete_all_but_this)          # delete all except !()
cp src/path /dest./path         # copy file
cp -R src/path dest./path       # copy directory with content
cp -R --preserve=mode,ownership,timestamp  src/path dest/path
                                   # copy with preserving owner and permission and time

# File
touch /path/to/file                # creates emtpy file or updates timestamp
echo "<text>" > /path/to/file      # creates file with content <text>
echo "<text>" >> /path/to/file     # append <text> to file
echo "<text>" | tee -a ~/.zshrc ~/.bashrs # appends to multiple files

# Disk info
df                                 # show disk sizes
df -H                              # show disk sizes in KB, MB, GB


diff path/to/file1 path/to file2   # compare file1<->file2 and shows the difference
sdiff path/to/file1 path/to file2  # compare file1<->file2 and merge directly
```

## Find / Which

``` bash title="find and which"
# finding and delete all folder with <foldername> and it's content
find -type d -iname "<foldername>" -exec rm -rf {} \;
# finding and delete all files with <filename> and it's content
find -type f -iname "<filename>" -exec rm -rf {} \;
# finding all files and directories within a directory
find /etc
# finding all files within a directory
find /etc -type f
# finding all files with a suffix
find /etc -type f -name "*.conf"

# Find location of a program
which zsh
```

## Grep

Grep let you search for word in files and outputs the line it was found.

``` bash title="grep"
grep boo /etc/passwd         # search boo in for /etc/passwd
grep -r "192.168.1.5" /etc/  # search recursivaly in /etc for 192.168.1.5
grep -w "boo" /path/to/file  # search for word "boo" only
```

grep is also often uses in pipes to search within the output of an other command

``` bash title="grep pipe"
cat /proc/cpuinfo | grep -i 'Model' # display CPU Model name
ps -x | grep vnc
```

!!! note "Flags"
    - `-r` : search recursively in all files \\
    - `-n` : display line number \\
    - `-c` : count number of times found \\
    - `--color` : colors the word searched in the results

## Links

``` bash title="links"
ln target-filename symbolic-filename    # create hardlink
ln -s target-filename symbolic-filename # create softlink
```

!!! note "Hard Link vs Softlink"
    Symbolic links are different from hard links. Hard links may not normally point to directories, and they cannot link paths on different volumes or file systems. Hard links always refer to an existing file.

## Compression

### Tar, bz2, gz

``` bash title="compress"
tar cfv name.tar /path/to/folder      # Compression tar
tar xfv tarfile                       # Decompression tar

tar cfvz name.tar.gz /path/to/folder  # Compression tar.gz
tar xfvz tarfile                      # Decompression tar.gz

tar cfvj name.tar.bz2 /path/to/folder # Compression tar.bz2
tar xfvj tarfile                      # Decompression tar.bz2
```

!!! note "Flags"
    - `c` = Compression \| `x` = eXtraction
    - `f` = file/folder
    - `v` = Verbose
    - `j` = bz2 \| `z` = gz
    - `p` = Preserve (keep permissions)

## RAR

``` bash title="compress rar"
# compress and split in files of 700MB
rar a -m5 -v700m rarname folder_or_file_to_compress

# uncompress, if a split rar uncompress the first
rar e rarname
```

!!! note "Flags"
    - `m5` = highest compression `m0` = lowest compression
    - `e` = extract in current folder
    - `a` = append to rar
    - `v<SIZE>m` = size of split files

## In Outputs

### Tail

``` bash title="tail"
tail file|folder                # give end of a file
./executable > output.txt       # redirect output to a file
./executable > output.txt 2<&1  # redirect output to a file output 2 & 1
                                # 2 = Error output
                                # 1 = Std output
```

### Cat

``` bash title="cat"
cat > file1.txt                         # To Create a new file
cat >> file1.txt                        # To Append data into the file
cat file1.txt                           # To display a file
cat file1.txt file2.txt                 # Concatenate several files and display
cat file1.txt file2.txt > file3.txt     # To cat several files and transfer output to another file
```

## PGP Pretty Good Privacy & GPG

see also [GnuPG](../../../security/gnupg.md)

### Files

``` bash title="pgp files"
/home/user/.ssh
pgp                             # private key
pgp.pub                         # public key
gpg_fingerprint.txt             # Infos for the gpg fingerprint
```

### Create PGP files

``` bash title="create key's"
ssh-keygen -t dsa -f filename   # Create private and public key
gpg --gen-key                   # Create gpg fingerprint
```

### GPG Privacy

``` bash title="gpg"
gpg --gen-key               # Create a key
gpg --export -a "User Name" > public.key# Export a public key
gpg --export-secret-key -a "User Name" > private.key# Export private key
gpg --import public.key         # Import public key
gpg --allow-secret-key-import --import private.key# Import private key
gpg --delete-key "User Name"        # Delete public key
gpg --delete-secret-key "User Name" # Delete private key
gpg --list-keys             # List key in public key ring
gpg --list-secret-keys          # Lsit key in private key ring
gpg --fingerprint > fingerprint     # Short list of numbers to verify public key
gpg -e -u "Sender User Name" -r "Receiver User Name" somefile # Encrypt data
gpg -d mydata.tar.gpg           # Decrypt data
```

## SSH

See also the dedicated [SSH page](../../../os/linux/commandline/ssh.md)

``` bash title="ssh_config"
# Edit config file
sudo vim /etc/ssh/sshd_config

# start, stop, restart SSH
sudo /etc/init.d/ssh start
sudo /etc/init.d/ssh stop
sudo /etc/init.d/ssh restart
```

``` bash title="ssh"
ssh-agent bash          # start new bash agent
ssh-add privatekey      # key you want to use for that session
             # without a given key he search for ~/.ssh/id_rsa
```

Connect to another station by ssh by default a password is needed or if configured no password but with rsh keys

``` bash title="ssh connection"
ssh -p <portnumber> -l <username> server.address.com

# or
ssh -p <portnumber> user@server.address.com

ssh -N -T -L <remoteport>:localhost:<localport> <user>@<hostname>

# or with port forward and commandline
ssh -L <remoteport>:localhost:<localport> <user>@<hostname>
```

!!! note "Options"
    - `-p <port>` - Custom port definition
    - `-l <username>` - Custom username definition
    - `-N` - No Output
    - `-T` - No Terminal access
    - `-L <remoteport>:localhost:<localport>` - Port Forwarding

## SCP

Transferring file through SSH For these command you have to use either the PW or already bash started

``` bash title="scp"
# Synchronising directories
rsync -avr -P --rsh='ssh -p YYYY' /localpath/to/dir user@host:/remotepath/to/dir

# Host -> Remote
scp sourceFile user@host:/directory/targetFile
scp -R sourceFolder user@host:/directory/targetFolder
scp -P port sourceFile user@host:/directory/targetFolder

# Remote -> Host
scp user@host:/directory/sourceFile targetFile
scp -R user@host:/directory/sourceFolder targetFolder
scp -P port user@host:/directory/sourceFolder targetFolder
```