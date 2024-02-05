---
tags:
- os
- operating system
- linux
- ubuntu
---
# Installation and Config

## Installation

This installation is based on Ubuntu 18.4 LTS and ROS Melodic Morenia.

### Default Tools

``` bash
sudo apt install git curl vim openssh-server krename rar unrar kget diffutils kate x11vnc kdiff3
echo "Configure Firewall and Port for ssh"
sudo ufw allow ssh
sudo ufw enable
sudo ufw status
sudo service ssh restart
```

### ZSH

``` bash
sudo apt install zsh
sudo chsh -s /bin/zsh $USER
```

### Oh My ZSH

``` bash
cd ~/Downloads
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### SublimeText 3

``` bash
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text
```

### SublimeMerge

``` bash
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-merge
```

### Krusader

``` bash
sudo apt install krusader
```

### Yakuake

``` bash
sudo apt install yakuake
```

### FSearch

``` bash
sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-daily
sudo apt update
sudo apt install fsearch-trunk
```

### Anaconda

``` bash
cd ~/Downloads
sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
bash Anaconda3-2020.02-Linux-x86_64.sh
```

### QT-Creator

``` bash
cd ~/Downloads
wget http://download.qt.io/official_releases/qt/5.13/5.13.1/qt-opensource-linux-x64-5.13.1.run
chmod +x qt-opensource-linux-x64-5.13.1.run
./qt-opensource-linux-x64-5.13.1.run
sudo apt install build-essential
sudo apt install libfontconfig1
sudo apt install mesa-common-dev
sudo apt install libglu1-mesa-dev -y
```

### Visual Studio Code

``` bash
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders
```

## Configuration

### Oh My ZSH Config

``` bash title="~/.zshrc additions" linenums="1"
echo "#------------------------------------------------------------------------------" >> ~/.zshrc
echo "# Program in Path" >> ~/.zshrc
echo "#" >> ~/.zshrc
echo "#------------------------------------------------------------------------------" >> ~/.zshrc
echo "# Special zsh config" >> ~/.zshrc
echo "# Show hidden files and folders" >> ~/.zshrc
echo "setopt globdots" >> ~/.zshrc
echo "#------------------------------------------------------------------------------" >> ~/.zshrc
echo "# Goto Alias" >> ~/.zshrc
echo "# Common home locations" >> ~/.zshrc
echo "alias home='cd ~'" >> ~/.zshrc
echo "alias root='cd /'" >> ~/.zshrc
echo "alias dtop='cd ~/Desktop'" >> ~/.zshrc
echo "alias dwld='cd ~/Downloads'" >> ~/.zshrc
echo "alias docs='cd ~/Documents'" >> ~/.zshrc
echo "alias www='cd /var/www/html'" >> ~/.zshrc
echo "alias workspace='cd ~/Workspace'" >> ~/.zshrc
echo "alias aptlock-rm='sudo rm /var/lib/dpkg/lock && sudo rm /var/lib/dpkg/lock-frontend'" >> ~/.zshrc
echo "# Common commands" >> ~/.zshrc
echo "alias o=open" >> ~/.zshrc
echo "alias ..='cd ..'" >> ~/.zshrc
echo "alias ...='cd ..; cd ..'" >> ~/.zshrc
echo "alias ....='cd ..; cd ..; cd ..'" >> ~/.zshrc
echo "# Common command shortcuts" >> ~/.zshrc
echo "alias cls=clear" >> ~/.zshrc
echo "alias ll='ls -la'" >> ~/.zshrc
```

### SublimeText 3 Config

``` {.bash caption="~/.zshrc additions"}
echo "# Sublime Text" >> ~/.zshrc
echo "export PATH=$PATH:/opt/sublime_text" >> ~/.zshrc

echo "# Sublime Text" >> ~/.bashrc
echo "export PATH=$PATH:/opt/sublime_text" >> ~/.bashrc

cp ./../config/sublimetext/Package Control.sublime-settings ~/.config/sublime-text-3/Packages/User/
```

### SublimeMerge Config

``` {.bash caption="~/.zshrc additions"}
echo "#Sublime Merge" >> ~/.zshrc
echo "export PATH=$PATH:/opt/sublime_merge" >> ~/.zshrc

echo "#Sublime Merge" >> ~/.bashrc
echo "export PATH=$PATH:/opt/sublime_merge" >> ~/.bashrc
```

## How To Use Ubuntu Tools

### SSH

#### SSH connection without password

``` bash
# On your local machine generate a RSA Key pair
ssh-keygen -t rsa

# Copy your local public key to the remote machine safely
ssh-copy-id -i ~/.ssh/id_rsa.pub "<user>@<remoteip> -p <portnumber>"
# OR
scp id_rsa.pub <user>@<remoteip>:~/.ssh/machine.pub

# Append key to file authorized_keys
cat ~/.ssh/*.pub | ssh <user>@<remoteip> -p <portnumber> 'umask 077; cat >>.ssh/authorized_keys'
```

#### Open SSH Connection

``` bash
# Just ssh
ssh <user>@<remoteip>

# ssh with portforwarding
ssh -L <local-port>:localhost:<remote-port> <user>@<remoteip>
# ssh with vnc port forwarding
ssh -L 5900:localhost:5900 spl@<remoteip>
```

### VNC

On remote PC x11vnc needs to be installed and launched. Prefereable add
to startup commands

#### Create password

Only needed if not only localhost used.

``` bash
x11vnc -storepasswd
```

#### Launch x11vnc

``` bash
# Command with all options
x11vnc -usepw -forever -display :0 -safer -bg -o ~/Documents/log/vnc/x11vnc.log -localhost

# Minimal command but still restricted to localhost
x11vnc -forever -display :0 -safer -bg -localhost
```

### QView

Lightweight Image Viewer

``` bash
sudo add-apt-repository ppa:jurplel/qview
sudo apt update
sudo apt install qview
```
