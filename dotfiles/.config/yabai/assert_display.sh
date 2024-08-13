#!/bin/bash

intended_display=$(cat ~/.config/yabai/cache/last_display)

display_options=$(yabai -m query --displays --display)
display_id=$(jq ".id" <<< $display_options)

if [ "$display_id" != "$intended_display" ]; then
  yabai -m display --focus $intended_display
fi