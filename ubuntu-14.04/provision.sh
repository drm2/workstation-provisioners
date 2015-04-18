#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Execute the Fix Ubuntu script to ensure additional privacy.
./fixubuntu.sh

# Retrieve and extract Consolas because it is my favorite programming font.
./consolas.sh

# Update software channel listings
sudo apt-get update
# OS updates
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# Install "base" packages ######################################################

# Accept the ttf-mscorefonts-installer EULA ahead of time
sudo debconf-set-selections <<< "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true"
sudo apt-get install -y xubuntu-desktop ubuntu-restricted-extras unity-tweak-tool gnome-tweak-tool

# Switch Plymouth theme from Xubuntu to default 
sudo update-alternatives --set default.plymouth /lib/plymouth/themes/ubuntu-logo/ubuntu-logo.plymouth
sudo update-initramfs -u

# Install packages from third party software channels ##########################
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:webupd8team/brackets
sudo apt-add-repository -y ppa:remmina-ppa-team/remmina-next
sudo add-apt-repository -y ppa:jerzy-kozera/zeal-ppa
sudo add-apt-repository -y ppa:ondrej/php5
sudo add-apt-repository -y ppa:minecraft-installer-peeps/minecraft-installer
# The following two install a custom libnotify-bin and configuration tool
sudo add-apt-repository -y ppa:leolik/leolik
sudo add-apt-repository -y ppa:amandeepgrewal/notifyosdconfig

sudo apt-get update

# Set MySQL password ahead of time for unattended install
sudo -E apt-get -q -y install mysql-server

sudo apt-get install -y sublime-text atom brackets remmina zeal lamp-server^ minecraft-installer

sudo apt-get install -y libnotify-bin notifyosdconfig
pkill notifyosd
# NotifyOSD will show as an upgrade to an existing package.
sudo apt-get upgrade -y

# Install development tools ####################################################

sudo apt-get install -y tilda build-essential git subversion meld monodevelop monodoc-manual codeblocks virtualbox virtualbox-guest-additions-iso vagrant mysql-workbench filezilla
sudo vagrant plugin install vagrant-linode

sudo apt-get instlal openjdk7-jdk openjdk7-jre

# Install command line utilities I use #########################################

sudo apt-get install -y realpath htop w3m nano

# Install additional services ##################################################

sudo apt-get install -y openssh-server

# Install additional PHP related packages/tools ################################

sudo apt-get install -y php5-cli

# Install Composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin
echo "alias composer='php /usr/local/bin/composer.phar'" >> ~/.bashrc
source ~/.bashrc

# Install Node.js related packages #############################################
sudo apt-get install -y nodejs nodejs-legacy npm redis-server

# Update npm
sudo npm install -g npm

# Install commonly used npm packages globally
sudo npm install -g grunt-cli
sudo npm install -g bower
sudo npm install -g sails

# Install other utlities #######################################################

sudo apt-get install -y kupfer keepassx conduit owncloud-client p7zip-full compizconfig-settings-manager compiz-plugins

# Install graphics utilities ###################################################

sudo apt-get install -y gimp inkscape krita rawtherapee

# Install other Internet/social packages

sudo apt-get install -y pidgin midori

# Install media packages #######################################################

sudo apt-get install -y audacious vlc audacity

# Create commonly required directories

cd ~/
mkdir bin Projects src www .icons .themes
mkdir -p Pictures/UI

# UI configuration settings ####################################################

cd ~/.icons
git clone https://github.com/NitruxSA/flattr-icons.git

cd ~/.themes
git clone https://github.com/wfpaisa/Plane-Gtk3.git
git clone https://github.com/wfpaisa/Plane-Gtk3-White.git

cd ~/

sudo ln -s /root/.icons ~/.icons 
sudo ln -s /root/.themes ~/.themes 
