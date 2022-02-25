"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_command_prefix = 'Fzf' | " FZF: Set the prefix for exposed fzf commands
let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore .terragrunt-cache --ignore temp_dirs -l -g ""' | " FZF: Speed up agging files

nnoremap <C-p> :FzfFiles<CR>
" Map <C-r> back to redo
nnoremap <C-r> :redo<CR>
nnoremap <C-f> :FzfAg<CR>
nnoremap <C-b> :FzfBuffers<CR>

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>g :Ack<space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => anyfold
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup anyfold
  autocmd Filetype * AnyFoldActivate
augroup END | " Anyfold: Enable polyglot folds in every buffer type

let anyfold_fold_comments=1
set foldlevel=99 | " Anyfold: Open folds to 99 folds deep

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-test
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let test#strategy = {
      \ 'nearest': 'neovim',
      \ 'file':    'dispatch',
      \ 'suite':   'dispatch_background',
      \}

let test#ruby#rspec#executable = 'bundle exec rspec'

"Testing
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :w<CR> :TestNearest<CR>
nmap <silent> t<C-f> :w<CR> :TestFile<CR>
nmap <silent> t<C-s> :w<CR> :TestSuite<CR>
nmap <silent> t<C-l> :w<CR> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vnoremap <silent> <leader>git :Gbrowse<CR>
nnoremap <silent> <leader>git :Gbrowse<CR>
nnoremap <silent> <Leader>i :Git<space>
nnoremap <silent> <Leader>b :Gblame<CR>
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
      \ 'coc-css',
      \ 'coc-docker',
      \ 'coc-elixir',
      \ 'coc-explorer',
      \ 'coc-fish',
      \ 'coc-sh',
      \ 'coc-go',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-markdownlint',
      \ 'coc-pairs',
      \ 'coc-python',
      \ 'coc-rls',
      \ 'coc-snippets',
      \ 'coc-solargraph',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ 'coc-yank'
      \]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <C-m> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-n> <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gh<Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" ALE setup to fix on save
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \  'go': ['goimports', 'gofmt'],
" \  'rust': ['rustfmt'],
" \}

" let g:ale_go_gofmt_options = '-s'
" let g:ale_go_bingo_executable = 'gopls'
" autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
" let g:airline#extensions#ale#enabled = 1
" let g:ale_go_golangci_lint_options = '--fast -c ~/.golangci.yml '
" let g:ale_go_golangci_lint_package = 1
" let g:ale_fix_on_save = 1
" let g:ale_set_balloons = 1
" let g:airline#extensions#ale#enabled = 1
" let g:ale_set_highlights = 0
" let g:ale_sign_column_always = 1
" let g:ale_completion_enabled = 1


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
" colorscheme nord
