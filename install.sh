#!/bin/bash

# install pathogen and vundle (requires git to be installed)
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# setup up the config file
mv vimrc ~/.vimrc

# source the config file
source ~/.vimrc
