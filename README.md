# Fishy Vim Configuration

Portable neovim configuration tailored for my needs.

## Principles

- *Lua* - Plugins and configuration should be in lua which is significantly faster than vimscript and way nicer IMO.
- *Use Vim's language* - Most of the plugins I use extend vim's natural language - adding targets and motions that can be repeated. Motions include commenting and sorting. Targets include classes, methods, urls, indents, lines and more.
- *Modular config* - Each config file should be loadable without the others and can be hacked on individually.
- *Evolution* - I'm constantly improving/speeding up/learning new convenient ways of having a better workflow.
- *Speed* - I always try to have the least number of keystrokes to achieve what I need.

## Prequisites

- neovim
- nodejs
- ruby
- python

## Setup

```bash
git clone http://github.com/willfish/vimrc.git ~/<path/to/repos>
cd ~/path/to/repos/vimrc
./setup.sh
```

Now open vim and run `:PackerInstall`

## Configuration

- See [init] configuration file for initialisation and configuration I can't do without.
- See [maps] configuration file for normal, visual and terminal mode maps.
- See [opts] configuration file for changes to the out of the box configuration of neovim.
- See [plugins] for a list of installed plugins.
- See [advanced] for plugin configuration.

I'm part way through a migration to 100% lua and still have a [vimrc] of to-be-migrated vimscript.

## Useful vim normal mappings

A list of commands that I find useful and that it is worth you being aware of.

**NB**: `<leader>` is defined as `,` (comma).

- `jk`: goes to normal mode from insert and terminal modes.
- `<leader>sv`: Source all vim configuration files.
- `<leader>ev`: Edit the init vim configuration script.
- `<leader>evi`: Edit the init lua configuration script (soon to replace ev).
- `<leader>evm`: Edit the maps lua configuration script.
- `<leader>evp`: Edit the plugin lua configuration script.
- `<leader>eva`: Edit the advanced lua configuration script.
- `<leader>v`: vertical split
- `<ctrl>f`: opens project wide file search
- `<ctrl>g`: opens project wide word search
- `<leader>n`: toggles file tree
- `<leader>x`: Run tests nearest to the cursor in the current file.
- `<leader>t`: Run tests in current file.
- `<leader>r`: Run all tests in current project.
- `<leader>e`: Run last invocation of tests (nearest, current file, all).
- `<leader>l`: Switch to last ran test file.

[init]:     https://github.com/willfish/vimrc/tree/master/lua/init.lua
[maps]:     https://github.com/willfish/vimrc/tree/master/lua/maps.lua
[opts]:     https://github.com/willfish/vimrc/tree/master/lua/opts.lua
[plugins]:  https://github.com/willfish/vimrc/tree/master/lua/plugins.lua
[advanced]: https://github.com/willfish/vimrc/tree/master/lua/advanced.lua
[vimrc]:    https://github.com/willfish/vimrc/tree/master/vimrcs/unmigratable.vim
