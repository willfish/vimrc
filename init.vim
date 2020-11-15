set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/.config/nvim

let &packpath = &runtimepath

let g:ruby_path = []
let g:mapleader = ','

let s:basic = '~/.vim_runtime/vimrcs/basic.vim'
let s:setup = '~/.vim_runtime/vimrcs/setup.vim'
let s:packs = '~/.vim_runtime/vimrcs/packs.vim'
let s:advanced = '~/.vim_runtime/vimrcs/advanced.vim'

execute 'source' s:basic
execute 'source' s:setup
execute 'source' s:packs
execute 'source' s:advanced

nnoremap 0 ^
nnoremap ^ 0
inoremap jk <esc>
inoremap kj <esc>

if has('nvim')
  tnoremap jk <C-\><C-n>
  tnoremap <Esc> <C-\><C-n>
endif

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

execute 'nnoremap <leader>evp :edit' s:packs '<CR>'
execute 'nnoremap <leader>evb :edit' s:basic '<CR>'
execute 'nnoremap <leader>eva :edit' s:advanced '<CR>'

