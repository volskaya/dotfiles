#!/bin/bash

space=$1

yabai -m display --focus $(yabai -m query --spaces --space $space | jq .display)
yabai -m space --focus $space
