set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/.config/nvim runtimepath+=~/.vim_runtime runtimepath+=~/.local/share/nvim

let &packpath = &runtimepath

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

lua require 'init'
