local default_map_opts = { noremap = true, silent = true }

-- Ag (global text search)

vim.api.nvim_set_keymap('n', '<Leader>g', ':Ag<space>',     default_map_opts)

-- Telescope (file finder)

local actions = require('telescope.actions')


vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope find_files<CR>',   default_map_opts)
vim.api.nvim_set_keymap('n', '<C-g>', ':Telescope live_grep<CR>',    default_map_opts)
vim.api.nvim_set_keymap('n', '<C-b>', ':Telescope git_branches<CR>', default_map_opts)

require('telescope').setup {
  mappings = {
    i = {
      ["<esc>"] = actions.close,
      ["<c-k>"] = actions.move_selection_next,
      ["<c-j>"] = actions.move_selection_prev,
    }
  }
}

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

-- lspconfig
--
local lspconfig = require('lspconfig')

vim.g.diagnostic_enable_virtual_text = 1
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

default_opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<Leader>a', '<cmd>lua vim.lsp.buf.formatting()<CR>', default_opts)
vim.api.nvim_set_keymap('n', 'gd',        '<cmd>lua vim.lsp.buf.definition()<CR>', default_opts)
vim.api.nvim_set_keymap('n', 'gr',        '<cmd>lua vim.lsp.buf.references()<CR>', default_opts)
vim.api.nvim_set_keymap('n', 'gn',        '<cmd>lua vim.lsp.buf.rename()<CR>',     default_opts)
vim.api.nvim_set_keymap('n', 'K',         '<cmd>lua vim.lsp.buf.hover()<CR>',      default_opts)

lspconfig.bashls.setup{}
lspconfig.clangd.setup{}
lspconfig.dockerls.setup{}
lspconfig.flow.setup{}
lspconfig.html.setup{}
lspconfig.jsonls.setup{}
lspconfig.pyls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.solargraph.setup{}
lspconfig.sqlls.setup{}
lspconfig.terraformls.setup{}
lspconfig.tsserver.setup{}
lspconfig.vimls.setup{}
lspconfig.yamlls.setup{}

lspconfig.sumneko_lua.setup{
  cmd = {"lua-language-server"},
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"},
        disable = {"lowercase-global", "unused-function"},
      },
      completion = {
        keywordSnippet = "Enable",
      },
      runtime = {version = "LuaJIT", path = vim.split(package.path, ';'),},
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
}
