local lspconfig = require('lspconfig')
local actions = require('telescope.actions')

require('telescope').setup {
  mappings = {
    i = {
      ["<esc>"] = actions.close,
      ["<c-k>"] = actions.move_selection_next,
      ["<c-j>"] = actions.move_selection_prev,
    }
  }
}

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
lspconfig.sumneko_lua.setup{}
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
