#!/usr/bin/sh

unclutter --jitter 10 --start-hidden --fork
xbindkeys
picom &
# Cursor theme
xrdb ~/.Xresources
# Rotates monitor (right side) 
xrandr --output DP-3 --rotate right
xrandr --output DP-3 --pos 5120x-480
xrandr --output HDMI-1 --primary
nitrogen --restore
# Make sure this is the last line
qtile start
