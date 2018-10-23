"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commentary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map cm <Plug>Commentary

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Lf_ShortcutF = '<C-f>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dash
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <S-k> :Dash<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open Ag and put the cursor in the right position
map <leader>g :Ag

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let g:MRU_Max_Entries = 400
map <leader>m :MRU<CR>

" runtime macros/matchit.vim
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
  " autocmd vimenter * NERDTree
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = 'goimports'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>a :ALEFix<CR>
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\   'javascript': ['eslint'],
\   'bash': ['shfmt'],
\   'sh': ['shfmt']
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
let g:mix_format_on_save = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Anyfold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let anyfold_activate=1
let anyfold_fold_comments=1
set foldlevel=99

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1
" When pum is visible make tab/shift tab cycle through the options. Enter selects the completion
inoremap <expr><tab> pumvisible() ? "\<Down>" : "\<tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<Up>" : "\<S-Tab>"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => WhiteSpace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-rspec
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rspec_command = 'Dispatch bundle exec rspec {spec}'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>x :call RunNearestSpec()<CR>
map <Leader>e :call RunLastSpec()<CR>
map <Leader>r :call RunAllSpecs()<CR>
