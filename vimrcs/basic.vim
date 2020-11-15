" => General settings

lua require('basic').setup()

if has('unix')
  nnoremap <silent> <A-k> :wincmd k<CR>
  nnoremap <silent> <A-j> :wincmd j<CR>
  nnoremap <silent> <A-h> :wincmd h<CR>
  nnoremap <silent> <A-l> :wincmd l<CR>
else
  " These strange symbols are what you get when you type Alt+h/j/k/l together on Mac
  nnoremap <silent> ˚ :wincmd k<CR>
  nnoremap <silent> ∆ :wincmd j<CR>
  nnoremap <silent> ˙ :wincmd h<CR>
  nnoremap <silent> ¬ :wincmd l<CR>
endif

" Multiple replace with s*
" hit . to repeatedly replace a change to the word under the cursor
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

xnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
xnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

xnoremap <leader>d c<c-r>=system('base64 --decode', @")<cr><esc>
xnoremap <leader>e c<c-r>=system('base64', @")<cr><esc>

augroup preserve_last_position
  " Return to last edit position when opening files (You want this!)
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup helpfiles
  " Enable q to quit file
  autocmd FileType help nnoremap q :q<CR>
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
