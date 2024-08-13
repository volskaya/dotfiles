#!/bin/bash

space=$1

display_options=$(yabai -m query --displays --display)
first_space_index=$(jq ".spaces[0]" <<< $display_options)
(( space=space+first_space_index-1 ))

# display_index=$(jq ".index" <<< $display_options)

# Increment the $space by the previous displays space count
# if [ $display_index -gt 1 ]; then
#   (( previous_display_index=display_index-1))
#   display_1_spaces_count=$(yabai -m query --displays --display $previous_display_index | jq ".spaces[-1]")
#   (( space=space+display_1_spaces_count ))
# fi

# Don't let it focus spaces on other displays.
if [ $(jq -er ".spaces | any(. == $space)" <<< $display_options) == "true" ]; then
  yabai -m space --focus $space
else
  exit 1
fi
