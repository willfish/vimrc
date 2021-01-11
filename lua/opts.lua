-- Global options

vim.g.rubypath = {}
vim.g.mapleader = ","

-- Set global options
vim.o.clipboard = "unnamedplus"
vim.o.history = 200
vim.o.shiftwidth = 2
vim.o.undodir = "/home/william/.vim_runtime/temp_dirs/undodir"
vim.o.inccommand = "split"
vim.o.backup = false
vim.o.hidden = true
vim.o.lazyredraw = true
vim.o.showmatch = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.writebackup = false
vim.o.wildignore = "*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,_build,*.o,*~,*.pyc"
vim.o.listchars = "tab:→ ,nbsp:␣,trail:•,eol:$,precedes:«,extends:»"
vim.o.shortmess = "filnxtToOFc"
vim.o.completeopt = "menuone,noinsert,noselect"

-- Mixture Window
vim.o.colorcolumn = "120"
vim.wo.colorcolumn = "120"
vim.o.scrolloff = 7
vim.wo.scrolloff = 7
vim.o.linebreak = true
vim.wo.linebreak = true
vim.o.list = true
vim.wo.list = true
vim.o.number = true
vim.wo.number = true
vim.o.relativenumber = true
vim.wo.relativenumber = true
vim.o.wrap = true
vim.wo.wrap = true

-- Mixture Buffer
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.textwidth = 500
vim.bo.textwidth = 500
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.swapfile = false
vim.bo.swapfile = false
vim.o.undofile = true
vim.bo.undofile = true
