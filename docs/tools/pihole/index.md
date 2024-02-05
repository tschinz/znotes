---
tags:
- tools
- pihole
---
#  Pihole

![](img/logo.svg){.center width="20%"}

[Pi-Hole](https://pi-hole.net/) is a system for network-wide adblocking. It replaces the DNS server and apps are by default network-wide banned.

Very good blocklist from [Firebog](https://firebog.net/)

## Commands

For more informations see [pihole command](https://docs.pi-hole.net/core/pihole-command/)

``` bash
pihole enable
pihole restartdns
```

### Change password

``` bash
pihole -a -p
```

### Update `gravity.db`

Update gravity db from blocklists

``` bash
pihole -g
```

### Modify `gravity.db`

For more informations see [gravity](https://docs.pi-hole.net/database/gravity/)

Delete **all** `exact` blacklist entries

``` bash
sudo sqlite3 /etc/pihole/gravity.db "delete from domainlist where type=1;"
```

Other examples are found [gravity examples](https://docs.pi-hole.net/database/gravity/example/)
