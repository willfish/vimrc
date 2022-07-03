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
        use "wuelnerdotexe/vim-enfocado" -- Theme with treesitter compatibility
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"} -- Symbolic syntax highlighting
        use "sheerun/vim-polyglot" -- Language syntax highlighting on steroids
        use "tpope/vim-bundler" -- Gemfile syntax highlighting

        use "junegunn/vim-easy-align" -- Align stuff
        use "vim-test/vim-test" -- Run tests
        use "dense-analysis/ale" -- Asynchronous linter
        use "pseewald/vim-anyfold" -- Language aware folds
        use "stefandtw/quickfix-reflector.vim" -- Makes quickfix writeable - for example for a dynamic find and replace
        use "honza/vim-snippets"

        use {"neoclide/coc.nvim", branch = "release"} -- LSP client and convention over configuration configurator

        use "nvim-telescope/telescope.nvim" -- Fuzzy list popups - branches, files, strings
        use "nvim-telescope/telescope-github.nvim" -- Telescope integration for the github cli
        use "nvim-telescope/telescope-fzy-native.nvim" -- Compiled and significantly faster fzf sorter for telescope
        use "nvim-lua/popup.nvim" -- Handy popup api written in lua
        use "nvim-lua/plenary.nvim" -- Brings in convenience functions for common lua behaviour
        use "preservim/nerdtree" -- File/folder editor/viewer

        use "RRethy/nvim-treesitter-textsubjects" -- textobj expansion using treesitter symbols
        use "kana/vim-textobj-user" -- Api for textobj creation
        use "kana/vim-textobj-line" -- Line textobj
        use "whatyouhide/vim-textobj-xmlattr" -- Xml Attribute textobj
        use "b4winckler/vim-angry" -- Argument textobj
        use "glts/vim-textobj-comment" -- Comment textobj
        use "michaeljsmith/vim-indent-object" -- Indent textobj
        use "tek/vim-textobj-ruby" -- Ruby function and class textobj
        use "bps/vim-textobj-python" -- Python function and class textobj
        use "kana/vim-textobj-function" -- Vimscript function textobj
        use "christoomey/vim-sort-motion" -- Sort motion
        use "tpope/vim-commentary" -- Comment motion
        use { "AckslD/nvim-revJ.lua", requires = { "sgur/vim-textobj-parameter" } } -- Reverse join
        use "nvim-treesitter/playground" -- Visual representation of treesitter symbols
        use 'RRethy/nvim-treesitter-endwise' -- tpope endwise replacement that works with scheme treesitter definitions for wayyyy more languages

        use "tpope/vim-dispatch" -- Asynchronous arbitrary shell execution
        use "tpope/vim-fugitive" -- Git integrations
        use "tpope/vim-repeat" -- Support for repeating vim-surround motions
        use "tpope/vim-rhubarb" -- Open browser with git object under cursor - context aware
        use "tpope/vim-unimpaired" -- Navigate quickfix with ]q (next) [q (previous) entry shortcut
        use "tpope/vim-surround" -- Change, add and delete surrounding characters around a target object
        use "tpope/vim-rails" -- Rails support

        use "kevinhwang91/nvim-bqf" -- Enhanced quickfix - especially filtering
    end
)
