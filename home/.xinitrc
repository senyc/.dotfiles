#!/usr/bin/sh

unclutter --jitter 10 --start-hidden --fork
xbindkeys
picom &
# Cursor theme
xrdb ~/.Xresources
# Make sure this is the last line
qtile start
