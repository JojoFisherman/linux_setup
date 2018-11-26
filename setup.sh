#!/bin/bash

cd ~

# Repository
echo "###########################adding repository###########################"
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:numix/ppa
sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"

# Update
echo "###########################updating###########################"
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# Install
echo "###########################apt-get installing###########################"
sudo apt-get -y --allow-unauthenticated install sublime-text-installer \
git curl google-chrome-stable build-essential python-dev python3-dev \
cmake oracle-java8-installer libopencv-dev python-opencv python-pip \
python3-pip python-virtualenv python-numpy python-matplotlib libcupti-dev \
screenfetch neovim

# pip install
echo "###########################pip installing###########################"
sudo apt-get -y install python3.6
sudo -H pip install virtualenv
sudo -H pip3 install --upgrade pip
sudo -H pip3 install requests scrapy Pillow beautifulsoup4 scipy ipython \
jupyter pandas sympy nose lxml selenium apscheduler sklearn quandl pandas
sudo -H pip3 install --upgrade tensorflow
sudo -H pip3 install --upgrade autopep8

echo '###########################installing dotfiles###########################'
git clone https://github.com/mathiasbynens/dotfiles.git 
cd dotfiles 
source bootstrap.sh
cd ..

git clone https://github.com/jackaccyou/linux_setup.git
yes | sudo cp -rfa linux_setup/.vimrc .
yes | sudo cp -rfa linux_setup/.gitconfig .
mkdir -p ~/.config/nvim
yes | sudo cp -rfa linux_setup/init.vim ~/.config/nvim



# Vundle
echo '###########################installing vundle###########################'
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa!'

# Theme
echo '###########################installing system theme###########################'
sudo apt-get -y install numix-gtk-theme numix-icon-theme-circle
sudo apt-get install arc-theme
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh
cd ~




// Remove
echo '###########################removing bloatwares###########################'
sudo apt-get -y -r remove account-plugin-aim account-plugin-facebook account-plugin-flickr account-plugin-jabber account-plugin-salut account-plugin-twitter account-plugin-windows-live account-plugin-yahoo aisleriot brltty colord deja-dup deja-dup-backend-gvfs duplicity empathy empathy-common evolution-data-server-online-accounts example-content firefox gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects gnomine landscape-common mcp-account-manager-uoa rhythmbox rhythmbox-plugins rhythmbox-plugin-zeitgeist sane-utils shotwell shotwell-common telepathy-gabble telepathy-haze telepathy-idle telepathy-indicator telepathy-logger telepathy-mission-control-5 telepathy-salut thunderbird thunderbird-gnome-support totem totem-common totem-plugins unity-scope-audacious unity-scope-chromiumbookmarks unity-scope-clementine unity-scope-colourlovers unity-scope-devhelp unity-scope-firefoxbookmarks unity-scope-gdrive unity-scope-gmusicbrowser unity-scope-gourmet unity-scope-manpages unity-scope-musicstores unity-scope-musique unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote unity-scope-virtualbox unity-scope-yelp unity-scope-zotero

// Amazon delete
echo '###########################deleting amazon###########################'
sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js
sudo rm /usr/share/unity-webapps/userscripts/unity-webapps-amazon/manifest.json

// Xubuntu
echo '###########################installing xubuntu###########################'
sudo apt-get -y install xubuntu-desktop
