---
tags:
- multimedia
- picture
- ascii
---

# ASCII-Art
```
  ___   _____ _____ _____ _____    ___  ______ _____
 / _ \ /  ___/  __ \_   _|_   _|  / _ \ | ___ \_   _|
/ /_\ \\ `--.| /  \/ | |   | |   / /_\ \| |_/ / | |
|  _  | `--. \ |     | |   | |   |  _  ||    /  | |
| | | |/\__/ / \__/\_| |_ _| |_  | | | || |\ \  | |
\_| |_/\____/ \____/\___/ \___/  \_| |_/\_| \_| \_/
```

Tools for creating ASCII-Art

- [ASCIIFlow](https://asciiflow.com/#/) ([github repo AsciiFlow](https://github.com/lewish/asciiflow))
- [Textik](https://textik.com/) ([github repo Textik](https://github.com/astashov/tixi))
- [ASCII-Art with PlantUML](https://plantuml.com/ascii-art)
- [AACircutiPy](https://github.com/Blokkendoos/AACircuit)

## RaspberryPi Headers

```
Pin 1 Pin2
+3V3 [ ] [ ] +5V
SDA1 / GPIO  2 [ ] [ ] +5V
SCL1 / GPIO  3 [ ] [ ] GND
GPIO  4 [ ] [ ] GPIO 14 / TXD0
GND [ ] [ ] GPIO 15 / RXD0
GPIO 17 [ ] [ ] GPIO 18
GPIO 27 [ ] [ ] GND
GPIO 22 [ ] [ ] GPIO 23
+3V3 [ ] [ ] GPIO 24
MOSI / GPIO 10 [ ] [ ] GND
MISO / GPIO  9 [ ] [ ] GPIO 25
SCLK / GPIO 11 [ ] [ ] GPIO  8 / CE0#
GND [ ] [ ] GPIO  7 / CE1#
ID_SD / GPIO  0 [ ] [ ] GPIO  1 / ID_SC
GPIO  5 [ ] [ ] GND
GPIO  6 [ ] [ ] GPIO 12
GPIO 13 [ ] [ ] GND
MISO / GPIO 19 [ ] [ ] GPIO 16 / CE2#
GPIO 26 [ ] [ ] GPIO 20 / MOSI
GND [ ] [ ] GPIO 21 / SCLK
Pin 39 Pin 40
```

## Arduino

```
+-----+
+----[PWR]-------------------| USB |--+
|                            +-----+  |
|         GND/RST2  [ ][ ]            |
|       MOSI2/SCK2  [ ][ ]  A5/SCL[ ] |   C5
|          5V/MISO2 [ ][ ]  A4/SDA[ ] |   C4
|                             AREF[ ] |
|                              GND[ ] |
| [ ]N/C                    SCK/13[ ] |   B5
| [ ]IOREF                 MISO/12[ ] |   .
| [ ]RST                   MOSI/11[ ]~|   .
| [ ]3V3    +---+               10[ ]~|   .
| [ ]5v    -| A |-               9[ ]~|   .
| [ ]GND   -| R |-               8[ ] |   B0
| [ ]GND   -| D |-                    |
| [ ]Vin   -| U |-               7[ ] |   D7
|          -| I |-               6[ ]~|   .
| [ ]A0    -| N |-               5[ ]~|   .
| [ ]A1    -| O |-               4[ ] |   .
| [ ]A2     +---+           INT1/3[ ]~|   .
| [ ]A3                     INT0/2[ ] |   .
| [ ]A4/SDA  RST SCK MISO     TX>1[ ] |   .
| [ ]A5/SCL  [ ] [ ] [ ]      RX<0[ ] |   D0
|            [ ] [ ] [ ]              |
|  UNO_R3    GND MOSI 5V  ____________/
\_______________________/
```

## Mando and Baby Yoda

```
_
[T]
| |√  <••>
( )   (  )
```

## Logic

```
=D-
```

```
--pad_rst----+----------+----------+
          +--+--+    +--+--+    +--+--+    +-.
--'1'-----|D   Q|----|D   Q|----|D   Q|----|  >O-----rst
          |     |    |     |    |     |    +-´
       +--|>    | +--|>    | +--|>    |
       |  +-----+ |  +-----+ |  +-----+
--clk--+----------+----------+
```

## Timing Diagrams

```
Mode 0
             _   _   ____________________   _   _
 input  ____/ \ / \ /                    \_/ \ / \______
             _________________________________________
 output ____/                                         \_

Mode 1
             _   _   ____________________   _   _
 input  ____/ \ / \ /                    \_/ \ / \______
                          _______________
 output _________________/               \______________
```

```
Mode = 0 (reactive on rising edge)
             ___________________________________________
 input  ____/
             ___________________
 output ____/                   \_______________________
 time   0s                    0.5s                    1s

             _
 input  ____/ \_________________________________________
             ___________________
 output ____/                   \_______________________
 time   0s                    0.5s                    1s

Mode = 1 (reactive on falling edge)
        _____
 input       \__________________________________________
               ___________________
 output ______/                   \_____________________
 time   0s                    0.5s                    1s

             _
 input  ____/ \_________________________________________
                ___________________
 output ______ /                   \____________________
 time   0s                    0.5s                    1s
```

## Analog Signal

```
^
|.-.   .-.   .-.   .-.   .-.   .  netdata                          .-.   .-
|   '-'   '-'   '-'   '-'   '-'   is installed and running now!  -'   '-'
+----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+--->
```

## Cowsay

The linux tool cowsay allows to dynamically create ASCII-Art. Install it
via the following command:

``` bash
sudo apt install cowsay
```

**Some examples**

```
$ cowsay Answer to everything is 42
 ____________________________
< Answer to everything is 42 >
 ----------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

$ cowsay -f sheep Answer to everything is 42
 ____________________________
< Answer to everything is 42 >
 ----------------------------
  \
   \
       __
      UooU\.'@@@@@@`.
      \__/(@@@@@@@@@@)
           (@@@@@@@@)
           `YY~~~~YY'
            ||    ||

$ cowsay -f bud-frogs Answer to everything is 42
 ____________________________
< Answer to everything is 42 >
 ----------------------------
     \
      \
          oO)-.                       .-(Oo
         /__  _\                     /_  __\
         \  \(  |     ()~()         |  )/  /
          \__|\ |    (-___-)        | /|__/
          '  '--'    ==`-'==        '--'  '

$ cowsay -f ghostbusters Answer to everything is 42
 ____________________________
< Answer to everything is 42 >
 ----------------------------
          \
           \
            \          __---__
                    _-       /--______
               __--( /     \ )XXXXXXXXXXX\v.
             .-XXX(   O   O  )XXXXXXXXXXXXXXX-
            /XXX(       U     )        XXXXXXX\
          /XXXXX(              )--_  XXXXXXXXXXX\
         /XXXXX/ (      O     )   XXXXXX   \XXXXX\
         XXXXX/   /            XXXXXX   \__ \XXXXX
         XXXXXX__/          XXXXXX         \__---->
 ---___  XXX__/          XXXXXX      \__         /
   \-  --__/   ___/\  XXXXXX            /  ___--/=
    \-\    ___/    XXXXXX              '--- XXXXXX
       \-\/XXX\ XXXXXX                      /XXXXX
         \XXXXXXXXX   \                    /XXXXX/
          \XXXXXX      >                 _/XXXXX/
            \XXXXX--__/              __-- XXXX/
             -XXXXXXXX---------------  XXXXXX-
                \XXXXXXXXXXXXXXXXXXXXXXXXXX/
                  ""VXXXXXXXXXXXXXXXXXXV""
```

a cowfile can be manually added on the folder `/usr/share/cowsay/cows`,
loaded by default are the following graphics: `apt` `bud-frogs` `bunny`
`calvin` `cheese` `cock` `cower` `daemon` `default` `dragon`
`dragon-and-cow` `duck` `elephant` `elephant-in-snake` `eyes`
`flaming-sheep` `ghostbusters` `gnu` `hellokitty` `kiss` `koala` `kosh`
`luke-koala` `mech-and-cow` `milk` `moofasa` `moose` `pony`
`pony-smaller` `ren` `sheep` `skeleton` `snowman` `stegosaurus` `stimpy`
`suse` `three-eyes` `turkey` `turtle` `tux` `unipony` `unipony-smaller`
`vader` `vader-koala` `www`

## Images

```
/\
/**\
/****\   /\
/      \ /**\
/  /\    /    \        /\    /\  /\      /\            /\/\/\  /\
/  /  \  /      \      /  \/\/  \/  \  /\/  \/\  /\  /\/ / /  \/  \
/  /    \/ /\     \    /    \ \  /    \/ /   /  \/  \/  \  /    \   \
/  /      \/  \/\   \  /      \    /   /    \
__/__/_______/___/__\___\_______        ______
                             /     /\
                            /     /  \
                           /_____/----\_    (
                          "     "          ).
                         _ ___          o (:') o
                        (@))_))        o ~/~~\~ o
                                        o  o  o
```

```
.==.        .==.
//`^\\      //^`\\
// ^ ^\(\__/)/^ ^^\\
//^ ^^ ^/6  6\ ^^ ^ \\
//^ ^^ ^/( .. )\^ ^ ^ \\
// ^^ ^/\| v""v |/\^ ^ ^\\
// ^^/\/ /  `~~`  \ \/\^ ^\\
-----------------------------
HERE BE DRAGONS
```

```
\          SORRY            /
 \                         /
  \    This page does     /
   ]   not exist yet.    [    ,'|
   ]                     [   /  |
   ]___               ___[ ,'   |
   ]  ]\             /[  [ |:   |
   ]  ] \           / [  [ |:   |
   ]  ]  ]         [  [  [ |:   |
   ]  ]  ]__     __[  [  [ |:   |
   ]  ]  ] ]\ _ /[ [  [  [ |:   |
   ]  ]  ] ] (#) [ [  [  [ :===='
   ]  ]  ]_].nHn.[_[  [  [
   ]  ]  ]  HHHHH. [  [  [
   ]  ] /   `HH("N  \ [  [
   ]__]/     HHH  "  \[__[
   ]         NNN         [
   ]         N/"         [
   ]         N H         [
  /          N            \
 /           q,            \
/                           \
```

```
áááááááááááááááááááááááááááááááááá /\
ááááááááááááááááááááááááááááá /\á //\\
áááááááááááááááááááááá /\ááá //\\///\\\ááááááá /\
ááááááááááááááááááááá //\\á ///\////\\\\á /\á //\\
áááááááá /\ááááááááá /á ^ \/^ ^/^á ^á ^ \/^ \/á ^ \
ááááááá / ^\ááá /\á / ^áá /á ^/ ^ ^ ^áá ^\ ^/á ^^á \
áááááá /^áá \á / ^\/ ^ ^áá ^ / ^á ^ááá ^á \/ ^áá ^á \áááááá *
ááááá /á ^ ^ \/^á ^\ ^ ^ ^áá ^á ^áá ^áá ____á ^áá ^á \áááá /|\
áááá / ^ ^á ^ \ ^á _\___________________|á |_____^ ^á \áá /||o\
ááá / ^^á ^ ^ ^\á /______________________________\ ^ ^ \ /|o|||\
áá /á ^á ^^ ^ ^á /________________________________\á ^á /|||||o|\
á /^ ^á ^ ^^á ^ááá ||___|___||||||||||||___|__|||ááááá /||o||||||\áá
á/ ^áá ^áá ^ááá ^á ||___|___||||||||||||___|__|||ááááááááá | |áááááá
/ ^ ^ ^á ^á ^á ^áá ||||||||||||||||||||||||||||||oooooooooo| |ooooooo
ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
```

## Animation

```
-\|/-\|/
⠁⠂⠄⡀⢀⠠⠐⠈
⣾⣽⣻⢿⡿⣟⣯⣷
```

## Keyboard

```
,---------------. ,---------------. ,---------------.               ,---------------.
|F13|F14|F15|F16| |F17|F18|F19|F20| |F21|F22|F23|F24|               |Sto|Pre|Pla|Nex|
,---.   |---------------| |---------------| |---------------| ,-----------. ,---------------. ,-------.
|Esc|   |F1 |F2 |F3 |F4 | |F5 |F6 |F7 |F8 | |F9 |F10|F11|F12| |PrS|ScL|Pau| |VDn|VUp|Mut|Pwr| | Help  |
`---'   `---------------' `---------------' `---------------' `-----------' `---------------' `-------'
,-----------------------------------------------------------. ,-----------. ,---------------. ,-------.
| § | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | ' | ^ |Backspc| |Ins|Hom|PgU| |NmL| / | * | - | |Stp|Agn|
|-----------------------------------------------------------| |-----------| |---------------| |-------|
|Tab  | Q | W | E | R | T | Z | U | I | O | P | ü | ¨ |     | |Del|End|PgD| | 7 | 8 | 9 |   | |Mnu|Und|
|-----------------------------------------------------\ Retn| `-----------' |-----------| + | |-------|
|CapsL | A | S | D | F | G | H | J | K | L | ö | ä | $ |    |               | 4 |  5| 6 |   | |Sel|Cpy|
|-----------------------------------------------------------|     ,---.     |---------------| |-------|
|Shift| < | Y | X | C | V | B | N | M | , | . | - |  ShiftR |     |Up |     | 1 | 2 | 3 |   | |Exe|Pst|
|-----------------------------------------------------------| ,-----------. |-----------|Ent| |-------|
|CtrlL|Sup|AltL|          Space          |AltR|Sup|ClR|CtrlR| |Lef|Dow|Rig| |  0    | . |   | |Fnd|Cut|
`-----------------------------------------------------------' `-----------' `---------------' `-------'
```