#!/bin/env bash

# Fixes two finger scroll speed
file="/etc/X11/xorg.conf.d/39-libinput.conf"
echo "\
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "ScrollPixelDistance" "50"
EndSection" > $file

# Fixes tap-and-drag
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag false
