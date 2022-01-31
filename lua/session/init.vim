" ===============================================================
"  在vim启动时使用 -c ':call LoadSession()' 参数可以开启session
"  ~~该功能已有用lua实现的插件了~~
" ===============================================================

" 不保存blank类型的session（defx侧边栏)
set sessionoptions-=blank
" session保存目录
let g:session_dir = $HOME . '/.vim/sessions'
" 文件命名规则
let g:session_path = g:session_dir . "/" . substitute(getcwd(), '/', '_', 'g') . ".vim"

" 只有当Load后才开启session功能
let g:is_start_session = 0

" vim关闭时保存session
function! SaveSession()
  if g:is_start_session == 1
    if (!isdirectory(g:session_dir))
      call mkdir(g:session_dir)
    endif
    execute "mksession! " . g:session_path
  endif
endfunction

" vim打开时载入session
" autocmd VimEnter * nested call LoadSession()
function! LoadSession()
  if argc() == 0
    if filereadable(g:session_path)
      execute "source " . g:session_path
    endif
  endif
  let g:is_start_session = 1
  autocmd VimLeave * nested call SaveSession()
endfunction
