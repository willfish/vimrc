#! /usr/bin/env bash

INIT_NVIM=~/.config/nvim/init.vim
INIT_VIM=~/.vimrc
RUNTIME=~/.vim_runtime

ln -sf $"(pwd)" $RUNTIME
ln -sf $"(pwd)"/init.vim $INIT_NVIM
ln -sf $"(pwd)"/init.vim $INIT_VIM

PLUG_GIT=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
PLUG_NVIM=~/.local/share/nvim/site/autoload/plug.vim
PLUG_VIM=~/.vim/autoload/plug.vim

if [ -f "$PLUG_NVIM" ]; then
  echo "$PLUG_NVIM exists"
else
  curl -fLo $PLUG_NVIM --create-dirs $PLUG_GIT
fi

if [ -f "$PLUG_VIM" ]; then
  echo "$PLUG_VIM exists"
else
  curl -fLo $PLUG_VIM --create-dirs $PLUG_GIT
fi
