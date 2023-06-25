#!/usr/bin/sh

unclutter --jitter 10 --start-hidden --fork
xbindkeys
picom &
# Cursor theme
xrdb ~/.Xresources
# Rotates monitor (right side) 
xrandr --output HDMI-0 --primary
xrandr --output DP-0 --right-of HDMI-0
xrandr --output DP-4 --left-of HDMI-0
xrandr --output DP-0 --rotate right
xrandr --output DP-0 --pos 5120x-480
nitrogen --restore
# Make sure this is the last line
qtile start
