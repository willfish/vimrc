filetype off

set shell=bash

call plug#begin('~/.vim_runtime/plugged/')

Plug 'sainnhe/gruvbox-material'                                    | " Theme
Plug 'skbolton/embark'                                             | " Theme
Plug 'vim-airline/vim-airline'                                     | " Status bar visuals
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                | " Open files and ag buffers
Plug 'junegunn/fzf.vim'                                            | " Open files and ag buffers
Plug 'junegunn/vim-easy-align'                                     | " Align stuff
Plug 'sheerun/vim-polyglot'                                        | " Language syntax highlighting
Plug 'tpope/vim-bundler'                                           | " Gemfile syntax highlighting
Plug 'kana/vim-textobj-user'                                       | " Api for textobj creation
Plug 'kana/vim-textobj-line'                                       | " Line textobj
Plug 'b4winckler/vim-angry'                                        | " Argument textobj
Plug 'glts/vim-textobj-comment'                                    | " Comment textobj
Plug 'michaeljsmith/vim-indent-object'                             | " Indent textobj
Plug 'tek/vim-textobj-ruby'                                        | " Ruby function and class textobj
Plug 'bps/vim-textobj-python'                                      | " Python function and class textobj
Plug 'christoomey/vim-sort-motion'                                 | " Sort motion
Plug 'tpope/vim-commentary'                                        | " Comment motion
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} | " Intellisense
Plug 'vim-test/vim-test'                                           | " Run tests
Plug 'pseewald/vim-anyfold'                                        | " Language aware folds
Plug 'tpope/vim-dispatch'                                          | " Asynchronous arbitrary shell execution
Plug 'tpope/vim-endwise'                                           | " Automatically terminate ( ), do end, { } etc
Plug 'tpope/vim-fugitive'                                          | " Git integrations
Plug 'tpope/vim-repeat'                                            | " Support for repeating vim-surround motions
Plug 'tpope/vim-rhubarb'                                           | " Open browser with git object under cursor - context aware
Plug 'tpope/vim-unimpaired'                                        | " Navigate quickfix with ]q (next) [q (previous) entry shortcut
Plug 'tpope/vim-surround'                                          | " Change, add and delete surrounding characters around a target object
Plug 'unblevable/quick-scope'                                      | " Faster f, F, t amd T navigations
Plug 'mg979/vim-visual-multi'                                      | " Experimental: multiple cursors
Plug 'tpope/vim-dadbod'                                            | " Experimental: multiple cursors
Plug 'tpope/vim-rails'                                             | " Experimental: multiple cursors
Plug 'kristijanhusak/vim-dadbod-ui'

call plug#end()

set shell=fish

filetype plugin indent on
