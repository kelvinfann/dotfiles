#!/bin/bash
CURR_DIR=$(pwd)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -nfs $CURR_DIR/vim/.vimrc ~/.vimrc
