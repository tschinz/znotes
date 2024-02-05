---
tags:
- os
- operating system
- linux
- ubuntu
---
# Problems

How to fix problems I've encountered.

## Perl locale warning

``` bash title="perl locale warning"
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
        LANGUAGE = "",
        LC_ALL = (unset),
        LC_TIME = "de_CH.UTF-8",
        LC_MONETARY = "de_CH.UTF-8",
        LC_COLLATE = "de_CH.UTF-8",
        LC_ADDRESS = "en_US.UTF-8",
        LC_TELEPHONE = "en_US.UTF-8",
        LC_NAME = "en_US.UTF-8",
        LC_MEASUREMENT = "de_CH.UTF-8",
        LC_IDENTIFICATION = "en_US.UTF-8",
        LC_NUMERIC = "de_CH.UTF-8",
        LC_PAPER = "en_US.UTF-8",
        LANG = "C"
    are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").
```

``` bash title="Solution"
sudo locale-gen en_US.UTF-8
sudo locale-gen de_CH.UTF-8
```

## bracketed paste mode

bracketed paste mode enabled addes characters on paste

``` bash title="added characters onpaste in terminal"
^[[200~...~
```

``` bash title="disable bracketed mode"
# in Terminal temporarily
bind 'set enable-bracketed-paste off'

# permanentely
echo 'Disable bracketed mode' >> /etc/inputrc
echo 'set enable-bracketed-paste off' >> /etc/inputrc

# or add this in the bashrc?
echo 'bracketed mode fix' >> ~/.bashrc
echo 'printf "\e[?2004l"' >> ~/.bashrc
echo 'bracketed mode fix' >> ~/.zshrc
echo 'printf "\e[?2004l"' >> ~/.zshrc
```