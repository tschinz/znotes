---
tags:
- os
- operating system
- windows
- registry
---
# Registry

## Login

``` bat
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
```

For Autologin use the following entries

``` bat
AutoAdminLogon = "1"
DefaultUserName = <Username>
DefaultPassword = <Password>
```

## DateTime

``` bat
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers
```

## Shell Overlay Icons

``` bat
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers
```

## Context Menu

``` bat
Computer\HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers
```

## New Context Menu

``` bat
Computer\HKEY_CLASSES_ROOT\
```

## SAP Shortcut Password

``` bat
Computer\HKEY_CURRENT_USER\Software\SAP\SAPShortcut\Security
```

## PowerPoint Options

``` bat
Computer\HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\PowerPoint\Options
  :: ExportBitmapResolution => DWORD 32bit => 300 (ppi)
  :: AutomaticPicturesCompressionDefault => DWORD => 0
```

## Power Settings

``` bat
Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power
  :: HibernateEnabledDefault = 0
```

## Taskbar Transparency

``` bat
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced
  :: UseOLEDTaskbarTransparency => DWORD 32bit => 1
```