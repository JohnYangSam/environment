#!/bin/bash

# Run this script to link these files into the home directory
# and setup other configuration.
# Inspired by:
# Roneil Rumburg's dotfiles: https://github.com/roneilr/dotfiles/blob/master/setup.bash

set -e

function install_ask {
    # $1 = package to ask about installing
    read -p "Would you like to install extras for $1  (y/n) " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]]
}

# Check if we have a Mac
if [[ `uname` == 'Darwin' ]]; then
    if install_ask "homebrew and GNU stow (required)"; then
        # Install xcode commandline developer tools
        xcode-select --install

        # Install homebrew
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
        brew install stow
    else
        # Homebrew is required for the rest of the installation if Mac
        echo "Homebrew must be installed for the rest of the setup. Quitting setup."
        exit 1
    fi
else # [[ `uname` == 'Linux ]]
    # Install stow on a Linux machine
    sudo-apt-get -y install stow
fi

if install_ask "bash"; then
    stow bash
fi

if install_ask "git"; then
    # create .gitconfig-local if it doesn't exist

    # Prompt for file configuration information
    echo "Name:"
    read name
    echo "Email:"
    read email
    echo "Github Username:"
    read github_username

    if [ ! -e ~/.gitconfig-local ]; then
        echo "[user]
        name = $name
        email = $email

        [github]
        user = $github_username" > ~/.gitconfig-local

        echo "Edit local configuration options (name, email, etc.) in ~/.gitconfig-local"
    fi

    stow git
fi

if install_ask "osx"; then
    ./osx/defaults.sh

    if install_ask "enable trim"; then
        ./osx/trim_enabler.sh
    fi

    if install_ask "fonts"; then
        open osx/fonts/*
    fi

    if install_ask "iterm"; then
        open osx/iterm/*
    fi
fi

if install_ask "ssh"; then
    stow ssh
fi

if install_ask "tmux"; then
    stow tmux
fi

if install_ask "rvm and ruby"; then
    curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

if install_ask "tools and apps"; then

    # Determine the type of platform
    # Borrowed from: http://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script

    # For Mac `uname` == 'Darwin'
    if [[ `uname` == 'Darwin' ]]; then
        # Install homebrew package manager for mac
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

        # Install packages through homebrew
        brew bundle ./homebrew/Brewfile

        # Install RVM
        curl -sSL https://get.rvm.io | bash -s stable --ruby

        # Install additional language versions

        # Ruby
        rvm install 2.1.2
        rvm use 2.1.2

        # Node
        nvm install 0.10
        nvm use 0.10

        # Python
        pyenv install 2.7.8
        pyenv global 2.7.8
        pip install virtualenv
        pip install virtualenvwrapper
        # Already added to bash # source `which virtualenvwrapper.sh` >> ~/.bash_profile

        # Only install applications if we have installed dev utils
        if install_ask "applications"; then
            # Install applications through homebrew cask
            brew bundle Caskfile
        fi

        if install_ask "add bash 4 to shells list"; then
            # Add the installed shell to available shells
            sudo echo "/usr/local/bin/bash" >> /etc/shells

            # Change the shell for the user to bash 4
            echo "Changing you shell to bash 4 by using `sudo chsh` and \
                changing the shell to /usr/local/bin/bash"
            sudo chsh -s /user/local/bin
        fi

        # Solarized terminal
        open ./init/Solarized\ Dark.terminal
        echo "You may want to change your terminal font to Monaco 13pt"

    # For Linux `uname` == 'Linux'
    else
        # Install through sudo-apt-get on Linux
        ./linux/install_tools.sh
    fi
fi

if install_ask "vim"; then
    # Bootstrap vim plugin manager
    if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
        mkdir -p ~/.vim/bundle
        git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    fi

    # Install dotfiles for vim
    stow vim

    # Install vim plugins
    vim +NeoBundleInstall +q
fi

# Mac Specific installs
if [[ `uname` == 'Darwin' ]]; then

    # Sublime settings on Mac
    if install_ask "sublime User and Anaconda settings"; then
        stow --target-dir='~/Library/Application Support/Sublime Text 3/Packages/User/' ./init/sublime
    fi

    # Android Studio settings on Mac
    if install_ask "Android Studio settings (will overwrite)"; then
        # TODO: Is it better to extract and stow or or extract directly to the location?
        unzip -o ../settings.jar -d ./init/AndroidStudio/AndroidStudioPreferences # unzip to location and overwrite
        gnu stow --target-dir='~/Library/Preferences/AndroidStudioBeta/colors/' ./init/AndroidStudio/AndroidStudioPreferences

    # Userful post on Resetting Android Studio: http://stackoverflow.com/questions/19384033/how-to-reset-android-studio

    fi
fi

