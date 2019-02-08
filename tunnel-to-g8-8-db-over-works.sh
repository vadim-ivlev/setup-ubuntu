#!/bin/bash

autossh -f -N -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 3308:g8-8-db.rg.ru:3306  works

