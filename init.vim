set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/.config/nvim runtimepath+=~/.vim_runtime
let &packpath = &runtimepath

lua require 'init'
