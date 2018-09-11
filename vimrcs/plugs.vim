set nocompatible
filetype off

set shell=bash

call plug#begin('~/.vim_runtime/plugged/')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neco-vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'godlygeek/tabular'
  Plug 'mbbill/vim-seattle'
  Plug 'mhinz/vim-mix-format'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'pseewald/vim-anyfold'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'slashmili/alchemist.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-commentary'
  Plug 'vim-airline/vim-airline'
  Plug 'w0rp/ale'
  Plug 'yegappan/mru'
call plug#end()

filetype plugin indent on
