#!/bin/bash

WLPR=$1

echo "Changing wallpaper to $1"

function change_wallpaper {
 defaults write com.apple.desktop Background "{default = {ImageFilePath='$WLPR'; };}"; killall Dock
}

change_wallpaper
