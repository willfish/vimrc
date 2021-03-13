set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/.config/nvim runtimepath+=~/.vim_runtime runtimepath+=~/.local/share/nvim

let &packpath = &runtimepath

lua require 'init'
