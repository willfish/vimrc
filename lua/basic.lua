local M = {}

function M.setup()
  function setup_options()
    vim.o.clipboard="unnamedplus"
    vim.o.colorcolumn="120"
    vim.o.history=200
    vim.o.scrolloff=7
    vim.o.shell="fish"
    vim.o.shiftwidth=2
    vim.o.tabstop=2
    vim.o.textwidth=500
    vim.o.undodir="~/.vim_runtime/temp_dirs/undodir"

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

  function setup_mappings()
    function setup_normal_mode_mappings()
      vim.api.nvim_set_keymap('n', '<Space>',          'za',          { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>w',        ':w!<CR>',     { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>q',        ':wq!<CR>',    { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>v',        ':vsplit<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':only<CR>',   { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>`',        '<c-w>=',      { noremap = true, silent = true })
    end

    function setup_insert_mode_mappings()
    end

    function setup_visual_mode_mappings()
    end

    setup_normal_mode_mappings()
    setup_insert_mode_mappings()
    setup_visual_mode_mappings()
  end

  setup_options()
  setup_mappings()
end

return M
