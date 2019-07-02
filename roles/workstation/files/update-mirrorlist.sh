#!/bin/sh

reflector -c 'United States' -p https -l 25 -f 5 --sort rate \
    --save /etc/pacman.d/mirrorlist
