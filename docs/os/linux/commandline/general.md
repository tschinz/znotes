---
tags:
- os
- operating system
- linux
- commandline
---
# General Shell Commands

## Change permissions on type

``` bash
sudo find /var/www -type d -print0 | sudo xargs -0 chmod 0755
sudo find /var/www -type f -print0 | sudo xargs -0 chmod 0644
```

## SSH relia

``` bash
ssh -p 2222 -L 5900:localhost:5900 -L 19999:localhost:19999 zas@relia.zapto.org
```
