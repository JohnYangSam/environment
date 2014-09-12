#!/bin/bash

# Unstow the packages
# Note: This cannot undo all the changes made in setup

stow -D bash
stow -D git
stow -D ssh
stow -D tmux
stow -D vim

# Unstows for Mac
if [ `uname` == 'Darwin']; then
  stow -D ./init/sublime
  stow -D ./init/AndroidStudio/AndroidStudioPreferences
fi
