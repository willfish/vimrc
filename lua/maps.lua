local default_opts = {noremap = true, silent = true}
local expression_opts = {noremap = true, silent = true, expr = true}

local init_vim = "~/.vim_runtime/init.vim"
local init_lua = "~/.vim_runtime/lua/init.lua"
local opts = "~/.vim_runtime/lua/opts.lua"
local maps = "~/.vim_runtime/lua/maps.lua"
local unmigratable = "~/.vim_runtime/vimrcs/unmigratable.vim"
local plugins = "~/.vim_runtime/lua/plugins.lua"
local advanced = "~/.vim_runtime/lua/advanced.lua"

-- Config file normal maps
vim.api.nvim_set_keymap("n", "<Leader>ev", ":edit" .. init_vim .. "<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>evi", ":edit" .. init_lua .. "<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>evo", ":edit" .. opts .. "<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>evm", ":edit" .. maps .. "<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>evu", ":edit" .. unmigratable .. "<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>evp", ":edit" .. plugins .. "<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>eva", ":edit" .. advanced .. "<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>sv", ":source" .. init_vim .. "<CR>", default_opts)

-- Normal mode maps
vim.api.nvim_set_keymap("n", "Q", "<Nop>", default_opts)
vim.api.nvim_set_keymap("n", "0", "^", default_opts)
vim.api.nvim_set_keymap("n", "^", "0", default_opts)
vim.api.nvim_set_keymap("n", "<Space>", "za", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>w", ":w!<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>q", ":wq!<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>v", ":vsplit<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":only<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>.", ":copen<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>`", "<c-w>=", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>/", ":!%:p<CR>", default_opts)

-- Insert mode maps
vim.api.nvim_set_keymap("i", "jk", "<Esc>", default_opts)
vim.api.nvim_set_keymap("i", "kj", "<Esc>", default_opts)
vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', expression_opts)
vim.api.nvim_set_keymap("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', expression_opts)
--
-- Terminal mode maps
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", default_opts)
vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", default_opts)
vim.api.nvim_set_keymap("t", "kj", "<C-\\><C-n>", default_opts)

-- Visual mode maps
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", default_opts) -- Visually select and move lines up and down
vim.api.nvim_set_keymap("v", "K", ":m '>-2<CR>gv=gv", default_opts) -- Visually select and move lines up and down

-- Utilities maps
--
-- Multiple replace with s*
-- hit . to repeatedly replace a change to the word under the cursor
vim.api.nvim_set_keymap("n", "s*", ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn", default_opts) --
vim.api.nvim_set_keymap("x", "s*", '"sy:let @/=@s<CR>cgn', default_opts)

vim.api.nvim_set_keymap("x", "<leader>d", 'c<c-r>=system(\'base64 --decode\', @")<cr><esc>', default_opts)
vim.api.nvim_set_keymap("x", "<leader>e", 'c<c-r>=system(\'base64\', @")<cr><esc>', default_opts)
