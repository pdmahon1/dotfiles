#!/bin/zsh

# fully copied from Micahel Friedrich at https://gitlab.com/dnsmichi/dotfiles/-/blob/main/brew_once.sh

if [[ ! -d /usr/share/build-essential ]] ; then 
    echo "Installing essential programs before installing Homebrew..."
    sudo apt install build-essential procps curl file git -y
fi

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

# pulls the Brewfile from my personal Gitlab dotfiles repo and installs brew formulae
brew file set_repo -r git@gitlab.com:pdmahon1/dotfiles/Brewfile
brew file update
