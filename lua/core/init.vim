" 光标定位上次退出位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

" 关闭buf
function! ExitTab()
  if len(getbufinfo({'buflisted':1})) > 1 |
    let del_bn=buffer_number()
    bprevious
    execut "bdelete " . del_bn
  else |
    bdelete
  endif
endfunction

" 文件类型缩进
au FileType c,go set ts=4 sw=4
au FileType html,php,javascript,css,vue set ts=4 sw=4 expandtab
au FileType lua,sh,yaml,vim,json,proto,xml set ts=2 sw=2 expandtab

" 自动保存
au textchanged,textchangedi *.md,*.go,*.php,*.lua,*.sh,*.vim silent write

au FileType markdown inoremap ;u [](<ESC>"+pa)<ESC>F[a
au FileType markdown inoremap ;i ![](<ESC>"+pa)<ESC>F[a
au FileType markdown inoremap ;c ```<CR>```<C-o>k

" split 空白分隔线
set fillchars+=vert:\ 

source ~/.config/nvim/lua/session/init.vim
