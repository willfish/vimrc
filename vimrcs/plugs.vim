filetype off

set shell=bash

call plug#begin('~/.vim_runtime/plugged/')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
  Plug 'christoomey/vim-sort-motion'
  Plug 'christoomey/vim-system-copy'
  Plug 'glts/vim-textobj-comment'
  Plug 'godlygeek/tabular'
  Plug 'jonathanfilip/vim-lucius'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-user'
  Plug 'mbbill/vim-seattle'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'pseewald/vim-anyfold'
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'slashmili/alchemist.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'thoughtbot/vim-rspec'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-scripts/argtextobj.vim'
  Plug 'w0rp/ale'
  Plug 'yegappan/mru'
call plug#end()

filetype plugin indent on
