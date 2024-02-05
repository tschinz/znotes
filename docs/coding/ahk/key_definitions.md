---
tags:
- coding
- ahk
---
# Key Definitions

## Raw Keys

``` ahk
^  ; Ctrl
#  ; Win
<# ; Left Win
># ; Right Win
!  ; Alt
>! ; Right Altt
<! ; Left Alt
+  ; Shift
>+ ; Right Shift
<+ ; Left Shift
^  ; Control
<^ ; Left Control
>^ ; Right Control
; Multimedia
{Volume_Up}
{Volume_Down}
{Volume_Mute}
```

## Double Keypress Detection

Alt Key in the example

``` ahk
~Alt::
DoubleAlt := A_PriorHotkey ="~Alt" AND A_TimeSincePriorHotkey < 400
Sleep 0
KeyWait Alt  ; This prevents the keyboard's auto-repeat feature from interfering.
return
```