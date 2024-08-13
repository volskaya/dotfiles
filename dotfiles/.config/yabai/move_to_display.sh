#!/bin/bash

display=$1

window_options=$(yabai -m query --windows --window)
window_id=$(jq ".id" <<< $window_options)

yabai -m window --display $display
yabai -m window --focus $window_id
yabai -m display --focus $display