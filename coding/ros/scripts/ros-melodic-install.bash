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
echo "Set the target OS, ROS version and name of catkin workspace"
name_os_version=${name_os_version:="bionic"}
name_ros_version=${name_ros_version:="melodic"}
name_catkin_workspace=${name_catkin_workspace:="work/ros/catkin_ws"}
echo "Configuration"
echo "$INDENT Target OS version  : Ubuntu $name_os_version"
echo "$INDENT Target ROS version : ROS $name_ros_version"
echo "$INDENT Catkin workspace   : $HOME/$name_catkin_workspace"
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

echo "Install build environment, the chrony, ntpdate and set the ntpdate"
sudo apt install -y chrony ntpdate build-essential
sudo ntpdate ntp.ubuntu.com

echo "Add the ROS repository"
if [ ! -e /etc/apt/sources.list.d/ros-latest.list ]; then
  sudo sh -c "echo "deb http://packages.ros.org/ros/ubuntu ${name_os_version} main" > /etc/apt/sources.list.d/ros-latest.list"
fi

echo "Download the ROS keys"
roskey=`apt-key list | grep "Open Robotics"`
if [ -z "$roskey" ]; then
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
fi

echo "Check the ROS keys"
roskey=`apt-key list | grep "Open Robotics"`
if [ -n "$roskey" ]; then
  echo "$INDENT ROS key exists in the list"
else
  echo "$INDENT Failed to receive the ROS key, aborts the installation"
  exit 0
fi

echo "Update the package lists and upgrade them"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "Install the ros-desktop-full and all rqt plugins"
sudo apt install -y ros-$name_ros_version-desktop-full ros-$name_ros_version-rqt-*

echo "Initialize rosdep"
sudo sh -c "rosdep init"
rosdep update

echo "Environment setup and getting rosinstall"
if [ -n "$ZSH_VERSION" ]; then
   # assume Zsh
  source /opt/ros/$name_ros_version/setup.zsh
elif [ -n "$BASH_VERSION" ]; then
  # assume Bash
  source /opt/ros/$name_ros_version/setup.sh
fi
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool

echo "Make the catkin workspace and test the catkin_make"
mkdir -p $HOME/$name_catkin_workspace/src
cd $HOME/$name_catkin_workspace/src
catkin_init_workspace
cd $HOME/$name_catkin_workspace
catkin_make

echo "Set the ROS evironment in ~/.bashrc"
echo "#------------------------------------------------------------------------------" >> ~/.bashrc
echo "# ROS Configuration" >> ~/.bashrc
echo "alias eb='vim ~/.bashrc'" >> ~/.bashrc
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

if [ -n "$BASH_VERSION" ]; then
  source $HOME/.bashrc
fi

echo "Set the ROS evironment in ~/.zshrc"
echo "#------------------------------------------------------------------------------" >> ~/.zshrc
echo "ROS Configuration" >> ~/.zshrc
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
