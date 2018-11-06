#!/bin/bash

sudo apt-get install -y vim
# to exchange files with windows
sudo add-apt-repository universe
sudo apt-get -y update
sudo apt-get install -y exfat-fuse exfat-utils 



#sudo apt-get install -y exfat-fuse exfat-utils # to exchange files with windows
sudo apt-get install -y git
sudo apt-get install -y mesa-utils # проверки работоспособности открытых драйверов для видеокарт
sudo apt-get install -y mc
sudo apt-get install -y fish
sudo apt-get install -y build-essential checkinstall
sudo apt-get install -y htop
sudo apt-get install -y curl
sudo apt-get install -y tmux



# ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
sudo dpkg -i ripgrep_0.10.0_amd64.deb

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo apt-get install -y automake
# xneur keyboard switcher
sudo add-apt-repository ppa:andrew-crew-kuznetsov/xneur-stable
sudo apt-get install -y xneur


sudo apt-get install -y mysql-client
sudo apt-get install -y autossh
sudo apt-get install -y openssh-server
sudo apt-get install -y net-tools 
sudo apt-get install -y php
sudo apt-get install -y python3-pip

# permissions to .ssh
chmod 600 ~/.ssh/config
chmod 644 .ssh/id_rsa.pub
chmod 600 .ssh/id_rsa


# install chrome
# install opera
# mailspring
# telegramm
# slack
# docker
# vscode
# gitkraken
# gnome tweaks
# phpstorm 


# docker post install. running without sudo.
# Create the docker group.
sudo groupadd docker
# Add your user to the docker group.
sudo usermod -aG docker $USER

# Nvidea drivers
# https://www.google.ru/search?q=ubuntu+nvidia+drivers+18.04&oq=ubuntu+nvidia+drivers&aqs=chrome.1.69i57j0l5.11828j0j4&sourceid=chrome&ie=UTF-8
#sudo add-apt-repository ppa:graphics-drivers/ppa
#sudo apt update
#sudo apt install nvidia-390



# Viewing all `git diffs` with vimdiff
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool

# ret rid of dock on the lock screen
sudo mv /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com ~/

# prevent swithcing workkspaces by shift-ctrl-alt-down, to work in vscode
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Super><Shift>Page_Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Super><Shift>Page_Down']"

# postgress client
sudo apt-get install postgresql-client

