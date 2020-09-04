" => General settings

set clipboard+=unnamedplus | " Use os clipboard for copy and paste
set expandtab              | " Use spaces instead of tabs
set hidden                 | " A buffer becomes hidden when it is abandoned
set history=200            | " Limit history for commands, etc - default is 100000
set lazyredraw             | " Don't redraw while executing macros (good performance config)
set linebreak              | " Linebreak on 500 characters
set list                   | " Show special characters
set number
set relativenumber
set scrolloff=7            | " Set 7 lines to the cursor - when moving vertically using j/k
set shiftwidth=2           | " 1 tab == 4 spaces
set shell=fish             | " 1 tab == 4 spaces
set showmatch              | " Show matching brackets when text indicator is over them
set smartindent
set splitright             | " Split right
set tabstop=2              | " 1 tab == 4 spaces
set termguicolors          | " Enables 24-bit RGB color in the TUI
set textwidth=500          | " Linebreak on 500 characters
set undodir=~/.vim_runtime/temp_dirs/undodir
set undofile
set wrap                   | " Wrap lines
set colorcolumn=120

set nobackup
set noswapfile
set nowritebackup

set wildignore=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,_build,*.o,*~,*.pyc | " Ignore version control and os files
" set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»  | " Show special characters
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:$,precedes:«,extends:»  | " Show special characters

nnoremap <silent> <Space> za
nnoremap <silent> <leader>w :w!<cr>
nnoremap <silent> <leader>q :wq!<cr>
nnoremap <silent> <leader>v :vsplit<cr>
nnoremap <silent> <leader><leader> :only<cr>
nnoremap <silent> <leader>` <c-w>=
if has('unix')
  " In ubuntu I use awesome window manager and navigate between tiles using these keys
  " Keeping for reference

  " nnoremap <silent> <A-k> :wincmd k<CR>
  " nnoremap <silent> <A-j> :wincmd j<CR>
  " nnoremap <silent> <A-h> :wincmd h<CR>
  " nnoremap <silent> <A-l> :wincmd l<CR>
else
  nnoremap <silent> ˚ :wincmd k<CR>
  nnoremap <silent> ∆ :wincmd j<CR>
  nnoremap <silent> ˙ :wincmd h<CR>
  nnoremap <silent> ¬ :wincmd l<CR>
endif
nnoremap 0 ^
nnoremap ^ 0

" Multiple replace with s*
" hit . to repeatedly replace a change to the word under the cursor
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

augroup preserve_last_position
  " Return to last edit position when opening files (You want this!)
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup helpfiles
  " Enable q to quit file
  autocmd FileType help nnoremap q :q<CR>
augroup END

function! CmdLine(str)
  exe 'menu Foo.Bar :' . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute 'normal! vgvy'

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", '', '')

  if a:direction ==# 'gv'
    call CmdLine("Ag \"" . l:pattern . "\" " )
  elseif a:direction ==# 'replace'
    call CmdLine('%s' . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
