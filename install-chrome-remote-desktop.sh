#!/bin/bash

echo 'Read instructions https://remotedesktop.google.com/headless'

sudo apt-get install chrome-remote-desktop
     
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg -i chrome-remote-desktop_current_amd64.deb



DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/rQFOUoq7vnoxY6aSvOPRrLA7G7NQgCaozFobSTnW8YNL9foRgTB5akOgVAOqa7GqUAYrc9a_fxQKAwo8MZKk_QA" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=

