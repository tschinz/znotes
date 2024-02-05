---
tags:
- coding
- ros
- install
---
# Installation
## How to install ROS

This installation is based on Ubuntu 18.4 LTS and ROS Melodic Morenia.

### Prerequisites

Some tools are not mandatory.

#### NTP

Only needed in a multi-pc system.

``` bash
echo "Install Chrony and ntpdate"
sudo apt-get install -y chrony ntpdate
sudo ntpdate -q ntp.ubuntu.com
```

#### Sources

ROS Ubunbtu apt-get packages sources.

``` bash
echo "Add ROS Package Sources"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
```

Ubuntu 18.04 LTS (Bionic Beaver)

``` bash
echo "Add ROS Package Sources for Ubuntu 18.04 LTS Bionic Beaver"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
```

#### Keys

- [ROS Kinetic](https://wiki.ros.org/kinetic/Installation/Ubuntu)
- [ROS Melodic](https://wiki.ros.org/melodic/Installation/Ubuntu)

``` bash
echo "Add ROS Package Key"
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
```

### ROS Base

``` bash
echo "Install ROS Base Desktop Full"
sudo apt-get install ros-melodic-desktop-full
```

### ROS Additional Packages

#### RQT

``` bash
echo "Install ROS R-QT"
sudo apt-get install ros-melodic-rqt*
```

#### Individual ROS packages

Search & install individual ROS packages

``` bash
echo "Install ROS R-QT"
apt-cache search ros-melodic
sudo apt-get install ros-melodic-[NAME_OF_PACKAGE]
```

### Setup ROS Environment

#### Initialise rosdep

``` bash
echo "[Initialize rosdep]"
sudo sh -c "rosdep init"
rosdep update
```

#### Environment setup

Differs depending if it's zsh or bash

``` bash
echo "[Environment setup and getting rosinstall]"
if [ -n "$ZSH_VERSION" ]; then
   # assume Zsh
  source /opt/ros/$name_ros_version/setup.zsh
elif [ -n "$BASH_VERSION" ]; then
  # assume Bash
  source /opt/ros/$name_ros_version/setup.sh
fi
```

#### ROS Install

``` bash
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool
```

#### Create catkin workspace

``` bash
echo "[Make the catkin workspace and test the catkin_make]"
mkdir -p $HOME/$name_catkin_workspace/src
cd $HOME/$name_catkin_workspace/src
catkin_init_workspace
cd $HOME/$name_catkin_workspace
catkin_make
```

### Shell Scripts

All the above can be done with help of the [ros-melodic-install.bash]({{config_repo_file}}/scripts/ros-melodic-install.bash)

### Additional Install

#### Hitachi SDK

``` bash
cd ~/Downloads
echo "$INDENT Manually download http://hlds.co.jp/download/tofsdk/v2.3.0/HldsTofSdk.2.3.0ubuntu16_x64.zip into your Downloads/ folder"
echo ""
echo "PRESS [ENTER] WHEN YOU'RE FINISHED AND TO CONTINUE THE INSTALLATION"
read
mkdir HldsTofSdk.2.3.0ubuntu16_x64
unzip HldsTofSdk.2.3.0ubuntu16_x64.zip -d ./HldsTofSdk.2.3.0ubuntu16_x64
sudo apt install HldsTofSdk.2.3.0ubuntu16_x64/libtof-dev_2.3.0-4ubuntu16_amd64.deb
```

## Configuration

### ROS Configuration

#### `.bashrc`

``` bash
echo "[Set the ROS evironment in ~/.bashrc]"
echo "alias eb='vim ~/.bashrc'" >> ~/.bashrc
echo "alias sb='source ~/.bashrc'" >> ~/.bashrc
echo "alias gs='git status'" >> ~/.bashrc
echo "alias gp='git pull'" >> ~/.bashrc
echo "alias cw='cd ~/$name_catkin_workspace'" >> ~/.bashrc
echo "alias cs='cd ~/$name_catkin_workspace/src'" >> ~/.bashrc
echo "alias cm='cd ~/$name_catkin_workspace && catkin_make'" >> ~/.bashrc

echo "source /opt/ros/$name_ros_version/setup.bash" >> ~/.bashrc
echo "source ~/$name_catkin_workspace/devel/setup.bash" >> ~/.bashrc

echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc
echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc
```

#### `.zshrc`

``` bash
echo "[Set the ROS evironment in ~/.zshrc]"
echo "alias eb='vim ~/.zshrc'" >> ~/.zshrc
echo "alias sb='source ~/.zshrc'" >> ~/.zshrc
echo "alias gs='git status'" >> ~/.zshrc
echo "alias gp='git pull'" >> ~/.zshrc
echo "alias cw='cd ~/$name_catkin_workspace'" >> ~/.zshrc
echo "alias cs='cd ~/$name_catkin_workspace/src'" >> ~/.zshrc
echo "alias cm='cd ~/$name_catkin_workspace && catkin_make'" >> ~/.zshrc

echo "source /opt/ros/$name_ros_version/setup.zsh" >> ~/.zshrc
echo "source ~/$name_catkin_workspace/devel/setup.zsh" >> ~/.zshrc

echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.zshrc
echo "export ROS_HOSTNAME=localhost" >> ~/.zshrc
```

### ROS Test

``` bash
roscore
```