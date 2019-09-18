#!/bin/bash

sudo apt-get remove chrome-remote-desktop
sudo rm -rf ~/.config/chrome-remote-desktop

killall pulseaudio
pulseaudio --start
# gnome-shell --replace

echo "Restart the computer, please"
