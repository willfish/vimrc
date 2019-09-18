#! /usr/bin/env bash

INIT_NVIM=~/.config/nvim/init.vim
INIT_VIM=~/.vimrc
RUNTIME=~/.vim_runtime

mdkir -p ~/.config/nvim

ln -sf $(pwd) $RUNTIME
ln -sf $(pwd)/init.vim $INIT_NVIM
ln -sf $(pwd)/init.vim $INIT_VIM

PLUG_GIT=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
PLUG_INSTALL_DIR=~/.plug
PLUG_NVIM=~/.local/share/nvim/site/autoload/plug.vim
PLUG_VIM=~/.vim/autoload/plug.vim

curl -fLso $PLUG_INSTALL_DIR --create-dirs $PLUG_GIT

ln -sf $PLUG $PLUG_NVIM
ln -sf $PLUG $PLUG_VIM
