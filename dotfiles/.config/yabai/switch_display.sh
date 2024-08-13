#!/bin/bash

display=$1

yabai -m query --displays --display $display && echo "$display" > ~/.config/yabai/cache/last_display
yabai -m display --focus $display