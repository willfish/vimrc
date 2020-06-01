let g:fzf_command_prefix = 'Fzf' | " FZF: Set the prefix for exposed fzf commands
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore .terragrunt-cache --ignore temp_dirs -l -g ""' | " FZF: Speed up agging files

nnoremap <C-f> :FzfFiles<CR>
nnoremap <C-g> :FzfAg<CR>
nnoremap <leader>g :Ag<space>

let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=35

noremap <leader>n :NERDTreeToggle<cr> | " NerdTree: Open NerdTree
noremap <leader>nf :NERDTreeFind<cr>  | " NerdTree: Open active buffer in NerdTree

augroup nerdtree
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
  autocmd VimEnter * wincmd w
augroup END

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

noremap <silent> <Leader>i :Git<space>
noremap <silent> <Leader>b :Gblame<CR>
noremap <silent> <Leader>o :Gbrowse<CR>
noremap <silent> <Leader>s :Gstatus<CR>
noremap <silent> <Leader>] :Gpush<CR>
noremap <silent> <Leader>[ :Gpull<CR>
noremap <silent> <Leader>c :Gcommit<CR>

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
      \ 'coc-fish',
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
nmap <silent> grn <Plug>(coc-rename)
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

" " Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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
