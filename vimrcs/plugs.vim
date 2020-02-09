filetype off

set shell=bash

call plug#begin('~/.vim_runtime/plugged/')
  Plug 'vim-scripts/dbext.vim'
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
  Plug 'ap/vim-css-color'
  Plug 'b4winckler/vim-angry'
  Plug 'chr4/nginx.vim'
  Plug 'christoomey/vim-sort-motion'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'glts/vim-textobj-comment'
  Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
  Plug 'janko-m/vim-test'
  Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
  Plug 'junegunn/vim-easy-align'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-user'
  Plug 'kovisoft/paredit'
  Plug 'l04m33/vlime', {'rtp': 'vim/'}
  Plug 'mattn/gist-vim'
  Plug 'mattn/webapi-vim'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'preservim/nerdtree'
  Plug 'pseewald/vim-anyfold'
  Plug 'rking/ag.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'slashmili/alchemist.vim'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'thinca/vim-textobj-function-javascript'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-airline/vim-airline'
  Plug 'w0rp/ale'
  Plug 'yegappan/mru'
    " Must be loaded last
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

set shell=fish

filetype plugin indent on
