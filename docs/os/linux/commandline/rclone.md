---
tags:
- os
- operating system
- linux
- commandline
- rclone
---
# RClone
![](img/rclone.svg){.center width="40%"}


Rclone is a command-line program to manage files on cloud storage. It is a feature-rich alternative to cloud vendors' web storage interfaces. [Over 70 cloud storage products](https://rclone.org/#providers) support rclone including S3 object stores, business & consumer file storage services, as well as standard transfer protocols.

## Find configuration file

``` bash title="rclone config file"
rclone config file
```

## Creating a new config

In this example a onedrive config is choosen

!!! tip
    The rclone config commmand could also be used on a headless machine (no browser) available. But Copy paste the long access token lead to problems. Best is using another machine to setup the remote and copy the config file to the headless machine. See [rclone config file](./rclone.md#find-configuration-file) to find the location of the config file.


``` bash title="rclone config"
rclone config
No remotes found, make a new one?
n) New remote
s) Set configuration password
q) Quit config
n/s/q> n

Enter name for new remote.
name> onedrive

Option Storage.
Type of storage to configure.
Choose a number from below, or type in your own value.
 1 / 1Fichier
   \ (fichier)
 2 / Akamai NetStorage
   \ (netstorage)
 3 / Alias for an existing remote
   \ (alias)
 4 / Amazon Drive
   \ (amazon cloud drive)
 5 / Amazon S3 Compliant Storage Providers including AWS, Alibaba, ArvanCloud, Ceph, ChinaMobile, Cloudflare, DigitalOcean, Dreamhost, GCS, HuaweiOBS, IBMCOS, IDrive, IONOS, LyveCloud, Leviia, Liara, Linode, Minio, Netease, Petabox, RackCorp, Rclone, Scaleway, SeaweedFS, StackPath, Storj, Synology, TencentCOS, Wasabi, Qiniu and others
   \ (s3)
 ...
13 / Dropbox
   \ (dropbox)
...
16 / FTP
   \ (ftp)
17 / Google Cloud Storage (this is not Google Drive)
   \ (google cloud storage)
18 / Google Drive
   \ (drive)
19 / Google Photos
   \ (google photos)
...
34 / Microsoft OneDrive
   \ (onedrive)
35 / OpenDrive
   \ (opendrive)
...
44 / SMB / CIFS
   \ (smb)
45 / SSH/SFTP
   \ (sftp)
...
Storage> 34

Option client_id.
OAuth Client Id.
Leave blank normally.
Enter a value. Press Enter to leave empty.
client_id>

Option client_secret.
OAuth Client Secret.
Leave blank normally.
Enter a value. Press Enter to leave empty.
client_secret>

Option region.
Choose national cloud region for OneDrive.
Choose a number from below, or type in your own string value.
Press Enter for the default (global).
 1 / Microsoft Cloud Global
   \ (global)
 2 / Microsoft Cloud for US Government
   \ (us)
 3 / Microsoft Cloud Germany
   \ (de)
 4 / Azure and Office 365 operated by Vnet Group in China
   \ (cn)
region> 1

Edit advanced config?
y) Yes
n) No (default)
y/n>

Use web browser to automatically authenticate rclone with remote?
 * Say Y if the machine running rclone has a web browser you can use
 * Say N if running rclone on a (remote) machine without web browser access
If not sure try Y. If Y failed, try N.

y) Yes (default)
n) No
y/n>

YYYY/MM/DD HH:MM:SS NOTICE: If your browser doesn't open automatically go to the following link: http://127.0.0.1:53682/auth?state=xxxxx
YYYY/MM/DD HH:MM:SS NOTICE: Log in and authorize rclone for access
YYYY/MM/DD HH:MM:SS NOTICE: Waiting for code...
YYYY/MM/DD HH:MM:SS NOTICE: Got code
Option config_type.
Type of connection
Choose a number from below, or type in an existing string value.
Press Enter for the default (onedrive).
 1 / OneDrive Personal or Business
   \ (onedrive)
 2 / Root Sharepoint site
   \ (sharepoint)
   / Sharepoint site name or URL
 3 | E.g. mysite or https://contoso.sharepoint.com/sites/mysite
   \ (url)
 4 / Search for a Sharepoint site
   \ (search)
 5 / Type in driveID (advanced)
   \ (driveid)
 6 / Type in SiteID (advanced)
   \ (siteid)
   / Sharepoint server-relative path (advanced)
 7 | E.g. /teams/hr
   \ (path)
config_type> 1

Option config_driveid.
Select drive you want to use
Choose a number from below, or type in your own string value.
Press Enter for the default (b!xxxx).
 1 / OneDrive (business)
   \ (b!xxxx)
config_driveid> 1

Drive OK?

Found drive "root" of type "business"
URL: https://xxxx

y) Yes (default)
n) No
y/n>

Configuration complete.
Options:
- type: onedrive
- token: {"access_token":"xxxx","expiry":"YYYY-MM-DDTHH:MM:SS.PS+HH:MM"}
- drive_id: b!xxxx
- drive_type: business
Keep this "onedrive" remote?
y) Yes this is OK (default)
e) Edit this remote
d) Delete this remote
y/e/d> y

Current remotes:

Name                 Type
====                 ====
onedrive             onedrive
```


## Copy files from remote to local

``` bash title="rclone copy remote->local"
# Copy all files from remote to local
rclone -v sync onedrive:/ /mnt/user/backup/onedrive
```