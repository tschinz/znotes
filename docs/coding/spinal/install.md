---
tags:
- coding
- spinal hdl
- hdl
---
# Installation

## Tools

The following tools are needed:

- [tools intro](./tools/index.md)
- [intellij_idea](./tools/intellij_idea.md)

# Linux

For Linux there is also a complete [spinal-install.bash]({{config_repo_file}}/scripts/linux-install/spinal-install.bash) script available.

``` bash
chmod +x install-spinal.bash
./install-spinal.bash
```

### Base Tools

``` bash linenums="1"
sudo apt install -y git make autoconf g++ flex bison
sudo apt install -y openjdk-8-jdk
sudo apt install -y scala
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt update -y
sudo apt install -y sbt
```

### IDE

``` bash
sudo snap install intellij-idea-community --classic
```

### Simulation

``` bash linenums="1"
cd ~
git clone http://git.veripool.org/git/verilator
unset VERILATOR_ROOT
cd verilator
git pull        # Make sure we're up-to-date
git checkout verilator_3_916
autoconf        # Create ./configure script
./configure
make -j$(nproc)
sudo make install
sudo apt install -y gconf2 gtkwave
```

### Hardware Debug Tools

``` bash
sudo apt install -y openocd
```

### RiscV Development Tools

``` bash
wget https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-20171231-x86_64-linux-centos6.tar.gz
tar -xzvf riscv64-unknown-elf-gcc-20171231-x86_64-linux-centos6.tar.gz
sudo mv riscv64-unknown-elf-gcc-20171231-x86_64-linux-centos6 /opt/riscv64-unknown-elf-gcc-20171231-x86_64-linux-centos6
sudo mv /opt/riscv64-unknown-elf-gcc-20171231-x86_64-linux-centos6 /opt/riscv
echo 'export PATH=/opt/riscv/bin:$PATH' >> ~/.bashrc
echo 'export PATH=/opt/riscv/bin:$PATH' >> ~/.zshrc
```

### Optional Dev Tools

``` bash linenums="1"
echo "Install default tools"
sudo apt install -y zsh
sudo chsh -s /bin/zsh $USER
cd ~/Downloads
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo apt install -y yakuake krusader

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-text sublime-merge

sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-daily
sudo apt update
sudo apt install -y fsearch-trunk
```

## macOS

### Base Tools

- Install [homebrew](https://brew.sh)
- Install [Java 8](https://www.azul.com/downloads/?package=jdk)

Install base cmdline tools

``` bash linenums="1"
brew install git gcc make autoconf flex bison
brew install scala sbt
```

### IDE

- Install [Visual Studio Code](https://code.visualstudio.com)
  - Install scala plugin
  - Install sbt plugin
  - Install scala metal language server plugin

### Simulation

``` bash linenums="1"
brew install verilator gtkwave
```

In order to gtkwave to run correctly perl Switch needs to be installed

``` bash linenums="1"
cpan install Switch
perl -V:'installsitelib'
```

Perl Switch needs to be liked to the default perl install location. The at the end of the above command the install location is given, it should be similar to:

``` bash linenums="1"
sudo ln -s ~/perl5/lib/perl5/Switch.pm /Library/Perl/5.*
```

Link the gtkwave to the correct binary with **one** of the two commands.

``` bash linenums="1"
alias gktwave=/Applications/gtkwave.app/Contents/Resources/bin/gtkwave
export PATH=/Applications/gtkwave.app/Contents/Resources/bin/:$PATH
```

### Hardware Debug Tools

``` bash linenums="1"
brew install openocd
```

## Windows
### Base Tools

- Install [Java](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- Install [Scala Build Tool SBT](https://www.scala-sbt.org/download.html)

### IDE

- Install [IntelliJ IDEA](https://www.jetbrains.com/idea/download/)
  - Within IntelliJ install Scala Plugin
  - Remove settings for Code Checking

### Simulation

- Install [MSYS2 64bit](https://www.msys2.org/)
- Install verilator from minGW packet manager
  ``` bash linenums="1" title="Verilator Installation"
  pacman -Syuu

  # Close the MSYS2 shell once you're asked to
  pacman -Syuu
  pacman -S --needed base-devel mingw-w64-x86_64-toolchain \
                git flex\
                mingw-w64-x86_64-cmake

  pacman -S mingw-w64-x86_64-verilator
  ```
- ADD MSYS2 `C:\msys64\usr\bin;C:\msys64\mingw64\bin` to your Environment Variable `Path`.

### Hardware Debug Tools

- Install [OpenOCD](http://www.freddiechopin.info/en/download/category/4-openocd) for JTAG debugging.
