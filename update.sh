#!/bin/bash

# Run this script to update the vim the repo
# and run update for vim plugins

# Update repo
git pull --rebase

# update vim plugins
vim +NeoBundleUpdate +q

# Restow all the packages (unstow and then stow)
# to prune obsolete symlinks
stow -R bash
stow -R git
stow -R ssh
stow -R tmux
stow -R vim
