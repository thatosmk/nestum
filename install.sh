#!/bin/bash

# update
sudo apt update && sudo apt upgrade -y

# install git & then zsh (https://ohmyz.sh/)
sudo apt install git git-core

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# install my zshrc 
cp src/zshrc ~/.zshrc
source ~/.zshrc

# install vim
sudo apt install vim

# install pathogen and vundle (requires git to be installed)
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# setup up the config file
cp src/vimrc ~/.vimrc

# source the config file
source ~/.vimrc
