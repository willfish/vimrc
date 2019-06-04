"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Lf_ShortcutF = '<C-f>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open Ag and put the cursor in the right position
noremap <leader>g :Rg<space>

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let g:MRU_Max_Entries = 400
noremap <leader>m :MRU<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden=0
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let g:NERDTreeShowHidden=1

noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>nf :NERDTreeFind<cr>

augroup nerdtree
  " autocmd Filetype ruby NERDTree
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
  autocmd VimEnter * wincmd w
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <leader>a :ALEFix<CR>

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \   'bash': ['shfmt'],
      \   'sh': ['shfmt'],
      \   'elixir': ['mix_format'],
      \   'terraform': ['terraform']
      \}

let g:ale_set_highlights = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay=2000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Alchemist and elixir related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup elixir
  autocmd BufRead,BufNewFile *.ex,*.exs set filetype=elixir
  autocmd BufRead,BufNewFile *.eex set filetype=eelixir
augroup END
" let g:mix_format_on_save = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Anyfold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup anyfold
  autocmd Filetype * AnyFoldActivate
augroup END

let anyfold_fold_comments=1
set foldlevel=99

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
" let g:deoplete#enable_at_startup = 1
" When pum is visible make tab/shift tab cycle through the options. Enter selects the completion
" inoremap <expr><tab> pumvisible() ? "\<Down>" : "\<tab>"
" inoremap <expr><S-Tab> pumvisible() ? "\<Up>" : "\<S-Tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => WhiteSpace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-test
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'dispatch',
  \ 'suite':   'dispatch',
\}

nnoremap <silent> <Leader>x :TestNearest<CR>
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>r :TestSuite<CR>
nnoremap <silent> <Leader>e :TestLast<CR>
nnoremap <silent> <Leader>l :TestVisit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make Gdiff default to vertical diff
set diffopt+=vertical

noremap <silent> <Leader>i :Git<space>
noremap <silent> <Leader>b :Gblame<CR>
noremap <silent> <Leader>o :Gbrowse<CR>
noremap <silent> <Leader>s :Gstatus<CR>
noremap <silent> <Leader>] :Gpush<CR>
noremap <silent> <Leader>[ :Gpull<CR>
noremap <silent> <Leader>d :Gvdiff<CR>
noremap <silent> <Leader>c :Gcommit<CR>
