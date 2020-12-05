local default_map_opts = { noremap = true, silent = true }

-- Ag (global text search)

vim.api.nvim_set_keymap('n', '<Leader>g', ':Ag<space>',     default_map_opts)

-- Telescope (file finder)

vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope find_files<CR>',   default_map_opts)
vim.api.nvim_set_keymap('n', '<C-g>', ':Telescope live_grep<CR>',    default_map_opts)
vim.api.nvim_set_keymap('n', '<C-b>', ':Telescope git_branches<CR>', default_map_opts)

-- vim-test

vim.api.nvim_set_var(
  "test#strategy",
  {
    nearest = "basic",
    file = "dispatch",
    suite = "dispatch_background",
  }
)

vim.api.nvim_set_var("test#ruby#rspec#executable", "bundle exec rspec")

vim.api.nvim_set_keymap('n', '<Leader>x', ':TestNearest<CR>', default_map_opts)
vim.api.nvim_set_keymap('n', '<Leader>t', ':TestFile<CR>',    default_map_opts)
vim.api.nvim_set_keymap('n', '<Leader>r', ':TestSuite<CR>',   default_map_opts)
vim.api.nvim_set_keymap('n', '<Leader>e', ':TestLast<CR>',    default_map_opts)
vim.api.nvim_set_keymap('n', '<Leader>l', ':TestVisit<CR>',   default_map_opts)

-- vim-fugitive

vim.api.nvim_set_keymap('n', '<Leader>i', ':Git<CR>',     default_map_opts)
vim.api.nvim_set_keymap('n', '<Leader>b', ':Gblame<CR>',  default_map_opts)
vim.api.nvim_set_keymap('n', '<Leader>o', ':Gbrowse<CR>', default_map_opts)
vim.api.nvim_set_keymap('n', '<Leader>s', ':Gstatus<CR>', default_map_opts)
vim.api.nvim_set_keymap('n', '<Leader>c', ':Gcommit<CR>',  default_map_opts)
vim.api.nvim_set_keymap('n', '<Leader>]', ':Gpush<CR>',   default_map_opts)
vim.api.nvim_set_keymap('n', '<Leader>[', ':Gpull<CR>',   default_map_opts)
