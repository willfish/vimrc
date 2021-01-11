#! /usr/bin/env bash

THIS=$(pwd)
RUNTIME=~/.vim_runtime

INIT_NVIM=~/.config/nvim/init.vim

mkdir -p ~/.config/nvim

ln -sf $THIS/init.vim $INIT_NVIM

# Strangely, ln -sf symlinks the source to a directory inside of itself
# if the file in the current directory does not exist
#
# This could be a bug in ln
[[ -L $RUNTIME ]] && rm -f $RUNTIME
ln -sf $THIS $RUNTIME

git clone https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
