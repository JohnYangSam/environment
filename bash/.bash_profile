# This file is sourced by bash for login shells.

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# The following line  runs your .bashrc and is recommended
# by the bash info pages.
[[ -f ~/.bashrc ]] && . $HOME/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
