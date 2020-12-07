vim.api.nvim_command("set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/.config/nvim")
vim.api.nvim_command("let &packpath = &runtimepath")

-- Basic configuration
require('opts') -- Global, Window and Buffer configuration options
require('maps') -- Normal, Insert, Visual, Terminal mode mappings

-- Advanced configuration
require('plugins') -- Pack plugins
require('advanced') -- Pack plugins configuration

-- Need to be migrated to lua <3
vim.cmd('source ~/.vim_runtime/vimrcs/unmigratable.vim')
vim.cmd('source ~/.vim_runtime/vimrcs/advanced.vim')
