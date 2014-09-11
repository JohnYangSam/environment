# .bashrc should be sourced from the .bash_profile
# .bash_profile is sourced on each new login window and .bashrc is
# sourced every time a new screen is opened on something like screen


# .bashrc configurations that might need to be tweaked on
# a per a machine basis
source "$HOME/.bashrc_custom"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
