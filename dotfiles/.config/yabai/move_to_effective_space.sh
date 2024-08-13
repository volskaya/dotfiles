#!/bin/bash

space=$1

window_options=$(yabai -m query --windows --window)
window_id=$(jq ".id" <<< $window_options)

display_index=$(jq ".display" <<< $window_options)
display_options=$(yabai -m query --displays --display $window_display)

# Increment the $space by the previous displays space count
if [ $display_index -gt 1 ]; then
  (( previous_display_index=display_index-1))
  display_1_spaces_count=$(yabai -m query --displays --display $previous_display_index | jq ".spaces[-1]")
  (( space=space+display_1_spaces_count ))
fi

if [ $(jq -er ".spaces | any(. == $space)" <<< $display_options) == "true" ]; then
  yabai -m window --space $space
  yabai -m display --focus $display_index
  yabai -m space --focus $space
fi