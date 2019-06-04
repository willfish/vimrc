#! /usr/bin/env bash

INIT_VIM=~/.config/nvim/init.vim
RUNTIME=~/.vim_runtime

ln -sf $"(pwd)" $RUNTIME
ln -sf $"(pwd)"/init.vim $INIT_VIM

PLUG_GIT=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
PLUG_VIM=~/.local/share/nvim/site/autoload/plug.vim

if [ -f "$PLUG_VIM" ]; then
	echo "$PLUG_VIM exists"
else
	curl -fLo $PLUG_VIM --create-dirs $PLUG_GIT
fi
