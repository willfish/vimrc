#! /usr/bin/env zsh

INIT_NVIM=~/.config/nvim/init.vim
INIT_VIM=~/.vimrc

mkdir -p ~/.config/nvim
mkdir -p ~/.vim/autoload/
mkdir -p ~/.local/share/nvim/site/autoload/

ln -sf $(pwd)/init.vim $INIT_NVIM
ln -sf $(pwd)/init.vim $INIT_VIM

COC_NVIM=~/.config/nvim/coc-settings.json
COC_VIM=~/.vim/coc-settings.json

ln -sf $(pwd)/coc-settings.json $COC_NVIM
ln -sf $(pwd)/coc-settings.json $COC_VIM

PLUG_GIT=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
PLUG_INSTALL_DIR=~/.plug
PLUG_NVIM=~/.local/share/nvim/site/autoload/plug.vim
PLUG_VIM=~/.vim/autoload/plug.vim

curl -fLso $PLUG_INSTALL_DIR --create-dirs $PLUG_GIT

ln -sf $PLUG_INSTALL_DIR $PLUG_NVIM
ln -sf $PLUG_INSTALL_DIR $PLUG_VIM

ln -sf $(pwd) ~/.vim_runtime
