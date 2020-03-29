set runtimepath^=~/.vim runtimepath+=~/.vim/after

let &packpath = &runtimepath

let g:ruby_path = []

let s:plugs = '~/.vim_runtime/vimrcs/plugs.vim'
let s:basic = '~/.vim_runtime/vimrcs/basic.vim'
let s:advanced = '~/.vim_runtime/vimrcs/advanced.vim'

execute 'source' s:plugs
execute 'source' s:basic
execute 'source' s:advanced

inoremap jk <esc>

if has('nvim')
  tnoremap jk <C-\><C-n>
  tnoremap <Esc> <C-\><C-n>
endif

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

execute 'nnoremap <leader>evp :edit' s:plugs '<CR>'
execute 'nnoremap <leader>evb :edit' s:basic '<CR>'
execute 'nnoremap <leader>eva :edit' s:advanced '<CR>'
