#!/bin/bash

window_options=$(yabai -m query --windows --window $YABAI_WINDOW_ID)
window_width=$(jq ".frame.w" <<< $window_options)
window_height=$(jq ".frame.h" <<< $window_options)
window_space=$(jq ".space" <<< $window_options)

space_options=$(yabai -m query --spaces --space $window_space)
space_display=$(jq ".display" <<< $space_options)

display_options=$(yabai -m query --displays --display $space_display)
display_width=$(jq ".frame.w" <<< $display_options)
display_height=$(jq ".frame.h" <<< $display_options)
display_x=$(jq ".frame.x" <<< $display_options)
display_y=$(jq ".frame.y" <<< $display_options)

display_center_x=display_width/2
display_center_y=display_height/2

(( window_x=display_center_x-(window_width/2)+display_x ))
(( window_y=display_center_y-(window_height/2)+display_y ))

# Perform the center.
if [ $YABAI_WINDOW_ID ]; then
  # Float non resizable windows.
  if [ $(jq -er ".resizable == 0 and .floating == 0" <<< $window_options) == "true" ]; then
    yabai -m window $YABAI_WINDOW_ID --toggle float
  fi

  yabai -m window $YABAI_WINDOW_ID --move abs:$window_x:$window_y
else
  # Float non resizable windows.
  if [ $(jq -er ".resizable == 0 and .floating == 0" <<< $window_options) == "true" ]; then
    yabai -m window --toggle float
  fi

  yabai -m window --move abs:$window_x:$window_y
fi