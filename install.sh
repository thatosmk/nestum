#!/bin/bash

set -euo pipefail

# Helper function to print step titles
log() { echo -e "\n\033[1;32m==>\033[0m \033[1m$1\033[0m"; }

log "Updating system packages..."

# update
sudo apt update && sudo apt upgrade -y

# install git & then zsh (https://ohmyz.sh/)
log "Installing prerequisites (git curl vim wget zsh)"
sudo apt install -y git zsh curl wget vim

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log "Installing oh my zsh"
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" --unattended
else
    log "Oh my zsh is already installed, skipping..."
fi


log "Deploying configuration files..."
if [ -f "src/zshrc" ]; then
    cp src/zshrc ~/.zshrc
fi

if [ -f "src/vimrc" ]; then
    cp src/vimrc ~/.vimrc
fi

# Install vundle if not already installed
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    log "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    log "Vundle is already installed, skipping..."
fi

log "Installing vim plugins"
vim +PluginInstall +qall

log "Setup complte! Change your default shell with: chsh -s \$(which zsh)"
