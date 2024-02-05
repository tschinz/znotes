---
tags:
- os
- operating system
- linux
- tools
- hw sensors
---
# Hardware Sensors

## Installation

``` bash
sudo apt-get install lm-sensors hddtemp
```

-   `lm-sensors` reads the mainboard sensors
-   `hddtemp` reads the S.M.A.R.T. enables harddisk sensors

## Setup

Running `sensors-detect`

``` bash
sudo sensors-detect
```

Answer to ALL questions with YES, especially to the last one "Do you want to add these lines to `/etc/modules` automatically.

## Loading modules

Since we don't want to restart; load the modules manually. Therefore load the modules displayed at the end of the previous command.

```
#----cut here----
# Chip drivers
coretemp
#----cut here----
```

Run command

``` bash
sudo modprobe [modulename]
```

## Monitoring

To read the sensors by coimmandline enter:

``` bash
sensors
```

There are also gui available for all desktop environments.

- Gnome: `sudo apt-get install sensors-applet`
- KDE: Build in Widget