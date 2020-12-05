vim.cmd('packadd packer.nvim')

require('packer').startup(
  function()
    use 'sainnhe/gruvbox-material'        -- Theme
    use 'junegunn/vim-easy-align'         -- Align stuff
    use 'sheerun/vim-polyglot'            -- Language syntax highlighting on steroids
    use 'tpope/vim-bundler'               -- Gemfile syntax highlighting
    use 'kana/vim-textobj-user'           -- Api for textobj creation
    use 'kana/vim-textobj-line'           -- Line textobj
    use 'b4winckler/vim-angry'            -- Argument textobj
    use 'glts/vim-textobj-comment'        -- Comment textobj
    use 'michaeljsmith/vim-indent-object' -- Indent textobj
    use 'tek/vim-textobj-ruby'            -- Ruby function and class textobj
    use 'bps/vim-textobj-python'          -- Python function and class textobj
    use 'christoomey/vim-sort-motion'     -- Sort motion
    use 'tpope/vim-commentary'            -- Comment motion
    use 'vim-test/vim-test'               -- Run tests
    use 'pseewald/vim-anyfold'            -- Language aware folds
    use 'tpope/vim-dispatch'              -- Asynchronous arbitrary shell execution
    use 'tpope/vim-endwise'               -- Automatically terminate ( ), do end, { } etc
    use 'tpope/vim-fugitive'              -- Git integrations
    use 'tpope/vim-repeat'                -- Support for repeating vim-surround motions
    use 'tpope/vim-rhubarb'               -- Open browser with git object under cursor - context aware
    use 'tpope/vim-unimpaired'            -- Navigate quickfix with ]q (next) [q (previous) entry shortcut
    use 'tpope/vim-surround'              -- Change, add and delete surrounding characters around a target object
    use 'tpope/vim-rails'                 -- Rails support

    use 'tjdevries/nlua.nvim'             -- Sensible lua lsp configuration
    use 'neovim/nvim-lspconfig'           -- A compendium of built in lsp configuration settings
    use 'nvim-lua/completion-nvim'        -- Built in lsp completion
    use 'nvim-lua/diagnostic-nvim'        -- Built in lsp diagnostics
    use 'nvim-lua/lsp_extensions.nvim'    -- Rust type annotations on every line
    use 'kyazdani42/nvim-tree.lua'        -- Replacement for NerdTree/CocExplorer
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'   -- " Fuzzy list popups - branches, files, strings

    use 'epmatsw/ag.vim'
    use 'stefandtw/quickfix-reflector.vim'
    use 'kana/vim-textobj-function.git'
    use 'euclidianAce/BetterLua.vim'      -- More sophisticated lua syntax highlighting
  end
)
