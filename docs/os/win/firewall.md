---
tags:
- os
- operating system
- windows
- firewall
---
# Firewall
## SSH Over FTP Port

Ff FTP Port is used for SSH connections disable `Statefulftp` in the Windows firewall

``` bat
netsh advfirewall set global statefulftp disable
```
