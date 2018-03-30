#! /usr/bin/env bash
RUNTIME=~/.vim_runtime 

git clone https://github.com/willfish/vimrc $RUNTIME

cat > ~/.vimrc <<VIMRC 
source $RUNTIME/vimrcs/vundle.vim
source $RUNTIME/vimrcs/basic.vim
source $RUNTIME/vimrcs/filetypes.vim
source $RUNTIME/vimrcs/plugins_config.vim
VIMRC

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Open VIM and run the following:"
echo
echo ":PluginInstall"
