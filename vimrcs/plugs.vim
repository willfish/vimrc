filetype off

set shell=bash

call plug#begin('~/.vim_runtime/plugged/')

"""""""""""""""""""
" Vim look and feel
"""""""""""""""""""
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'

"""""""""""""""""
" File navigation
"""""""""""""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'rking/ag.vim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'yegappan/mru'

"""""""""""""""""""
" Languages support
"""""""""""""""""""
" Master plugin for all language syntax highlighting
Plug 'sheerun/vim-polyglot'

" Common Lisp
Plug 'kovisoft/paredit'
Plug 'l04m33/vlime', {'rtp': 'vim/'}

" Elixir
Plug 'slashmili/alchemist.vim'

" Ruby
Plug 'tpope/vim-bundler'

"""""""""""""""""""
" Extra Vim Objects
"""""""""""""""""""
Plug 'b4winckler/vim-angry'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'thinca/vim-textobj-function-javascript'

"""""""""""""""""""
" Extra Vim Motions
"""""""""""""""""""
Plug 'christoomey/vim-sort-motion'
Plug 'tpope/vim-commentary'

""""""""""""""
" Intellisense
""""""""""""""
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

"""""""""""""""
" Running tests
"""""""""""""""
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
""""""""""""""""""""
" Linting and tidies
""""""""""""""""""""
Plug 'ntpeters/vim-better-whitespace'
Plug 'pseewald/vim-anyfold'
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'

""""""""""""""""""""
" tpope <3
""""""""""""""""""""
" Asynchronous arbitrary shell execution
Plug 'tpope/vim-dispatch'
" Automatically terminate ( ), do end, { } etc
Plug 'tpope/vim-endwise'
" Git integrations
Plug 'tpope/vim-fugitive'
" Alternate file trees - useful for quick navigation between files - i.e. from a model to it's test file, schema, etc
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
" Support for repeating vim-surround motions
Plug 'tpope/vim-repeat'
" Open browser with git object under cursor - context aware
Plug 'tpope/vim-rhubarb'
" C-A (increment) and C-X (decrement) support for dates and times
Plug 'tpope/vim-speeddating'
" Navigate quickfix with ]q (next) [q (previous) entry shortcut
Plug 'tpope/vim-unimpaired'
" Change, add and delete surrounding characters around a target object
Plug 'tpope/vim-surround'

"""""""""""""""""""""
" Must be loaded last
"""""""""""""""""""""
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

set shell=fish

filetype plugin indent on
