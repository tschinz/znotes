---
tags:
- os
- operating system
- linux
- tools
- shairport
---
# Shairport

Linux can receive AirPlay audio using a program called Shairport. Shairport tries to emulate the Airport system of Apple. This version allows to stream music from a  device e.g. Smartphone, Tablet, PC to the Airport Server which then play the music. The device need to be in the same Network.

## Install

Download AirPlay (Shairport)

``` bash
cd /tmp
sudo git clone https://github.com/abrasive/shairport.git shairport
```

### Install dependencies

``` bash
sudo apt-get install libssl-dev libavahi-client-dev libasound2-dev build-essential
```

### Configure the Shairport build

``` bash
cd shairport
./configure
```

### Make & install Shairport

``` bash
sudo make
sudo make install
```

### Identify your audio output device

``` bash linenums="1"
x@z:~$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 0: ALC892 Analog [ALC892 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 1: ALC892 Digital [ALC892 Digital]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 7: HDMI 1 [HDMI 1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

### Setup the firewall I use `ufw` to do this:

``` bash linenums="1"
sudo ufw allow from 192.168.1.1/16 to any port 3689 proto tcp
sudo ufw allow from 192.168.1.1/16 to any port 5353
sudo ufw allow from 192.168.1.1/16 to any port 5000:5005 proto tcp
sudo ufw allow from 192.168.1.1/16 to any port 6000:6005 proto udp
sudo ufw allow from 192.168.1.1/16 to any port 35000:65535 proto udp
```

## Run Shairport

``` bash
shairport -v -a 'Airplay receiver name' -o alsa-- -d hw:1,1
```

Add `-v` to the above for debugging info, `-vv` for more debug info and `-vvv` for even more debug info!

## Autostart

For automatically start shairport you can use the script that comes with the source. Just copy the script you need to the init.d directory.

``` bash
sudo cp scripts/debian/init.d/shairport /etc/init.d/
```