#!/bin/bash
#-------------------------------------------------------------------------------
# Get and set execution directory
#
base_directory="$(dirname "$(readlink -f "$0")")"
pushd $base_directory
base_directory="$base_directory"

SEPARATOR='--------------------------------------------------------------------------------'
INDENT='  '

echo "$SEPARATOR"
echo "-- ${0##*/} Started!"
echo ""

#-------------------------------------------------------------------------------
# Configuration
#
echo "Ubuntu base install setting configuration"
name_os_version=${name_os_version:="bionic"}
install_general=true
install_zsh=false
install_sublimetext=true
install_sublimemerge=true
install_krusader=true
install_yakuake=true
install_fsearch=true
install_anaconda=true
install_qtcreator=true
install_visualstudiocode=true

echo "Configuration"
echo "$INDENT Target OS version  : Ubuntu $name_os_version"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

#-------------------------------------------------------------------------------
# Script
#
echo "Update the package lists and upgrade them"
sudo apt-get update -y
sudo apt-get upgrade -y

if [ "$install_zsh" = true ] ; then
  sudo apt-get install git curl vim openssh-server krename rar unrar kget diffutils kate inkscape gimp
  echo "Configure Firewall and Port for ssh"
  sudo ufw allow ssh
  sudo ufw enable
  sudo ufw status
  sudo service ssh restart

  # install qview
  sudo add-apt-repository ppa:jurplel/qview
  sudo apt-get install qview
fi

if [ "$install_zsh" = true ] ; then
  echo "Install Zsh"
  sudo apt-get install zsh
  sudo chsh -s /bin/zsh $USER

  echo "Install Oh my Zsh"
  cd ~/Downloads
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  echo "Launch Zsh"

  echo "Add Config"
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
  zsh
fi

echo "Install SublimeText 3 & Sublime Merge"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
if [ "$install_sublimetext" = true ] ; then
  echo "Install SublimeText 3"
  sudo apt-get install sublime-text
fi

if [ "$install_sublimemerge" = true ] ; then
  sudo apt-get install sublime-merge
fi

if [ "$install_krusader" = true ] ; then
  echo "Install Krusader"
  sudo apt-get install krusader
fi

if [ "$install_yakuake" = true ] ; then
  echo "Install Yakuake"
  sudo apt-get install yakuake
fi

if [ "$install_fsearch" = true ] ; then
  echo "Install Fsearch"
  sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-daily
  sudo apt update
  sudo apt-get install fsearch-trunk
fi

if [ "$install_anaconda" = true ] ; then
  echo "Install Anaconda"
  cd ~/Downloads
  wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
  bash Anaconda3-2019.10-Linux-x86_64.sh
fi

if [ "$install_qtcreator" = true ] ; then
  echo "Install QT Creator"
  cd ~/Downloads
  wget http://download.qt.io/official_releases/qt/5.13/5.13.1/qt-opensource-linux-x64-5.13.1.run
  chmod +x qt-opensource-linux-x64-5.13.1.run
  ./qt-opensource-linux-x64-5.13.1.run
  sudo apt-get install build-essential
  sudo apt-get install libfontconfig1
  sudo apt-get install mesa-common-dev
  sudo apt-get install libglu1-mesa-dev -y
fi

if [ "$install_visualstudiocode" = true ] ; then
  echo "Install Visual Studio Code"
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
  sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

  sudo apt-get install apt-transport-https
  sudo apt-get update
  sudo apt-get install code # or code-insiders
fi

if [ -n "$ZSH_VERSION" ]; then
  source $HOME/.zshrc
fi

#-------------------------------------------------------------------------------
# Exit
#
echo ""
echo "-- ${0##*/} Finished!"
echo "$SEPARATOR"

exit 0
