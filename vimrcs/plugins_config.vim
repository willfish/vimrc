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
  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = 'goimports'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_linters = {
\   'haml': ['haml-lint'],
\   'erb': ['erubi'],
\   'ruby': ['brakeman', 'rails_best_practices', 'rubocop'],
\   'javascript': ['eslint'],
\   'vim': ['vint'],
\}

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'javascript': ['eslint'],
\}
