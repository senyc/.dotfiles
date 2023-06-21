#!/usr/bin/env bash

# If running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

TZ='America/Detroit'; export TZ

# Starting the xorg server
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi

