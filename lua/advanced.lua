local M = {}
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

function M.setup()
  lspconfig.bashls.setup{}
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
end

return M
