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

# Claude Code config
mkdir -p ~/.claude
ln -nfs $CURR_DIR/claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -nfs $CURR_DIR/claude/settings.json ~/.claude/settings.json

# Claude Code memory (project-level, needs the right path for this machine)
CLAUDE_PROJECT_DIR=~/.claude/projects/-$(echo $HOME | tr '/' '-' | sed 's/^-//')
mkdir -p "$CLAUDE_PROJECT_DIR/memory"
ln -nfs $CURR_DIR/claude/memory/MEMORY.md "$CLAUDE_PROJECT_DIR/memory/MEMORY.md"
