local vim = vim
local M = {}

function M.setup()
  function M.setup_options()
    vim.o.clipboard="unnamedplus"
    vim.o.colorcolumn="120"
    vim.o.history=200
    vim.o.scrolloff=7
    vim.o.shell="fish"
    vim.o.shiftwidth=2
    vim.o.tabstop=2
    vim.o.textwidth=500
    vim.o.undodir="~/.vim_runtime/temp_dirs/undodir"
    vim.o.inccommand="split"

    vim.o.backup=false
    vim.o.expandtab=true
    vim.o.hidden=true
    vim.o.lazyredraw=true
    vim.o.linebreak=true
    vim.o.list=true
    vim.o.number=true
    vim.o.relativenumber=true
    vim.o.showmatch=true
    vim.o.smartindent=true
    vim.o.splitright=true
    vim.o.swapfile=false
    vim.o.termguicolors=true
    vim.o.undofile=true
    vim.o.wrap=true
    vim.o.writebackup=false

    vim.o.wildignore="*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,_build,*.o,*~,*.pyc"
    vim.o.listchars="tab:→ ,nbsp:␣,trail:•,eol:$,precedes:«,extends:»"
  end

  function M.setup_mappings()
    function M.setup_normal_mode_mappings()
      vim.api.nvim_set_keymap('n', '<Space>',          'za',          { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>w',        ':w!<CR>',     { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>q',        ':wq!<CR>',    { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>v',        ':vsplit<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':only<CR>',   { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>`',        '<c-w>=',      { noremap = true, silent = true })

      if vim.api.nvim_eval('has("unix")') == 1 then
        vim.api.nvim_set_keymap('n', '<A-h>', ':wincmd h<CR>', { noremap = true, silent = true })
        -- vim.api.nvim_set_keymap('n', '<A-j>', ':wincmd j<CR>', { noremap = true, silent = true })
        -- vim.api.nvim_set_keymap('n', '<A-k>', ':wincmd k<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<A-l>', ':wincmd l<CR>', { noremap = true, silent = true })
      else
        vim.api.nvim_set_keymap('n', '˙', ':wincmd h<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '∆', ':wincmd j<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '˚', ':wincmd k<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '¬', ':wincmd l<CR>', { noremap = true, silent = true })
      end
    end

    function M.setup_insert_mode_mappings()
    end

    function M.setup_visual_mode_mappings()
    end

    M.setup_normal_mode_mappings()
    M.setup_insert_mode_mappings()
    M.setup_visual_mode_mappings()
  end

  function M.setup_augroups()
  end

  M.setup_options()
  M.setup_mappings()
  M.setup_augroups()
end

return M
