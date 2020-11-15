"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_command_prefix = 'Fzf' | " FZF: Set the prefix for exposed fzf commands
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore .terragrunt-cache --ignore temp_dirs -l -g ""' | " FZF: Speed up agging files

nnoremap <silent> <C-f> :FzfFiles<CR>
nnoremap <C-g> :FzfAg<CR>
nnoremap gb :FzfGBranches<CR>

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
nnoremap <silent> <Leader>s :Gstatus<CR>
nnoremap <silent> <Leader>] :Gpush<CR>
nnoremap <silent> <Leader>[ :Gpull<CR>
nnoremap <silent> <Leader>c :Gcommit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup markdown
  au FileType markdown vnoremap <CR> :EasyAlign*<Bar><CR>
augroup END | " EasyAlign: Hit enter in Markdown to automatically align table

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lsp_extensions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set completeopt=menuone,noinsert,noselect

let g:diagnostic_enable_virtual_text = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua vim.cmd('packadd nvim-lspconfig')
lua vim.cmd('packadd completion-nvim')
lua vim.cmd('packadd diagnostic-nvim')

lua require('lspconfig').bashls.setup{}
lua require('lspconfig').dockerls.setup{}
lua require('lspconfig').flow.setup{}
lua require('lspconfig').html.setup{}
lua require('lspconfig').jsonls.setup{}
lua require('lspconfig').pyls.setup{}
lua require('lspconfig').rust_analyzer.setup{}
lua require('lspconfig').solargraph.setup{}
lua require('lspconfig').sqlls.setup{}
lua require('lspconfig').sumneko_lua.setup{}
lua require('lspconfig').terraformls.setup{}
lua require('lspconfig').tsserver.setup{}
lua require('lspconfig').vimls.setup{}
lua require('lspconfig').yamlls.setup{}

nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>

autocmd BufEnter,BufWinEnter,TabEnter *.rs lua require'lsp_extensions'.inlay_hints{ aligned = true}
autocmd BufEnter * lua require('completion').on_attach()
autocmd BufEnter * lua require('diagnostic').on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

command! LspReload :lua vim.lsp.stop_client(vim.lsp.get_active_clients()) | :edit

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerd tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent><leader>n :NERDTreeToggle<CR>
nnoremap <silent><leader>nf :NERDTreeFind<cr>

 augroup nerdtree
   " Enable q to nerdtree file
   " autocmd FileType nerdtree nnoremap q :q<CR>
 augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme gruvbox-material
