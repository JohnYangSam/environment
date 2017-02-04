#!/bin/bash

# Run this script to link these files into the home directory
# and setup other configuration.
# Inspired by:
# Roneil Rumburg's dotfiles: https://github.com/roneilr/dotfiles/blob/master/setup.bash

set -e

# Ask for the user for input about an installation
function install_ask {
    # $1 = package to ask about installing
    read -p "Would you like to install extras for $1  (y/n) " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]]
}

# Check is a program is installed
function is_installed {
    local result=1
    type $1 >/dev/null 2>&1 || { local result=0; }
    [[ $result == 1 ]]
}

# Check if we have a Mac
if [[ `uname` == 'Darwin' ]]; then

    if [ ! -d /Applications/Xcode.app ]; then
        echo " ********************************************************************************* "
        echo " ***** IMPORTANT! Please install Xcode from the App Store before proceeding! ***** "
        echo " ********************************************************************************x "

        echo "Setup exiting early"

        exit 1
    fi

    if install_ask "homebrew and GNU stow (required)"; then

        echo "You may need to install Xcode Developer CommandLine Tools from the App Store. See: http://stackoverflow.com/questions/9329243/xcode-4-4-and-later-install-command-line-tools"
        # Install xcode commandline developer tools
        # xcode-select --install # This no longer works -- you must download directly
	if ! (is_installed "brew"); then
            # Install homebrew
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi

        brew install stow
    fi

    if [[ `which brew` == '' ]]; then
        # Homebrew is required for the rest of the installation if Mac
        echo "Homebrew must be installed for the rest of the setup. Quitting setup."
        exit 1
    fi
elif [[ `uname` == 'Linux' ]]; then
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

if install_ask "ssh"; then
    stow ssh
fi

if install_ask "tmux"; then
    stow tmux
fi

if install_ask "rvm and ruby"; then
    sudo curl -sSL https://get.rvm.io | bash -s stable --ruby
    source $HOME/.rvm/scripts/rvm # Load RVM into the shell

    # Install additional language versions

    # Ruby
    rvm install 2.1.2
    rvm use 2.1.2
fi

if install_ask "tools and apps"; then

    # Determine the type of platform
    # Borrowed from: http://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script

    # For Mac `uname` == 'Darwin'
    if [[ `uname` == 'Darwin' ]]; then
        # Install homebrew package manager for mac
        if ! (is_installed "brew"); then
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi

        # Install packages through homebrew
        ./homebrew/Brewfile
        #brew bundle ./homebrew/Brewfile

        # Node
        source $(brew --prefix nvm)/nvm.sh # ensure that nvm is loaded
        nvm install v5.5.0
        nvm use v5.5.0

        # Python
        if [[ `pyenv global` == 'system' ]]; then
            # IMPORTANT: Need to change YouCompleteMe Compilation when you edit this if it is enabled (not enabled in this version)
            pyenv install 2.7.8
            pyenv global 2.7.8
        fi
        # pyenv-virtualwrapper will let us use virtualenvwrapper with the current pyenv version
        brew install pyenv-virtualenvwrapper
        # Already added to bash # source `which virtualenvwrapper.sh` >> ~/.bash_profile

        # Only install applications if we have installed dev utils
        if install_ask "applications"; then
            # Install applications through homebrew cask
            #./homebrew/Caskfile
            echo "This is now deprecated to a 'no op.' You show now manually install your applications."
	    # brew bundle ./homebrew/Caskfile
        fi

        if install_ask "add bash 4 to shells list"; then
            # Add the installed shell to available shells
            echo "adding '/usr/local/bin/bash' to list of shells (You may need to do this manually)" 
            echo "/usr/local/bin/bash" | sudo tee -a /etc/shells

            # Change the shell for the user to bash 4
            echo "Changing your shell to bash 4 by using 'sudo chsh'"
            sudo chsh -s /usr/local/bin/bash

            # The above commands will run and execute what you used to need to do manually
            # echo " Press any key to continue after running the above commands"
            # read
        fi

        # Solarized terminal
        open ./init/Solarized\ Dark.terminal
        echo "You may want to change your terminal font to Monaco 13pt and Monaco for Powerline after you install the correct fonts"

    # For Linux `uname` == 'Linux'
    else
        # Install through sudo-apt-get on Linux
        chmod 700 ./linux/install_tools.sh
        ./linux/install_tools.sh
    fi
fi

if install_ask "vim"; then
    # Create Centralize backups, swapfiles and undo history
    if [ ! -d ~/.vim/backups ]; then
        mkdir -p ~/.vim/.backups
        chmod 700 ~/.vim/.backups
    fi

    if [ ! -d ~/.vim/swapsj ]; then
        mkdir -p ~/.vim/.swaps
        chmod 700 ~/.vim/.swaps
    fi

    # Bootstrap vim plugin manager
    if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
        mkdir -p ~/.vim/bundle
        git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
        ~/.vim/bundle/neobundle.vim/bin/install.sh
        # You may need to see this to get neobundle working: http://zunermuka.blogspot.com/2015/10/memo-vimbundlevimproclibvimprocmacso-is.html
    fi

    # Install dotfiles for vim
    stow -t ~/.vim vim
    # Link in the .vimrc
    dir=`pwd`
    ln -s "$dir/vim/.vimrc" ~/.vimrc

    # Install vim plugins
    vim +NeoBundleInstall +q

    # Avoid this plugin for the moment since it does not work well with pyenv
    # Install YouCompleteMe
    #~/.vim/bundle/YouCompleteMe/install.sh --clang-completer
fi

# Mac Specific installs
if [[ `uname` == 'Darwin' ]]; then

    if install_ask "enable trim"; then
        chmod 700 ./osx/trim_enabler.sh
        ./osx/trim_enabler.sh
    fi

    if install_ask "fonts"; then
        open osx/fonts/*
    fi

    if install_ask "iterm"; then
        open osx/iterm/*
    fi

    # Sublime settings on Mac
    if install_ask "sublime User and Anaconda settings"; then
        mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
        cp -r ./init/sublime/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

        echo "Please install package control as well: https://sublime.wbond.net/installation"
        echo "You may need to edit your Preferences file and download some Sublime packages such as Solarized"
    fi

    # Android Studio settings on Mac
    #if install_ask "Android Studio settings (will overwrite)"; then
    #    # TODO: Is it better to extract and stow or or extract directly to the location?
    #    mkdir -p ~/Library/Preferences/AndroidStudioBeta
    #    unzip -o ./init/AndroidStudio/settings.jar -d ./init/AndroidStudio/AndroidStudioPreferences # unzip to location and overwrite
    #    cp -r ./init/AndroidStudio/AndroidStudioPreferences/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

    # Userful post on Resetting Android Studio: http://stackoverflow.com/questions/19384033/how-to-reset-android-studio

    echo "You can open Android Stuiod and import the Android Studio settings in ./init/AndroidStudio/settings.jar"

    # fi

# docker-osx doesn't seem to be working
    if install_ask "docker-osx and osx fig"; then
        # docker-osx
        curl https://raw.githubusercontent.com/noplay/docker-osx/HEAD/docker-osx > /usr/local/bin/docker-osx
        chmod +x /usr/local/bin/docker-osx

        # osx fig
        curl -L https://github.com/docker/fig/releases/download/0.5.2/darwin > /usr/local/bin/fig
        chmod +x /usr/local/bin/fig
    fi

    if install_ask "osx"; then
        chmod 700 ./osx/defaults.sh
        ./osx/defaults.sh
    fi
fi

