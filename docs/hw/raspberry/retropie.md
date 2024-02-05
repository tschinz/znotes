---
tags:
- hardware
- raspberry pi
- retropie
---
# Retropie
![](img/retropie_icon.svg){.center width="20.0%"}

## Default config

User: `pi` Password: `raspberry`

## Hotkeys

| Hotkey            | Description |
| ------------------| ---------------- |
| `Select` `Start`  | Exit Game |
| `F4`              | Enter Terminal |

## Important Files
SSH Config
``` bash
/etc/ssh/sshd_config
```

Roms
``` bash
~/RetroPie/roms
```

Emulationstation
``` bash
# ES Settings
~/.emulationstation/
/opt/retropie/configs/all/emulationstation/

# System
~/.emulationstation/es_systems.cfg
/etc/emulationstation/es_systems.cfg

# Platform Config
/opt/retropie/configs/all/platforms.cfg

# Controller Config
~/.emulationstation/es_input.cfg

# Themes
 ~/.emulationstation/themes
 /etc/emulationstation/themes
```

## Todo After Install

1. Change Keyboard Layout

    `raspi-config` `4. Localisation Options` `I3 Change Keyboard Layout`

2. Change default password of user `pi`

    ``` bash
    passwd
    ```

3. Change default password of user `root`

    ``` bash
    sudo passwd root
    ```

4. Enable SSH

    `raspi-config` `4. Localisation Options` `I3 Change Keyboard Layout`

5. Enable SSH Root access

    ``` bash
    echo 'PermitRootLogin yes' | sudo tee -a /etc/ssh/sshd_config
    ```

6. Change Wifi Country

    `raspi-config` `4. Localisation Options` `I4 Change Wifi Country`

7. Expand Filesystem

    `raspi-config` `7. Advanced Options` `A1 Expand Filesystem`

8. Install Safe Shutdown (in case of a NESPi 4 Case)

    ``` bash
    wget -O - "https://raw.githubusercontent.com/RetroFlag/retroflag-picase/master/install.sh" | sudo bash
    ```

9. Enable XBox Controller via Bluethooth

    ``` bash
    echo 'options bluetooth disable_ertm=Y' | sudo tee -a  /etc/modprobe.d/bluetooth.conf
    ```

    Setting to connect the XBox Controller is `Display Yes No`

10. Configure all Gamepads

11. Install Theme to `pixels` at set it under `UI Settings` in RetroArch

12. Install additional packages

    RetroPie Setup `opt` `dosbox` `frotz` `scummvm` `kodi`

13. Install RetroPie-Extras

    ``` {.bash caption="install"}
    cd ~
    git clone https://github.com/zerojay/RetroPie-Extra.git
    cd RetroPie-Extra/
    ./install-extras.sh
    ```
    ``` bash
    cd ~
    cd RetroPie-Setup/
    sudo ./retropie_setup.sh
    ```

14. Update RetroPie and underlying Raspian Options

    RetroPie-Setup `Update`

15. Install EmulationStation Theme `pixel`

    - RetroPie-Setup `814 esthemes` `12 Install ehettervik/pixel`
    - Set Settings `UI Settings` `Theme Set` `Pixel`
    - Set Settings `UI Settings` `Transition Style` `Instant`

16. Copy all Roms to location `~/Retropie/roms/`
17. Restart System