#!/bin/env bash

pkgs=(
    "bat"
    "bluez-tools"
    "trash-cli"
    "tree"
    "xsel"
)

for pkg in "${pkgs[@]}"; do
    dpkg -s $pkg &> /dev/null
    if [ $? -eq 0 ]; then
        printf "\e[32m$pkg\e[0m is installed\n"
    else
        sudo apt install $pkg -y
    fi
done
