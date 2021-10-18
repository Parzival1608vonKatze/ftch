#!/bin/bash

#get horizontal resolution
X=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
# get vertical resolution
Y=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
# add them together
res=$(echo "$X"x"$Y")