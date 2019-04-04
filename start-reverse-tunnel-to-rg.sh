#!/bin/bash

autossh -f -N -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R 5000:localhost:22  rg
#autossh -f -N -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R 3306:localhost:3306  rg

