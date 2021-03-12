local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
    if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
        return
    end

    local directory = string.format("%s/site/pack/packer/opt/", vim.fn.stdpath("data"))

    vim.fn.mkdir(directory, "p")

    local out =
        vim.fn.system(
        string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
    )

    print(out)
    print("Downloading packer.nvim...")

    return
end

require("packer").startup(
    function()
        -- Look
        use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}} -- Theme with treesitter compatibility
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"} -- Symbolic syntax highlighting
        use "sheerun/vim-polyglot" -- Language syntax highlighting on steroids
        use "tpope/vim-bundler" -- Gemfile syntax highlighting

        -- Feel
        use "junegunn/vim-easy-align" -- Align stuff
        use "vim-test/vim-test" -- Run tests
        use "pseewald/vim-anyfold" -- Language aware folds
        use "dense-analysis/ale" -- Asynchronous linter
        use "epmatsw/ag.vim" -- Wicked fast global find
        use "stefandtw/quickfix-reflector.vim" -- Makes quickfix writeable - for example for a dynamic find and replace

        -- LSP (Language Server Protocol) and lua
        use "tjdevries/nlua.nvim" -- Sensible lua lsp configuration
        use "neovim/nvim-lspconfig" -- A compendium of built in lsp configuration settings
        use "nvim-lua/completion-nvim" -- Built in lsp completion
        use "nvim-lua/diagnostic-nvim" -- Built in lsp diagnostics
        use "nvim-lua/lsp_extensions.nvim" -- Rust type annotations on every line
        use "nvim-lua/popup.nvim" -- Handy popup api written in lua
        use "nvim-lua/plenary.nvim" -- Brings in convenience functions for common lua behaviour
        use "nvim-telescope/telescope.nvim" -- Fuzzy list popups - branches, files, strings
        use "nvim-telescope/telescope-github.nvim" -- Telescope integration for the github cli
        use "nvim-telescope/telescope-fzy-native.nvim" -- Compiled and significantly faster fzf sorter for telescope
        use "ms-jpq/chadtree.git" -- Amazing file tree written in lua
        use "euclidianAce/BetterLua.vim" -- More sophisticated lua syntax highlighting

        -- Vim in a browser - experimenting with this currently
        use {"glacambre/firenvim", run = ":call firenvim#install(0)"}

        -- Text objects and motions
        use "kana/vim-textobj-user" -- Api for textobj creation
        use "kana/vim-textobj-line" -- Line textobj
        use "b4winckler/vim-angry" -- Argument textobj
        use "glts/vim-textobj-comment" -- Comment textobj
        use "michaeljsmith/vim-indent-object" -- Indent textobj
        use "tek/vim-textobj-ruby" -- Ruby function and class textobj
        use "bps/vim-textobj-python" -- Python function and class textobj
        use "kana/vim-textobj-function.git" -- Vimscript function textobj
        use "christoomey/vim-sort-motion" -- Sort motion
        use "tpope/vim-commentary" -- Comment motion

        -- tpope is productive and adds so much value
        use "tpope/vim-dispatch" -- Asynchronous arbitrary shell execution
        use "tpope/vim-endwise" -- Automatically terminate ( ), do end, { } etc
        use "tpope/vim-fugitive" -- Git integrations
        use "tpope/vim-repeat" -- Support for repeating vim-surround motions
        use "tpope/vim-rhubarb" -- Open browser with git object under cursor - context aware
        use "tpope/vim-unimpaired" -- Navigate quickfix with ]q (next) [q (previous) entry shortcut
        use "tpope/vim-surround" -- Change, add and delete surrounding characters around a target object
        use "tpope/vim-rails" -- Rails support
    end
)
