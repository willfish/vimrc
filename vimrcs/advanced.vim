"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => anyfold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup anyfold
  autocmd Filetype * AnyFoldActivate
augroup END | " Anyfold: Enable polyglot folds in every buffer type

let anyfold_fold_comments=1
set foldlevel=99 | " Anyfold: Open folds to 99 folds deep

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup markdown
  au FileType markdown vnoremap <CR> :EasyAlign*<Bar><CR>
augroup END | " EasyAlign: Hit enter in Markdown to automatically align table

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lsp_extensions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

autocmd BufEnter,BufWinEnter,TabEnter *.rs lua require'lsp_extensions'.inlay_hints{ aligned = true}
autocmd BufEnter * lua require('completion').on_attach()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lua tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent><leader>n :NvimTreeToggle<CR>
nnoremap <silent><leader>nf :NvimTreeFindFile<cr>

augroup NvimTree
  autocmd FileType NvimTree nnoremap q :q<CR>
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup Colors
  colorscheme gruvbox-material

  autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
  autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
augroup END
