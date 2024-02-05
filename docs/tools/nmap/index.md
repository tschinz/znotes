---
tags:
- tools
- nmap
---
#  NMap

![](img/logo.jpg){.center width="20%"}

Nmap ("Network Mapper") is a free and open source (license) utility for network discovery and security auditing. Many systems and network administrators also find it useful for tasks such as network inventory, managing service upgrade schedules, and monitoring host or service uptime. Nmap uses raw IP packets in novel ways to determine what hosts are available on the network, what services (application name and version) those hosts are offering, what operating systems (and OS versions) they are running, what type of packet filters/firewalls are in use, and dozens of other characteristics. It was designed to rapidly scan large networks, but works fine against single hosts.

- [Nmap Download](https://nmap.org/download.html)
- [Nmap Manual](https://nmap.org/book/man.html) for creating commands

## Nmap Cheat Sheets
- [Nmap Basics]({{base_repo_file}}/docs/tools/nmap/docs/romelsan_nmap-basics.pdf)
- [SANS Nmap Cheatsheet v1.0]({{base_repo_file}}/docs/tools/nmap/docs/NmapCheatSheetv1.0.pdf)
- [See Security Technologies Nmap Cheatsheet v1.0]({{base_repo_file}}/docs/tools/nmap/docs/nmapcheatsheet.pdf)

## Commands

| Nmap Command                                                                      | Description |
| --------------------------------------------------------------------------------  | --------------------------- |
| `nmap -O target.host.com` <br> `nmap -O 10.11.12.22`                              | Scan one host |
| `nmap -O target1.host.com target2.host.com` <br> `nmap -O 10.11.12.22 10.11.12.1` | Scan multiple hosts |
| `nmap -sP 10.11.0.0/16` <br> `nmap -sP 10.11.12.0/24`                             | Ping Scan of a Network range |


## Options

| Options                    | Description |
| -------------------------- | ----------------------------------- |
| `-O`                       | Enable Operating System Detection |
| `-sV`                      | Version Scan |
| `-sS`                      | TCP Port Scan |
| `-SU`                      | UDP Port Scan |
| `-p 20-25`                 | Scan Ports 20-25 |
| `-pU:53,U:110,T20-445`     | Mix TCP UDP Port Scan |
| `-F`                       | Fast (limited Port Scan) |

## Ports

| Port                | Description |
| ------------------- | ------------------------------- |
| `22`                | SSH |
| `80`                | HTTP |
| `443`               | HTTPS |
| `3389`              | RDP (Remote Desktop Protocol) |
| `5800`              | Java VNC |
| `5900`              | Native VNC |
| `11444`             | Secomea SiteManager Port |
| `55000 - 59999`     | Secomea Goto Appliances Port |
