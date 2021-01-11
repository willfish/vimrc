" => General settings
" Multiple replace with s*
" hit . to repeatedly replace a change to the word under the cursor
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

xnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
xnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

xnoremap <leader>d c<c-r>=system('base64 --decode', @")<cr><esc>
xnoremap <leader>e c<c-r>=system('base64', @")<cr><esc>

augroup preserve_last_position
  autocmd!
  " Return to last edit position when opening files (You want this!)
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup helpfiles
  autocmd!
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

augroup LuaYank
  autocmd!
  autocmd TextYankPost * silent! lua require('vim.highlight').on_yank()
augroup END


" Ale linter
noremap <leader>a :ALEFix<CR>

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \   'haml': ['haml-lint'],
      \   'html': ['prettier'],
      \   'yaml': ['prettier'],
      \   'lua': ['luafmt'],
      \   'json': ['prettier'],
      \   'css': ['prettier'],
      \   'scss': ['prettier'],
      \   'markdown': ['prettier'],
      \   'bash': ['shfmt'],
      \   'sh': ['shfmt'],
      \   'elixir': ['mix_format'],
      \   'terraform': ['terraform']
      \}

let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_rubocop_options = '-c .rubocop.yml'
let g:ale_set_highlights = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay=2000

" EasyAlign
let g:easy_align_delimiters = {
      \  '-': { 'pattern': '\-\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
\ }
