---
tags:
- os
- operating system
- linux
- raspberry pi
---
# Setup Rpi

## Raspi-conf

The integrated Rpi config tool for many things.

``` bash
raspi-config
```

## Wifi Dongle

### Setup

``` bash caption="/etc/network/interfaces" linenums="1"
auto lo

iface lo inet loopback
iface eth0 inet dhcp

allow-hotplug wlan0
auto wlan0


iface wlan0 inet dhcp
        wpa-ssid "ssid"
        wpa-psk "password"
```

## For static IP address

``` bash title="/etc/network/interfaces" linenums="1"
iface eth0 inet static
address <static-ip>
netmask 255.255.255.0
network 192.168.0.0
broadcast 192.168.0.255
gateway 192.168.0.1
```

# Disable Power saving mode

``` bash title="/etc/modprobe.d/8192cu.conf"
# Disable power saving
options 8192cu rtw_power_mgnt=0 rtw_enusbss=1 rtw_ips_mode=1
```

## SSH

See also [SSH](../../linux/commandline/ssh.md)

### Set up Hostname

Setting up your Raspberry with a hostname can be very useful if it is connected to a network with DHCP Server. Instead of searching for the IP of the RPi you can find it by it's hostname.

- install samba and the samba tools
  ``` bash
  sudo apt-get install samba samba-common-bin
  sudo apt-get install netatalk # for avahi setup for mac
  ```
- change the hostname in the following files
  ``` bash
  sudo vim /etc/hostname
  sudo vim /etc/hosts
  # or
  sudo hostname <new_host_name>
  ```
- restart hostname service
  ``` bash
  sudo service hostname.sh start
  ```

Now you can connect to your RPi with your hostname

### SSH Connect

Regenerate ssh keys to be safe

``` bash
rm /etc/ssh/ssh_host_* && dpkg-reconfigure openssh-server
```

Connect via remote PC

``` bash
ssh pi@<hostname>
# or for mac
ssh <hostname>.local -l <username>
```

#### Resolve ssh lang issue

``` bash title="/etc/ssh/ssh_config"
# Comment the following line
# SendEnv LANG LC...
```

Add the following environment variables into your `~/.bash_profile`

``` bash title="~/.bash_profile"
export LANG="en_US"
export LANGUAGE=$LANG
export LC_ALL=$LANG
```

### Source `.bashrc` file upon ssh logon

Add the following line to the `~/.bash_profile`

``` bash title="~/.bash_profile"
source $HOME/.bashrc
```

## GUI

Launch GUI

``` bash
startx
```

## Important stuff

``` bash
sudo apt-get install vim git tightvncserver
```

## Interconectivity

Enable i2c

``` bash title="/etc/modules"
i2c-bcm2708
i2c-dev
```

Remove SPI and I2C from the blacklist

``` bash title="/etc/modprobe.d/raspi.blacklist.conf"
# Comment out both line to remove from blacklist
# blacklist spi-bcm2708
# blacklist i2c-bcm2708
```

## Python modules

### General

``` bash
sudo apt-get install python-dev
```

### GPIO

``` bash
sudo apt-get install python-rpi.gpio # GPIO Module
```

### I2C

``` bash
sudo apt-get install python-smbus # SMBus support
sudo apt-get install i2c-tools    # I2C support
sudo i2cdetect -y 0               # Detect I2C on RPi v2
```
