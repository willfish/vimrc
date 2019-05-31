"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Lf_ShortcutF = '<C-f>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open Ag and put the cursor in the right position
map <leader>g :Rg<space>

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let g:MRU_Max_Entries = 400
map <leader>m :MRU<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden=0
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let g:NERDTreeShowHidden=1
map <leader>n :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
augroup nerdtree
  autocmd Filetype 'rb' vimenter * NERDTree
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
  autocmd VimEnter * wincmd w
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>a :ALEFix<CR>
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
  au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
  au BufRead,BufNewFile *.eex set filetype=eelixir
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

let g:deoplete#enable_at_startup = 1
" When pum is visible make tab/shift tab cycle through the options. Enter selects the completion
inoremap <expr><tab> pumvisible() ? "\<Down>" : "\<tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<Up>" : "\<S-Tab>"

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

nmap <silent> <Leader>x :TestNearest<CR>
nmap <silent> <Leader>t :TestFile<CR>
nmap <silent> <Leader>r :TestSuite<CR>
nmap <silent> <Leader>e :TestLast<CR>
nmap <silent> <Leader>l :TestVisit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <silent> <Leader>i :Git<space>
nmap <silent> <Leader>b :Gblame<CR>
nmap <silent> <Leader>o :Gbrowse<CR>
nmap <silent> <Leader>s :Gstatus<CR>
nmap <silent> <Leader>p :Gpush<CR>
nmap <silent> <Leader>c :Gcommit<CR>
