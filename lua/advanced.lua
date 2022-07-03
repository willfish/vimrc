local default_map_opts = {noremap = true, silent = true}

-- Custom utils

local default_opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<Leader>wn", ":lua require('wallpaper').next_wallpaper()<CR>", default_opts)
vim.api.nvim_set_keymap("n", "<Leader>wp", ":lua require('wallpaper').previous_wallpaper()<CR>", default_opts)

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
    ensure_installed = "all",
    highlight = {
        enable = true
    },
    textsubjects = {
        enable = true,
        keymaps = {
            ["."] = "textsubjects-smart"
        }
    },
    endwise = {
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

vim.api.nvim_set_keymap("n", "<Leader>i", ":Git ", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>b", ":Git blame<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>o", ":GBrowse<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>s", ":Git<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>c", ":Git commit<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>]", ":Git push<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<Leader>[", ":Git pull<CR>", default_map_opts)

-- NerdTree

vim.api.nvim_set_keymap("n", "<leader>n", ":NERDTreeToggle<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<leader>nf", ":NERDTreeFind<CR>", default_map_opts)

-- Ale

vim.api.nvim_set_keymap("n", "<leader>a", ":ALEFix<CR>", default_map_opts)
vim.api.nvim_set_keymap("n", "<leader>fa", ":Dispatch git ls-files -m | grep '.rb' | xargs bundle exec rubocop -A<CR>", default_map_opts)
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
ale_fixers["python"] = {"black", "autoflake"}
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

-- bqf - filterable quickfix

require("bqf").setup(
    {
        auto_enable = true,
        preview = {
            auto_preview = false,
            win_height = 12,
            win_vheight = 12,
            delay_syntax = 80,
            border_chars = {"┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█"}
        },
        func_map = {
            vsplit = "",
            ptogglemode = "z,",
            stoggleup = ""
        },
        filter = {
            fzf = {
                action_for = {["ctrl-s"] = "split"},
                extra_opts = {"--bind", "ctrl-o:toggle-all", "--prompt", "> "}
            }
        }
    }
)

-- anyfold

-- Folding can be expensive in larger files so I've moved to invoking this as I need it
vim.api.nvim_set_keymap("n", "<Leader>z", ":AnyFoldActivate<CR>", default_opts)
vim.o.foldlevel = 1
