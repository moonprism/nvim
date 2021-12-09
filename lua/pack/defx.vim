autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('call', 'DefxOpenView')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> t
        \ defx#do_action('drop', 'tabedit')
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('call', 'DefxOpenView')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> O
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> dd
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> D
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> sp
        \ defx#do_action('multi',[['drop','split']])
  nnoremap <silent><buffer><expr> vs
        \ defx#do_action('multi',[['drop','vsplit']])
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <2-LeftMouse> defx#do_action('call', 'DefxOpenView')
endfunction

function! DefxOpenView(_)
  if defx#is_directory()
    call defx#call_action('open_tree')
  else
    call defx#call_action('drop')
    execute 'Defx'
  endif
endfunction

autocmd FileType defx set nonumber

call defx#custom#option('_', {
      \ 'columns': 'mark:indent:git:space:icons:space:filename',
      \ 'split': 'floating',
      \ 'ignored_files': ".git",
      \ 'toggle': 1,
      \ 'root_marker': '[in]: ',
      \ 'wincol': &columns / 2.5,
      \ 'winrow': &lines / 6,
      \ 'winwidth': 50,
      \ 'winheight': 20,
      \ })

" 设置defx图标
call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })

" 设置defx git图标
call defx#custom#column('git', 'indicators', {
      \ 'Modified'  : '•',
      \ 'Staged'    : '+',
      \ 'Untracked' : 'ᵁ',
      \ 'Renamed'   : '>',
      \ 'Unmerged'  : '≠',
      \ 'Ignored'   : 'ⁱ',
      \ 'Deleted'   : 'x',
      \ 'Unknown'   : '?'
      \ })
