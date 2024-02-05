---
tags:
- os
- operating system
- linux
- commandline
- ssh
---
# SSH

SSH is a useful and secure tool to connect yourself via the internet or locally with your PC remotely. It is not installed on every distribution by default.

## Install

``` bash
sudo apt-get install ssh
```

## Config

``` bash
sudo nano /etc/ssh/sshd_config
```

Define port to listen, recommend to change the default port `22`

If you use FTP Port as SSH Port (`21`) then you will run into problems with connecting via Windows PC's because of the Windows Firewall. In order to solve this problem execute the following line on Windows PC's with Admin privilege.

``` bat
netsh advfirewall set global statefulftp disable
```

### Source your `.bashrc`

Create or edit the `~/.bash_profile`. And add the following line to souce with each SSH Login your `.bashrc`

``` bash title=".bash_profile"
source ~/.bashrc
```

#### Test

Test you system with via the localhost.

``` bash
ssh -p <portnumber> localhost
```

#### Restart SSH

``` bash
sudo /etc/init.d/ssh restart
```

### Connect

``` bash
ssh -p <portnumber> -l <username> server.address.com
ssh -p <portnumber> user@server.address.com
```

### Port Forwarding

``` bash title="ssh connection"
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

### RSA keys

How to setup ssh with rsa keys

``` bash title="ssh keys"
# Generating RSA Key pair
ssh-keygen -t rsa

# Copy key
ssh-copy-id -i ~/.ssh/id_rsa.pub "user@remote.machine.com -p <portnumber>"
# OR
scp id_rsa.pub user@host:~/.ssh/machine.pub

# Append key to file authorized_keys
cat ~/.ssh/*.pub | ssh admin@server.machine.com -p <portnumber> 'umask 077; cat >>.ssh/authorized_keys'
```
