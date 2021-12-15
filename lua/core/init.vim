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
    " bdelete
    execut "xa"
  endif
endfunction
