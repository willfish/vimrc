set nocompatible 
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim_runtime/sources/')
  Plugin 'VundleVim/Vundle.vim'

  Plugin 'Shougo/neco-vim'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'dag/vim-fish'
  Plugin 'elixir-lang/vim-elixir'
  Plugin 'godlygeek/tabular'
  Plugin 'hashivim/vim-terraform'
  Plugin 'mbbill/vim-seattle'
  Plugin 'mhinz/vim-mix-format'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'rking/ag.vim'
  Plugin 'roxma/ncm-rct-complete'
  Plugin 'roxma/nvim-completion-manager'
  Plugin 'scrooloose/nerdtree'
  Plugin 'slashmili/alchemist.vim'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'thinca/vim-quickrun'
  Plugin 'tpope/vim-commentary'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'w0rp/ale'
  Plugin 'yegappan/mru'
call vundle#end()

filetype plugin indent on
