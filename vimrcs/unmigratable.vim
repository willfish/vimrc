xnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
xnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

augroup preserve_last_position
  autocmd!
  " Return to last edit position when opening files (You want this!)
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup helpfiles
  autocmd!
  " Enable q to quit file
  autocmd FileType help,qf,fugitive nnoremap q :q<CR>
augroup END

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

augroup LuaYank
  autocmd!
  autocmd TextYankPost * silent! lua require('vim.highlight').on_yank()
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => anyfold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup anyfold
  autocmd!
  autocmd Filetype * AnyFoldActivate
augroup END | " Anyfold: Enable polyglot folds in every buffer type

let anyfold_fold_comments=1
set foldlevel=10 | " Anyfold: Open folds to 99 folds deep

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup markdown
  autocmd!
  autocmd FileType markdown vnoremap <CR> :EasyAlign*<Bar><CR>
augroup END | " EasyAlign: Hit enter in Markdown to automatically align table

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lsp_extensions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup lsp_extensions
  autocmd!
  autocmd BufEnter,BufWinEnter,TabEnter *.rs lua require'lsp_extensions'.inlay_hints{ aligned = true}
  " autocmd BufEnter * lua require('completion').on_attach()
augroup END

augroup lsp_formatting
  autocmd!
  autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup Colors
  colorscheme gruvbox

  autocmd!
  autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
  autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
augroup END
