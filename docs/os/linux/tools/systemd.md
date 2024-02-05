---
tags:
- os
- operating system
- linux
- tools
- systemd
---
# Systemd

## List services

``` bash
systemctl --type=service
```

## Status service

``` bash
systemctl status firewalld.service
```

## Start Stop Service

``` bash
systemctl stop firewalld.service
systemctl status firewalld.service
```

## Add Service

``` bash
cd /etc/systemd/system
sudo vim jupyterlab.service
```

## Add in vim file

``` ini
[Unit]
Description = Jupyterlab service
After = network.target
StartLimitIntervalSec=0

[Service]
Type=simple
User=zas
ExecStart=/home/zas/Documents/jupyterlab_start.bash

[Install]
WantedBy = multi-user.target
```

## Start Service manually

``` bash
systemctl start jupyterlab
```

## Start Service on boot

``` bash
systemctl enable jupyterlab
```