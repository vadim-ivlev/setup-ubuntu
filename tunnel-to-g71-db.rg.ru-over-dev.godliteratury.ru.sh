#!/bin/bash
# tunnel to g71-db.rg.ru via dev.godliteratury.ru

autossh -f -N -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -L 3307:g71-db.rg.ru:3306  lit

