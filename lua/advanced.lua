local default_map_opts = {noremap = true, silent = true}
-- Ag (global text search)

vim.api.nvim_set_keymap("n", "<Leader>g", ":Ag<space>", default_map_opts)

-- Telescope (file finder)

local actions = require("telescope.actions")

vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope find_files<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<C-g>", ":Telescope live_grep<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<C-b>", ":Telescope git_branches<CR>", default_map_opts)

require("telescope").setup {
    mappings = {
        i = {
            ["<esc>"] = actions.close,
            ["<c-k>"] = actions.move_selection_next,
            ["<c-j>"] = actions.move_selection_prev
        }
    }
}

-- vim-test

vim.api.nvim_set_var(
    "test#strategy",
    {
        nearest = "basic",
        file = "dispatch",
        suite = "dispatch_background"
    }
)

vim.api.nvim_set_var("test#ruby#rspec#executable", "bundle exec rspec")

vim.api.nvim_set_keymap("n", "<Leader>x", ":TestNearest<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>t", ":TestFile<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>r", ":TestSuite<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>e", ":TestLast<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>l", ":TestVisit<CR>", default_map_opts)

-- vim-fugitive

vim.api.nvim_set_keymap("n", "<Leader>i", ":Git", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>b", ":Gblame<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>o", ":Gbrowse<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>s", ":Gstatus<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>c", ":Gcommit<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>]", ":Gpush<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>[", ":Gpull<CR>", default_map_opts)

-- lspconfig

local lspconfig = require("lspconfig")
local completion = require("completion")

local on_attach = function(client, bufnr)
    completion.on_attach(client, bufnr)
end

vim.g.diagnostic_enable_virtual_text = 1

default_opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "<Leader>a", "<cmd>lua vim.lsp.buf.formatting()<CR>", default_opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", default_opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", default_opts)
vim.api.nvim_set_keymap("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>", default_opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", default_opts)

lspconfig.bashls.setup {on_attach = on_attach}
lspconfig.clangd.setup {on_attach = on_attach}
lspconfig.dockerls.setup {on_attach = on_attach}
lspconfig.gopls.setup {on_attach = on_attach}
lspconfig.html.setup {on_attach = on_attach}
lspconfig.jsonls.setup {on_attach = on_attach}
lspconfig.pyls.setup {on_attach = on_attach}
lspconfig.rust_analyzer.setup {on_attach = on_attach}
lspconfig.solargraph.setup {on_attach = on_attach}
lspconfig.sqlls.setup {on_attach = on_attach}
lspconfig.terraformls.setup {on_attach = on_attach}
lspconfig.flow.setup {on_attach = on_attach}
lspconfig.vimls.setup {on_attach = on_attach}
lspconfig.yamlls.setup {on_attach = on_attach}

lspconfig.sumneko_lua.setup {
    cmd = {"lua-language-server"},
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"},
                disable = {"lowercase-global", "unused-function", "undefined-global"}
            },
            runtime = {version = "LuaJIT", path = vim.split(package.path, ";")},
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            }
        }
    }
}


-- completion.nvim

-- vim.o.completeopt = { "menuone" , "noinsert", "noselect" }

-- -- Don't show the dumb matching stuff.
-- vim.cmd [[set shortmess+=c]]

-- -- completion.nvim
-- vim.g.completion_confirm_key = ""
-- vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
-- -- vim.g.completion_enable_snippet = 'snippets.nvim'
--
