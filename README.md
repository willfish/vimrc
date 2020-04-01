# Vim Configuration

Portable neovim configuration configured for MacOS.

## Prequisites

- [asdf](https://asdf-vm.com/#/)
- nodejs 13.11.0
    - neovim
- ruby 2.7.0
    - neovim
    - solargraph
- python 3.7.5
    - neovim
- nerd font installed (brew cask install font-hack-nerd-font) and configured (see terminal docs for this)

## Setup

```bash
git clone http://github.com/willfish/vimrc.git ~/<path/to/repos>
cd ~/path/to/repos/vimrc
./setup.sh
```

Now open vim and run `:PlugInstall`

## Configuration

- See [init] configuration file for initialisation setup.
- See [basic] configuration file for basic configuration.
- See [advanced] plugin configuration file for more convenience commands.
- See [plugs] for a list of installed plugins.

## Custom Commands

A list of commands that I find useful and that it is worth you being aware of.

**NB**: `<leader>` is defined as , (comma).

-   `jk`: goes to normal mode from insert and terminal modes.
-   `<leader>sv`: Source the main vim configuration script.
-   `<leader>ev`: Edit the main vim configuration script.
-   `<leader>evb`: Edit the basic vim configuration script.
-   `<leader>eva`: Edit the advanced vim configuration script.
-   `<leader>evp`: Edit the plugin vim configuration script.
-   `<leader>v`: vertical split
-   `<leader>h`: horizontal split
-   `<alt>up/down/left/right`: moves to split in desired direction
-   `<ctrl>f`: opens fuzzy file search
-   `<ctrl>l`: opens fuzzy line selecter (current buffer)
-   `<ctrl>b`: opens fuzzy branch switcher
-   `<ctrl>h`: opens fuzzy vim help navigation
-   `<leader>n`: toggles Nerdtree
-   `<leader>nf`: open current file in buffer in Nerdtree
-   `<leader>x`: Run tests nearest to the cursor in the current file.
-   `<leader>t`: Run tests in current file.
-   `<leader>r`: Run all tests in current project.
-   `<leader>e`: Run last invocation of tests (nearest, current file, all).
-   `<leader>l`: Switch to last ran test file.

## Plugins

-   [fzf.vim](https://github.com/junegunn/fzf.vim) is a fuzzy file finder invoked by hitting Ctrl-F in normal mode and typing some part of the file name you'd like to open.
-   [COC](https://github.com/neoclide/coc.nvim) Auto Completion and intellisense framework
-   [ale](https://github.com/w0rp/ale) Asynchronous linting of many languages.
-   [mru](https://github.com/yegappan/mru) Stores a list of recently opened files `<leader>m`
-   [nerdtree](https://github.com/scrooloose/nerdtree) puts a directory tree on the left side of the screen. Press `<leader>n` to open it at your project root, or `<leader>nf` to open it with the current file selected. You can press `m` to move, delete, or create files. Press `?` inside the tree to get more help.
-   [palenight.vim](https://github.com/drewtempelmeyer/palenight.vim) Theme I enjoy
-   [quickfix-reflector.vim](https://github.com/stefandtw/quickfix-reflector.vim) Supporting global find and replace in quickfix list populated with results on a RipGrep query (`<leader>g`)
-   [vim-airline](https://github.com/vim-airline/vim-airline) Super useful and beautiful status bar. Good for definitely letting you know about modes with Ale linting integration.
-   [vim-angry](https://github.com/b4winckler/vim-angry) Target argument objects. Super powerful if you want to delete an argument in a function or simply move them around.
-   [vim-anyfold](https://github.com/pseewald/vim-anyfold) In the name really. Supports folds in all the languages.
-   [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace) Automates removal of whitespace on file save callback.
-   [vim-bundler](https://github.com/tpope/vim-bundler) Adds syntax highlighting for Gemfile and Gemfile.lock
-   [vim-commentary](https://github.com/tpope/vim-commentary) Creates motions for comments `gcac` (go comment a comment), `gcap` (go comment a paragraph).
-   [vim-dispatch](https://github.com/tpope/vim-dispatch) Amazing parallelisation plugin for performing actions in separate terminal tabs (used in this config for running rails console/server and full suite tests in separate terminal windows - enabling me to get on with editing the current file).
-   [vim-easy-align](https://github.com/junegunn/vim-easy-align) Stupid easy way of commenting a visual selection with the align verb `ga=`.
-   [vim-endwise](https://github.com/tpope/vim-endwise) Auto terminate different do/end constructs in various languages.
-   [vim-fugitive](https://github.com/tpope/vim-fugitive) puts git into vim.
-   [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object) Target the current level of indentation. Useful for sorting Gemfile sections `gsii` (go sort inner indentation)
-   [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) Not flawless but useful for manipulating text with multiple cursors. I usually visually select a column with `<ctrl>v` and then hit `<ctrl>n` to create cursors for each line.
-   [vim-polyglot](https://github.com/sheerun/vim-polyglot) All the languages support
-   [vim-rails](https://github.com/tpope/vim-rails) Supports everything Rails.
-   [vim-repeat](https://github.com/tpope/vim-repeat) Enables repeating tpope's vim-surround plugin motions.
-   [vim-rhubarb](https://github.com/tpope/vim-rhubarb) Enables github integration for vim-fugitive. Enables opening github urls for easy sharing, etc.
-   [ag.vim](https://github.com/rking/ag.vim) Open a quickfix list of search terms with ([a faster grep replacement](https://github.com/ggreer/the_silver_searcher))
-   [vim-sort-motion](https://github.com/christoomey/vim-sort-motion) Provides a motion for sorting target objects `gsap` (go sort a paragraph)
-   [vim-speeddating](https://github.com/tpope/vim-speeddating) Incredible `<ctrl-a>`/`<ctrl-x>` support for dates/times in iso formats.
-   [vim-surround](https://github.com/tpope/vim-surround) Useful way of manipulating surround objects `ds{` (delete first surrounding {} around current cursor)
-   [vim-test](https://github.com/janko-m/vim-test) Quickly run tests in many different languages/project types.
-   [vim-textobj-comment](https://github.com/glts/vim-textobj-comment) Creates a target object for comments `dac` (delete a comment)
-   [vim-textobj-fold](https://github.com/kana/vim-textobj-fold) Creates a target object for folds `daz` (delete a fold)
-   [vim-textobj-line](https://github.com/kana/vim-textobj-line) Creates a target object for lines `dil` (delete in a line)
-   [vim-textobj-rubyblock](https://github.com/nelstrom/vim-textobj-rubyblock) Creates a target object for ruby (and happily elixir) blocks `dar` (delete a ruby block)
-   [vim-textobj-user](https://github.com/kana/vim-textobj-user) Support plugin for simplifying other textobj plugins.
-   [vim-unimpaired](https://github.com/tpope/vim-unimpaired) Provides useful mappings for adding lines/navigating background quickfix files/lint suggestions

[init]:     https://github.com/willfish/vimrc/tree/master/init.vim
[basic]:    https://github.com/willfish/vimrc/tree/master/vimrcs/basic.vim
[advanced]: https://github.com/willfish/vimrc/tree/master/vimrcs/advanced.vim
[plugs]:    https://github.com/willfish/vimrc/tree/master/vimrcs/plugs.vim
