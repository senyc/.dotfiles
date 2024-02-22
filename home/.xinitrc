#!/usr/bin/sh

five_minutes=300

unclutter --jitter 10 --start-hidden --fork
xbindkeys

# Turn off the screen in a while
xset s 7000
xset dpms 7000 7000 7000

xidlehook \
   --detect-sleep \
   --not-when-audio \
   --not-when-fullscreen \
   --timer "$five_minutes" "$HOME/.dotfiles/home/bin/lock_screen" '' &

picom &
# Cursor theme
xrdb ~/.Xresources
# Make sure this is the last line
qtile start
