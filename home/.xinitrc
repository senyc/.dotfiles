#!/bin/sh
xset -b

# Start compsitor
picom &

# Hide the mouse cursor
unclutter --jitter 10 --start-hidden --fork
nitrogen --set-zoom-fill "$HOME/Pictures/mountain.jpg"
xbindkeys
qtile start
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
