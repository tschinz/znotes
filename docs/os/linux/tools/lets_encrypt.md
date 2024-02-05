---
tags:
- os
- operating system
- linux
- tools
- lets encrypt
---
# Let's Encrypt

## Version

``` bash
certbot --version
```

## Renew Certificates

``` bash
# Stop Webserver Service
sudo service apache2 stop

# Update Certificates
sudo certbot renew
sudo certbot renew --dry-run

# Restart Webserver Service
sudo service apache2 start
```