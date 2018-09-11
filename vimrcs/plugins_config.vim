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

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore "**/*.pyc"
  \ -g ""'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = 'left'
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

" let g:ale_linters = {
" \   'c': ['flawfinder', 'cppcheck'],
" \   'haml': ['haml-lint'],
" \   'erb': ['erubi'],
" \   'terraform': ['tflint'],
" \   'javascript': ['eslint'],
" \   'vim': ['vint'],
" \}

let g:ale_fixers = {
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
" => Vim-Terraform Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:terraform_align=1
let g:terraform_fold_sections=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Anyfold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let anyfold_activate=1
let anyfold_fold_comments=1
set foldlevel=7

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
" When pum is visible make tab/shift tab cycle through the options. Enter selects the completion
inoremap <expr><tab> pumvisible() ? "\<Down>" : "\<tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<Up>" : "\<S-Tab>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => WhiteSpace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
