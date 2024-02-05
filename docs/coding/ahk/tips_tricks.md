---
tags:
- coding
- ahk
---
# Tips & Tricks

My ahk scripts can be found in the [config repo]({{config_repo_folder}}/scripts/ahk)

## Comment

``` ahk
;------------
;-- Comment
;--
```

## Performance and Compatility

``` ahk
; Recommended for performance and compatibility with future AutoHotkey releases
#NoEnv
```

## Warnings

``` ahk
; Enable warnings to assist with detecting common errors
#Warn
```

## Enable Regex for Title mach Mode

``` ahk
SetTitleMatchMode,RegEx ; then
IfWinExist, Total Commander.*
```

## Tray Icon and ToolTip

``` ahk
Menu, TRAY, Icon, Favicon.ico
Menu, TRAY, Tip, Tooltip Text
```

## Examples

### For Win10 Hibernate

``` ahk
; Wait for Hotkey
;   Ctrl + Win + Alt + l
; Send Hotkey
;   Ctrl + Win + x + u + s
^#<!l::Send #xuh
```

### For Win10 Sleep

``` ahk
; Wait for Hotkey
;   Ctrl + Win + l
; Send Hotkey
;   Win + x + u + s
^#l::Send #xus
```

### Home and End Hotkey

``` ahk
; Ctrl + Left
^Left::Send {Home}
; Ctrl + Right
^Right::Send {End}
```

## Check for AHK Version and output message

``` ahk
If (A_AhkVersion < "1.0.39.00")
{
    MsgBox,20,,This script may not work properly with your version of AutoHotkey. Continue?
    IfMsgBox,No
    ExitApp
}
```

## Supend a script via Hotkey

``` ahk
f1::suspend
```