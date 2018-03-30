set nocompatible 
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim_runtime/sources/')

Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dag/vim-fish'
Plugin 'godlygeek/tabular'
Plugin 'hashivim/vim-terraform'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'w0rp/ale'
Plugin 'yegappan/mru'

call vundle#end()
filetype plugin indent on
