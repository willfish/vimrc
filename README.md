# Vim Configuration

Portable neovim configuration configured for MacOS.

## Prequisites

- [asdf](https://asdf-vm.com/#/)
- nodejs 13.11.0 (npm -g install neovim)
- ruby 2.7.0 (gem install neovim solargraph)
- python 3.7.5 (pip install neovim)
- nerd font installed (brew cask install font-hack-nerd-font) and configured

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

- `jk`: goes to normal mode from insert and terminal modes.
- `<leader>sv`: Source the main vim configuration script.
- `<leader>ev`: Edit the main vim configuration script.
- `<leader>evb`: Edit the basic vim configuration script.
- `<leader>eva`: Edit the advanced vim configuration script.
- `<leader>evp`: Edit the plugin vim configuration script.
- `<leader>v`: vertical split
- `<alt>up/down/left/right`: moves to split in desired direction
- `<ctrl>f`: opens fuzzy file search
- `<leader>n`: toggles Nerdtree
- `<leader>nf`: open current file in Nerdtree on left
- `<leader>x`: Run tests nearest to the cursor in the current file.
- `<leader>t`: Run tests in current file.
- `<leader>r`: Run all tests in current project.
- `<leader>e`: Run last invocation of tests (nearest, current file, all).
- `<leader>l`: Switch to last ran test file.

## Plugins

See [plugs] for descriptions and live plugins I am using

[init]:     https://github.com/willfish/vimrc/tree/master/init.vim
[basic]:    https://github.com/willfish/vimrc/tree/master/vimrcs/basic.vim
[advanced]: https://github.com/willfish/vimrc/tree/master/vimrcs/advanced.vim
[plugs]:    https://github.com/willfish/vimrc/tree/master/vimrcs/plugs.vim
