#! /usr/bin/env zsh

THIS=$(pwd)
RUNTIME=~/.vim_runtime

INIT_NVIM=~/.config/nvim/init.vim
INIT_VIM=~/.vimrc

COC_NVIM=~/.config/nvim/coc-settings.json
COC_VIM=~/.vim/coc-settings.json

mkdir -p ~/.config/nvim
mkdir -p ~/.vim/autoload/
mkdir -p ~/.local/share/nvim/site/autoload/


ln -sf $THIS/init.vim $INIT_NVIM
ln -sf $THIS/init.vim $INIT_VIM

ln -sf $THIS/coc-settings.json $COC_NVIM
ln -sf $THIS/coc-settings.json $COC_VIM

# Strangely, ln -sf symlinks the source to a directory inside of itself
# if the file in the current directory does not exist
#
# This could be a bug in ln
[[ -L $RUNTIME ]] && rm -f $RUNTIME
ln -sf $THIS $RUNTIME
