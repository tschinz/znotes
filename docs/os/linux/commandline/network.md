---
tags:
- os
- operating system
- linux
- commandline
- network
---
# Network

## Interfaces

``` bash title="interface"
ifconfig

ifup <if_name>
ifup eth0

ifdown <if_name>
ifdown eth0

ifquery -l
```

## NMAP

For more infos see the [nmap page](./../../../tools/nmap/index.md)

Find open ports on a ip subnet range

``` bash title="nmap"
# Finding ssh server in ip range 192.168.0-192.168.0.255
nmap -p 22 --open 192.168.1.0/24
```

## ARP-SCAN

Finding a machine on your local subnet using DHCP.

``` bash title="arp-scan"
# Finding ssh server in ip range 192.168.0-192.168.0.255
sudo apr-scan --interface=eth0 --localnet | grep aa:bb:cc:dd:ee:ff
```
