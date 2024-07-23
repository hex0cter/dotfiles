" Enable line number
" set number

" Enable syntax highlighting
syntax enable

" Remember cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
endif
