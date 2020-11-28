# Install command-line tools

# Update repositories
sudo apt-get update && sudo apt-get -y dist-upgrade

# Install prerequisites
sudo apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev libncurses5-dev zlib1g zlib1g-dev sqlite3 libxslt-dev libxml2-dev libsqlite3-dev python-software-properties curl libcurl3 libcurl3-gnutls libcurl4-openssl-dev

# Misc Utilities
sudo apt-get -y install ssh tmux vim git-core wget zip unzip mcrypt imagemagick libmagickwand-dev htop whois dnsutils

# Update and upgrade repos
sudo apt-get -y update
sudo apt-get -y upgrade # Use the below comman to avoid an Ubuntu bug: http://askubuntu.com/questions/146921/how-do-i-apt-get-y-dist-upgrade-without-a-grub-config-prompt
# sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

# Core utilities
sudo apt-get -y install coreutils
sudo apt-get -y install moreutils
sudo apt-get -y install findutils
sudo apt-get -y install curl
sudo apt-get -y install gnu-sed

sudo apt-get -y install wget

# Install standard tools
sudo apt-get -y install vim
sudo apt-get -y install grep
sudo apt-get -y install screen
sudo apt-get -y install php5
sudo apt-get -y install libcurl3 php5-curl # curl

# Vim
sudo apt-get -y install vim
sudo apt-get -y install gvim

# Install other userful binaries
sudo apt-get -y install ack
sudo apt-get -y install git
sudo apt-get -y install nmap
sudo apt-get -y install tree
sudo apt-get -y install ngrep
sudo apt-get -y install ragel

sudo apt-get -y install stow

# Don't install android-sdk
# Don't install android-ndk

# Make, compilers, and heavier utilities
sudo apt-get -y install cmake
sudo apt-get -y install gcc
sudo apt-get -y install ffmpeg
sudo apt-get -y install openssl
sudo apt-get -y install wireshark
sudo apt-get -y install tmux

# Database
sudo apt-get -y install sqlite3 libsqlite3-dev
sudo apt-get -y install mysql-server
sudo apt-get -y install redis-server

# Additional files (different than Mac Version) from:
# https://github.com/SiliconValleyInsight/vagrant-dev-box/blob/master/vagrantInit.sh

# Install Python pip manager
sudo apt-get -y install python-pip

# Install VirtualEnv for python
sudo pip install virtualenv

# put all virtualEnvs in home directory
sudo pip install virtualenvwrapper
source `which virtualenvwrapper.sh` >> ~/.bash_profile

# Virtual Env Instructions

# `mkvirtualenv <name>` # Create VirtualEnv
# `workon <name>` # Use a given working env
# `deactivate` # Stop using a given environment

# Install git
sudo apt-get -y install python-software-properties
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get -y remove git
sudo apt-get -y install git

# Setup git
# git config --global user.name "Your Name"
# git config --global user.email "your@domain.com"
# git config --global credential.helper cache
# if you don't want git to ask for your password more than 1x every 24hrs
# git config --global credential.helper 'cache --timeout=86400'
# git config --global core.editor "vim" # or "emacs"
# git config --global push.default simple

# Node nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# Python pyenv
curl https://raw.github.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
echo "You may need to tweak your python installation"
echo "export PATH=$HOME/.pyenv/bin/pyenv:\$PATH" >> ~/.bashrc_custom


# Colors and editors
export CLICOLOR=1
export LSCOLORS=BxHxFxDxCxegedabagacad
export EDITOR=vim

# Docker
#sudo apt-get -y install docker.io
#sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
curl -sSL https://get.docker.io/ubuntu/ | sudo sh
sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart

# Test Docker
# `sudo docker run -i -t ubuntu /bin/bash`

# Install fig
sudo curl -L https://github.com/docker/fig/releases/download/0.5.2/linux > /usr/local/bin/fig
sudo chmod +x /usr/local/bin/fig

# Node Version Manager nvm
curl https://raw.githubusercontent.com/creationix/nvm/v0.12.0/install.sh | bash

# Install lastest 0.10 version
source ~/.bash_profile
nvm install 0.10
source ~/.bash_profile

# Ruby version manager rvm (https://github.com/rvm/ubuntu_rvm)
sudo apt-get install software-properties-common
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm

# Not needed for Ubuntu (see above instead)
# curl -sSL https://get.rvm.io | bash
# source ~/.bash_profile

# echo "source ~/.profile" >> ~/.bash_profile
echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc

# Install latest Ruby 2.7.0 version
rvm install 2.7.0
sudo gem install bundler
