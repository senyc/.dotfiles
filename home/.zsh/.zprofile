#!/usr/bin/env bash

export TZ='America/Detroit'

# Starting the xorg server
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi
