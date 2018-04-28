#!/bin/bash
CURR_DIR=$(pwd)
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo "vundle already downloaded"
fi

if [ ! -e $CURR_DIR/git-browse ]; then
  git clone https://github.com/albertyw/git-browse
else
  echo "git-browse already downloaded"
fi

if [ ! -e $CURR_DIR/z ]; then
  git clone https://github.com/rupa/z.git
else
  echo "z already downloaded"
fi

ln -nfs $CURR_DIR/z ~/.z.git
ln -nfs $CURR_DIR/vim/vimrc ~/.vimrc
ln -nfs $CURR_DIR/bash/bash_profile ~/.bash_profile
