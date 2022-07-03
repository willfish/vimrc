set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/.config/nvim runtimepath+=~/Repositories/vimrc/ runtimepath+=~/.local/share/nvim

let &packpath = &runtimepath

lua require 'init'
