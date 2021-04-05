local default_map_opts = {noremap = true, silent = true}

-- Ag (global text search)

vim.api.nvim_set_keymap("n", "<Leader>g", ":Ag<space>", default_map_opts)

-- Telescope (file finder)

require("telescope").setup {
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " > ",
        color_devicons = true,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = require("telescope.actions").send_to_qflist
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
}

require("telescope").load_extension("gh")
require("telescope").load_extension("fzy_native")

vim.api.nvim_set_keymap("n", "<C-f>", ":lua require('telescope.builtin').find_files()<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<C-g>", ":lua require('telescope.builtin').live_grep()<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>ff", ":lua require('telescope.builtin').find_files()<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>fe", ":lua require('telescope.builtin').file_browser()<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>fb", ":lua require('telescope.builtin').git_branches()<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>fc", ":lua require('telescope.builtin').git_commits()<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>fi", ":lua require('telescope').extensions.gh.issues()<CR>", default_map_opts)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>fp",
    ":lua require('telescope').extensions.gh.pull_request()<CR>",
    default_map_opts
)

-- Treesitter

require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true
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
vim.api.nvim_set_keymap("n", "<Leader>c", ":Git commit<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>]", ":Git push<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>[", ":Git pull<CR>", default_map_opts)

-- lspconfig

local lspconfig = require("lspconfig")
local completion = require("completion")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
    completion.on_attach(client, bufnr)
end

vim.g.diagnostic_enable_virtual_text = 1

vim.api.nvim_set_keymap("n", "<Leader>a", "<cmd>lua vim.lsp.buf.formatting()<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", default_map_opts)

lspconfig.bashls.setup {on_attach = on_attach}
lspconfig.clangd.setup {on_attach = on_attach}
lspconfig.dockerls.setup {on_attach = on_attach}
lspconfig.flow.setup {on_attach = on_attach}
lspconfig.gopls.setup {on_attach = on_attach}
lspconfig.html.setup {capabilities = capabilities, on_attach = on_attach}
lspconfig.html.setup {on_attach = on_attach}
lspconfig.jsonls.setup {on_attach = on_attach}
lspconfig.pyls.setup {on_attach = on_attach}
lspconfig.rust_analyzer.setup {on_attach = on_attach}
lspconfig.solargraph.setup {on_attach = on_attach}
lspconfig.sqlls.setup {on_attach = on_attach}
lspconfig.terraformls.setup {on_attach = on_attach}
lspconfig.vimls.setup {on_attach = on_attach}
lspconfig.yamlls.setup {on_attach = on_attach}

local sumneko_root_path = "/home/" .. vim.fn.expand("$USER") .. "/.config/nvim/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

lspconfig.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {version = "LuaJIT", path = vim.split(package.path, ";")},
            diagnostics = {
                globals = {"vim"},
                disable = {"lowercase-global", "unused-function", "undefined-global"}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            }
        }
    },
    on_attach = on_attach
}

lspconfig.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            }
        }
    }
}

-- CHADtree

vim.api.nvim_set_keymap("n", "<leader>n", ":CHADopen<CR>", default_map_opts)

-- Ale

vim.api.nvim_set_keymap("n", "<leader>a", ":ALEFix<CR>", default_map_opts)

vim.g.ale_ruby_rubocop_executable = "bundle"
vim.g.ale_ruby_rubocop_options = "-c .rubocop.yml"
vim.g.ale_set_highlights = 0
vim.g.ale_lint_delay = 2000

local ale_fixers = {}

ale_fixers["*"] = {"remove_trailing_lines", "trim_whitespace"}
ale_fixers["bash"] = {"shfmt"}
ale_fixers["css"] = {"prettier"}
ale_fixers["elixir"] = {"mix_format"}
ale_fixers["go"] = {"gofmt"}
ale_fixers["haml"] = {"haml-lint"}
ale_fixers["html"] = {"prettier"}
ale_fixers["javascript"] = {"eslint"}
ale_fixers["json"] = {"prettier"}
ale_fixers["lua"] = {"luafmt"}
ale_fixers["markdown"] = {"prettier"}
ale_fixers["ruby"] = {"rubocop"}
ale_fixers["rust"] = {"rustfmt"}
ale_fixers["scss"] = {"prettier"}
ale_fixers["sh"] = {"shfmt"}
ale_fixers["sql"] = {"pgformatter"}
ale_fixers["terraform"] = {"terraform"}
ale_fixers["yaml"] = {"prettier"}

vim.g.ale_fixers = ale_fixers

-- EasyAlign

local easy_align_delimiters = {}

easy_align_delimiters["-"] = {pattern = "\\-\\+", delimiter_align = "l", ignore_groups = {"!Comment"}}

vim.g.easy_align_delimiters = easy_align_delimiters

-- revj - reverse joining

require("revj").setup {
    enable_default_keymaps = true
}

