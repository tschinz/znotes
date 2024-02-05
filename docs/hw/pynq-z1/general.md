---
tags:
- hardware
- Xilinx
- PYNQ-Z1
---
# General
## Hostname

The default hostname is `pynq`. To change the hostname of the board use to following command and restart the board:

``` bash
# Get current hostname
hostname
# Change hostname
pynq_hostname.sh <NEW HOSTNAME>
# restart
shutdown -r now
```

## IP Address
Get Current IP Address

``` bash
hostname -I
```

### Ethernet
Change Static IP Address

``` bash
vim /etc/network/interfaces.d/eth0
```

For DHCP

```
auto eth0
iface eth0 inet dhcp

auto eth0:1
iface eth0:1 inet dhcp
```

For new static IP

```
auto eth0
iface eth0 inet dhcp

auto eth0:1
iface eth0:1 inet static
address <new-ip-address>
netmask <new-subnew-mask>
```

### Wifi

``` bash
vim /etc/network/interfaces.d/wlan0
```

```
iface wlan0 inet dhcp
 wpa-ssid <ssid>
 wpa-psk <password>
```

You can edit this file via a python cell in a notebook

``` python
from pynq.lib import Wifi
port = Wifi()
port.connect('wifiNetworkNameGoesHere', 'wifiNetworkPasswordGoesHere')
```

Activate and deactivate wifi if setup

``` bash
sudo ifdown wlan0
sudo ifup -v wlan0
```

Check wifi connection

``` bash
iwconfig
iw wlan0 info
```

## Jupyter
### Configuration
Jupyter Configuration can be found at:

``` bash
/root/.jupyter/jupyter_notebook_config.py
```

### Jupyter Password

``` python
# Create Password hash
from IPython.lib import passwd
password = passwd("secret")
> 6c2164fc2b22:ed55ecf07fc0f985ab46561483c0e888e8964ae6
```

``` {.python caption="jupyter_notebook_config.py"}
# Set jupyter notebook password hash
c.NotebookApp.password =u'sha1:6c2164fc2b22:ed55ecf07fc0f985ab46561483c0e888e8964ae6'
```

### Service

Jupyter is started automatically by a `systemctl` service. The start script can be found at

```
/usr/local/bin/start_jupyter.sh
```

``` bash
sudo systemctl status jupyter.service
sudo systemctl start jupyter.service
sudo systemctl stop jupyter.service
```

In case of problems the log file of `systemctl` can be access with the following command:

``` bash
sudo journalctl -u jupyter.service
```

```
/var/log/jupyter.log
```