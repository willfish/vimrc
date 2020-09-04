let g:dbs = {
\  'dev': 'rails:.'
\ }
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => quickscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_command_prefix = 'Fzf' | " FZF: Set the prefix for exposed fzf commands
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore .terragrunt-cache --ignore temp_dirs -l -g ""' | " FZF: Speed up agging files

nnoremap <silent> <C-f> :FzfFiles<CR>
nnoremap <C-g> :FzfAg<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => anyfold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup anyfold
  autocmd Filetype * AnyFoldActivate
augroup END | " Anyfold: Enable polyglot folds in every buffer type

let anyfold_fold_comments=1
set foldlevel=99 | " Anyfold: Open folds to 99 folds deep

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-test
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let test#strategy = {
      \ 'nearest': 'basic',
      \ 'file':    'dispatch',
      \ 'suite':   'dispatch_background',
      \}

let test#ruby#rspec#executable = 'bundle exec rspec'

nnoremap <silent> <Leader>x :TestNearest<CR>
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>r :TestSuite<CR>
nnoremap <silent> <Leader>e :TestLast<CR>
nnoremap <silent> <Leader>l :TestVisit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <Leader>i :Git<space>
nnoremap <silent> <Leader>b :Gblame<CR>
nnoremap <silent> <Leader>o :Gbrowse<CR>
vnoremap <silent> <Leader>o :Gbrowse<CR>
nnoremap <silent> <Leader>s :Gstatus<CR>
nnoremap <silent> <Leader>] :Gpush<CR>
nnoremap <silent> <Leader>[ :Gpull<CR>
nnoremap <silent> <Leader>c :Gcommit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

let g:coc_global_extensions = [
      \ 'coc-cfn-lint',
      \ 'coc-css',
      \ 'coc-docker',
      \ 'coc-elixir',
      \ 'coc-explorer',
      \ 'coc-fish',
      \ 'coc-go',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-lua',
      \ 'coc-markdownlint',
      \ 'coc-pairs',
      \ 'coc-python',
      \ 'coc-rls',
      \ 'coc-sh',
      \ 'coc-snippets',
      \ 'coc-solargraph',
      \ 'coc-sql',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ 'coc-yank'
      \]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>g :CocSearch<space>
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> <leader>f <Plug>(coc-format)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent><leader>n :CocCommand explorer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup markdown
  au FileType markdown vnoremap <CR> :EasyAlign*<Bar><CR>
augroup END | " EasyAlign: Hit enter in Markdown to automatically align table

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme gruvbox-material
