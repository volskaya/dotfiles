#!/bin/bash

space_options=$(yabai -m query --spaces --space)
display_id=$(jq ".display" <<< $space_options)
space_index=$(jq ".index" <<< $space_options)

display_options=$(yabai -m query --displays --display $display_id)
first_space_index=$(jq ".spaces[0]" <<< $display_options)
space_wrap_around_index=$(jq ".spaces[0]" <<< $display_options)

(( space_wrap_around_index=space_wrap_around_index-first_space_index+1 ))
(( space_next_index=space_index-first_space_index+2 ))

~/.config/yabai/focus_effective_space.sh $space_next_index || ~/.config/yabai/focus_effective_space.sh $space_wrap_around_index