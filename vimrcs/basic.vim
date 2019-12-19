"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termguicolors
try
  colorscheme palenight
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Generic settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_macvim')
  set clipboard=unnamed
  set hlsearch

  " Move current window more easily
  nnoremap <silent> <M-Up> :wincmd k<CR>
  nnoremap <silent> <M-Down> :wincmd j<CR>
  nnoremap <silent> <M-Left> :wincmd h<CR>
  nnoremap <silent> <M-Right> :wincmd l<CR>
else
  set clipboard+=unnamedplus
  nnoremap <silent> <A-Up> :wincmd k<CR>
  nnoremap <silent> <A-Down> :wincmd j<CR>
  nnoremap <silent> <A-Left> :wincmd h<CR>
  nnoremap <silent> <A-Right> :wincmd l<CR>
endif


" set shell=fish
set mouse=a

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let g:mapleader = ','

" Show special characters
set list

nnoremap <Space> za

" Fast saving/quitting

nnoremap <silent> <leader>w :w!<cr>
nnoremap <silent> <leader>Q :q!<cr>
nnoremap <silent> <leader>q :wq!<cr>

" Fast splitting

nnoremap <silent> <leader>v :vsplit<cr>
nnoremap <silent> <leader>h :split<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,_build

" A buffer becomes hidden when it is abandoned
set hidden
set whichwrap+=<,>,h,l
set smartcase
" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2
set timeoutlen=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc anyway...
set nobackup
set nowritebackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set linebreak
set textwidth=500

set smartindent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
augroup preserve_last_position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switch 0 and ^ functionality
nnoremap 0 ^
nnoremap ^ 0

if has('mac') || has('macunix')
  nnoremap <D-j> <M-j>
  nnoremap <D-k> <M-k>
  nnoremap <D-j> <M-j>
  nnoremap <D-k> <M-k>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber
set number

highlight WhiteOnRed ctermbg=white guibg=red

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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



""""""""""""""""""""""""""""""
" => Aptly.conf syntax
""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead aptly.conf set syntax=json
