filetype off

set shell=fish

filetype plugin indent on

function! PackagerInit() abort
  packadd vim-packager

  call packager#init()
  call packager#add('sainnhe/gruvbox-material')        | " Theme
  call packager#add('junegunn/vim-easy-align')         | " Align stuff
  call packager#add('sheerun/vim-polyglot')            | " Language syntax highlighting on steroids
  call packager#add('tpope/vim-bundler')               | " Gemfile syntax highlighting
  call packager#add('kana/vim-textobj-user')           | " Api for textobj creation
  call packager#add('kana/vim-textobj-line')           | " Line textobj
  call packager#add('b4winckler/vim-angry')            | " Argument textobj
  call packager#add('glts/vim-textobj-comment')        | " Comment textobj
  call packager#add('michaeljsmith/vim-indent-object') | " Indent textobj
  call packager#add('tek/vim-textobj-ruby')            | " Ruby function and class textobj
  call packager#add('bps/vim-textobj-python')          | " Python function and class textobj
  call packager#add('christoomey/vim-sort-motion')     | " Sort motion
  call packager#add('tpope/vim-commentary')            | " Comment motion
  call packager#add('vim-test/vim-test')               | " Run tests
  call packager#add('pseewald/vim-anyfold')            | " Language aware folds
  call packager#add('tpope/vim-dispatch')              | " Asynchronous arbitrary shell execution
  call packager#add('tpope/vim-endwise')               | " Automatically terminate ( ), do end, { } etc
  call packager#add('tpope/vim-fugitive')              | " Git integrations
  call packager#add('tpope/vim-repeat')                | " Support for repeating vim-surround motions
  call packager#add('tpope/vim-rhubarb')               | " Open browser with git object under cursor - context aware
  call packager#add('tpope/vim-unimpaired')            | " Navigate quickfix with ]q (next) [q (previous) entry shortcut
  call packager#add('tpope/vim-surround')              | " Change, add and delete surrounding characters around a target object
  call packager#add('tpope/vim-rails')                 | " Rails support

  call packager#add('tjdevries/nlua.nvim')             | " Sensible lua lsp configuration
  call packager#add('neovim/nvim-lspconfig')           | " A compendium of built in lsp configuration settings
  call packager#add('nvim-lua/completion-nvim')        | " Built in lsp completion
  call packager#add('nvim-lua/diagnostic-nvim')        | " Built in lsp diagnostics
  call packager#add('euclidianAce/BetterLua.vim')      | " More sophisticated lua syntax highlighting
  call packager#add('nvim-lua/lsp_extensions.nvim')    | " Rust type annotations on every line
  call packager#add('kyazdani42/nvim-tree.lua')        | " Replacement for NerdTree/CocExplorer
  call packager#add('nvim-lua/popup.nvim') 
  call packager#add('nvim-lua/plenary.nvim')
  call packager#add('nvim-telescope/telescope.nvim')   | " Fuzzy list popups - branches, files, strings
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()
