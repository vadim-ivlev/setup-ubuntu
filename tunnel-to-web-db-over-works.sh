#!/bin/bash

autossh -f -N -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 3306:web-db.rg.ru:3306  works

