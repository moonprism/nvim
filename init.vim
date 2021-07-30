"======================================================================
" 基础设置
"======================================================================

" 关闭兼容模式
set nocompatible
" 内部编码
set encoding=utf-8
" 禁用交换文件
set noswapfile
" 延迟绘制
set lazyredraw
" 设置行号
set number
" 高亮光标所在行
set cursorline
" 自动缩进
set smartindent
" 搜索时忽略大小写
set ignorecase
" 高亮搜索
set hlsearch

" 指令前缀
let mapleader="\<space>"

" 系统复制选中文本
noremap ,y "+y
" 粘贴复制专用寄存器
noremap <Leader>p "0p

" jkjkjk
inoremap jk <ESC>

" ?
xnoremap <Leader>e <ESC>

" 附加b关闭高亮搜索功能
nnoremap <silent> b :<C-u>nohl<CR>b

" 退出快捷键
nnoremap <Leader>q :xa<CR>

" 快速插入空行
nnoremap <Leader>o o<ESC>

" 选中块
nnoremap vib {jV}

" 快速播放宏
nnoremap ,a @a

"----------------------------------------------------------------------
" 文件设置
"----------------------------------------------------------------------

" 自动保存
set autowriteall
" 开启重做日志
set undofile
set undodir=~/.vim/undodir


"----------------------------------------------------------------------
" session设置
"----------------------------------------------------------------------

" 不保存blank类型的session（defx侧边栏)
set sessionoptions-=blank
" session保存目录
let g:session_dir = $HOME . '/.vim/sessions'
" 文件命名规则
let g:session_path = g:session_dir . "/" . substitute(getcwd(), '/', '_', 'g') . ".vim"

" 只有当Load后才开启session功能
let g:is_start_session = 0

" vim关闭时保存session
autocmd VimLeave * nested call SaveSession()
function! SaveSession()
  if g:is_start_session == 1
    if (!isdirectory(g:session_dir))
      call mkdir(g:session_dir)
    endif
    execute "mksession! " . g:session_path
  endif
endfunction

" vim打开时自动载入session
" autocmd VimEnter * nested call LoadSession()
function! LoadSession()
  if argc() == 0
    if filereadable(g:session_path)
      execute "source " . g:session_path
      call DefxStart()
      execute "wincmd w"
    else
      call DefxStart()
    endif
  endif
  let g:is_start_session = 1
endfunction
" 手动载入session
nnoremap <silent> <Leader>s :call LoadSession()<CR>

" 单文件打开恢复上一次光标所在位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif


"----------------------------------------------------------------------
" 窗口快捷键
"----------------------------------------------------------------------

nnoremap <silent> <Leader>w :wincmd w<CR>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l


"----------------------------------------------------------------------
" 启用鼠标支持
"----------------------------------------------------------------------

if has('mouse')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    set mouse=a
  else
    set mouse=nvi
  endif
endif


"----------------------------------------------------------------------
" 文件类型缩进
"----------------------------------------------------------------------

au FileType c,go set ts=4 sw=4
au FileType html,php,javascript,css,vue set ts=4 sw=4 expandtab
au FileType sh,yaml,vim,json,proto,xml set ts=2 sw=2 expandtab

au filetype php vnoremap <silent> <Leader>c :!awk 
  \ -F"[=:]" '{
  \ if (max<length($1))
  \   max=length($1);
  \ n1[NR]=$1;
  \ n2[NR]=$0;
  \ }END{
  \ for(n=1; n<=NR; n++){
  \   st=999;
  \   ifs="";
  \   split(FS, vfs, "");
  \   for(c in vfs){
  \     ist=index(n2[n], vfs[c]);
  \     if (ist && ist<st) {
  \       st=ist;
  \       ifs=vfs[c];
  \     }
  \   }
  \   if(ifs=="") {
  \     print n2[n];continue;
  \   }
  \   len=max-length(n1[n]);
  \   for(i=0; i<len; i++)
  \     n1[n]=n1[n]" ";
  \   print n1[n] ifs substr(n2[n], st+1);
  \ }
  \ }'<CR>


"----------------------------------------------------------------------
" golang特定
"----------------------------------------------------------------------

" 数组定义简写
au FileType go inoremap [[ []
" `j 补全
au FileType go inoremap `j <ESC>^yiw$a`json:"<ESC>pbgul$a"`


"----------------------------------------------------------------------
" 查询选中文本, 代码出自《vim实用技巧》第86
"----------------------------------------------------------------------

xnoremap * :<C-u>call<SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call<SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

" 返回当前选中文本的转义形式
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction


"======================================================================
" Plug
"======================================================================

call plug#begin('~/.vim/plugged')

" 修改文本的配对符号 ds(：删除括号 cs({：替换括号
Plug 'tpope/vim-surround'

" 自动匹配括号
Plug 'jiangmiao/auto-pairs'
" 兼容问题关闭该插件快捷键
let g:AutoPairsShortcutToggle = ''

" 扩展vim可视模式 C-n 选中下一个相同字符
Plug 'mg979/vim-visual-multi', {'branch': 'master'}


"----------------------------------------------------------------------
" coc yyds
"----------------------------------------------------------------------

Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-html',
      \'coc-css',
      \'coc-json',
      \'coc-go',
      \'coc-translator',
      \]

" 跳转定义
nnoremap <silent> gd <Plug>(coc-definition)
" 跳转引用
nnoremap <silent> gr <Plug>(coc-references)
" 跳转实现
nnoremap <silent> gti <Plug>(coc-implementation)
" 重命名
nnoremap <Leader>r <Plug>(coc-rename)

" coc-translator 翻译
nmap ,t <Plug>(coc-translator-p)
xmap ,t <Plug>(coc-translator-pv)


"----------------------------------------------------------------------
" vim启动页
"----------------------------------------------------------------------

Plug 'mhinz/vim-startify'

" 获取随机数
function! Random()
  return system("strings -n 1 < /dev/urandom | grep -o '[[:digit:]]'  | head -c1")
endfunction

let r = Random() % 4
if r == 0
  let g:startify_custom_header = [
      \ '   ⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑' ,
      \ '   ⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐',
      \ '   ⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐',
      \ '   ⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀',
      \ '   ⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇',
      \ '   ⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰',
      \ '   ⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕',
      \ '   ⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵',
      \ '   ⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      \ '   ⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿',
      \ '   ⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿',
      \ '   ⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀',
      \]
elseif r == 1
  let g:startify_custom_header = [
      \ '   ⣿⡇⠄⡴⠁⡜⣵⢗⢀⠄⢠⡔⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄',
      \ '   ⣿⡇⡜⠄⡜⠄⠄⠄⠉⣠⠋⠠⠄⢀⡄⠄⠄⣠⣆⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢸',
      \ '   ⣿⠸⠄⡼⠄⠄⠄⠄⢰⠁⠄⠄⠄⠈⣀⣠⣬⣭⣛⠄⠁⠄⡄⠄⠄⠄⠄⠄⢀⣿',
      \ '   ⣏⠄⢀⠁⠄⠄⠄⠄⠇⢀⣠⣴⣶⣿⣿⣿⣿⣿⣿⡇⠄⠄⡇⠄⠄⠄⠄⢀⣾⣿',
      \ '   ⣿⣸⠈⠄⠄⠰⠾⠴⢾⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⢁⣾⢀⠁⠄⠄⠄⢠⢸⣿⣿',
      \ '   ⣿⣿⣆⠄⠆⠄⣦⣶⣦⣌⣿⣿⣿⣿⣷⣋⣀⣈⠙⠛⡛⠌⠄⠄⠄⠄⢸⢸⣿⣿',
      \ '   ⣿⣿⣿⠄⠄⠄⣉⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣭⣉⠄⠈⠄⠄⠄⠄⠄⠈⢸⣿⣿',
      \ '   ⣿⣿⣿⠄⠄⠄⠁⣶⣿⣿⡆⢀⣈⣉⢉⣿⣿⣶⣬⡄⠄⠄⠄⠄⠄⠄⠄⠈⣿⣿',
      \ '   ⣿⣿⡟⡜⠄⠄⠄⠄⠙⠿⣿⣧⣽⣍⣾⣿⠿⠛⠁⠄⠄⠄⠄⠄⠄⠄⠄⠃⢿⣿',
      \ '   ⣿⡿⠰⠄⠄⠄⠄⠄⠄⠄⠄⠈⠉⠩⠔⠒⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠐⠘⣿',
      \]
elseif r == 2
  let g:startify_custom_header = [
      \ '   ⣱⣿⣿⡟⡐⣰⣧⡷⣿⣴⣧⣤⣼⣯⢸⡿⠁⣰⠟⢀⣼⠏⣲⠏⢸⣿⡟⣿⣿⣿⣿⣿⣿',
      \ '   ⣿⣿⡟⠁⠄⠟⣁⠄⢡⣿⣿⣿⣿⣿⣿⣦⣼⢟⢀⡼⠃⡹⠃⡀⢸⡿⢸⣿⣿⣿⣿⣿⡟',
      \ '   ⣿⣿⠃⠄⢀⣾⠋⠓⢰⣿⣿⣿⣿⣿⣿⠿⣿⣿⣾⣅⢔⣕⡇⡇⡼⢁⣿⣿⣿⣿⣿⣿⢣',
      \ '   ⣿⡟⠄⠄⣾⣇⠷⣢⣿⣿⣿⣿⣿⣿⣿⣭⣀⡈⠙⢿⣿⣿⡇⡧⢁⣾⣿⣿⣿⣿⣿⢏⣾',
      \ '   ⣿⡇⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠇⠄⠄⢿⣿⡇⢡⣾⣿⣿⣿⣿⣿⣏⣼⣿',
      \ '   ⣿⣷⢰⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣧⣀⡄⢀⠘⡿⣰⣿⣿⣿⣿⣿⣿⠟⣼⣿⣿',
      \ '   ⢹⣿⢸⣿⣿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣉⣤⣿⢈⣼⣿⣿⣿⣿⣿⣿⠏⣾⣹⣿⣿',
      \ '   ⢸⠇⡜⣿⡟⠄⠄⠄⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣻⣿⣿⣿⣿⣿⠟⠁⢳⠃⣿⣿⣿',
      \ '   ⠄⣰⡗⠹⣿⣄⠄⠄⠄⢀⣿⣿⣿⣿⣿⣿⠟⣅⣥⣿⣿⣿⣿⠿⠋⠄⠄⣾⡌⢠⣿⡿⠃',
      \ '   ⠜⠋⢠⣷⢻⣿⣿⣶⣾⣿⣿⣿⣿⠿⣛⣥⣾⣿⠿⠟⠛⠉⠄⠄',
      \]
elseif r == 3
  let g:startify_custom_header = [
      \ '   ⢰⣿⣎⣿⣿⣿⣦⣀⠄⠄⠄⠄⠹⣿⣿⣦⢄⡙⠻⠿⠷⠶⠤⢐⣋⣀⠄⠄⠄⠄',
      \ '   ⢸⣿⠛⠛⠻⠿⢿⣿⣧⢤⣤⣄⣠⡘⣿⣿⣿⡟⠿⠛⠂⠈⠉⠛⢿⣿⠄⠄⠄⠄',
      \ '   ⠄⡇⢰⣿⣇⡀⠄⠄⣝⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⡄⠄⠈⠄⣷⢠⡆⠄⠄⠄⠄',
      \ '   ⢹⣿⣼⣿⣯⢁⣤⣄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣴⠶⣲⣵⠟⠄⠄⠄⠄⠸',
      \ '   ⠄⢿⣿⣿⣿⣷⣮⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣟⣡⡴⠄⠄⠄⠄⠁',
      \ '   ⠄⠰⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⡀⠄⠄⠄⠄',
      \ '   ⠄⠄⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣭⣶⡞⠄⠄⠄⠄⠄',
      \ '   ⠄⠄⠐⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠄⠄⠄⠄⠄⠄',
      \ '   ⠄⠄⠄⠈⠻⣿⣿⣿⣿⣿⣿⣯⣿⣯⣿⣾⣿⣿⣿⣿⣿⡿⠋⠄⠄⠄⠄⠄⠄⠄',
      \]
endif


"----------------------------------------------------------------------
" fzf 搜索插件
"----------------------------------------------------------------------

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

" 搜索文件列表
nnoremap <C-p> :Files <CR>
" 搜索当前文档内容
nnoremap <C-f> :Lines <CR>
xnoremap <C-f> :<C-U><C-R>=printf("Lines %s", VisualText()) <CR><CR>
" 全局搜索（rg）
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
xnoremap <C-g> :<C-U><C-R>=printf("Rg %s", escape(VisualText(), '()')) <CR><CR>

" 返回当前选中文本
function! VisualText()
    try
        let x_save = @x
        norm! gv"xy
        return @x
    finally
        let @x = x_save
    endtry
endfunction


"----------------------------------------------------------------------
" defx 侧边栏插件
"----------------------------------------------------------------------

Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'  }

" defx图标
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

" 开启defx并载入defx session
function! DefxStart()
  execute "Defx -session-file=" . $HOME . "/.vim/defx_session -auto-cd"
endfunction

" 快捷键打开defx
nnoremap <silent> <Leader>d :call DefxStart()<CR>

" 在关闭buffer时写入session
autocmd BufLeave,BufWinLeave * nested call defx#call_action('add_session')

" 当只剩defx时退出vim
autocmd BufEnter * nested if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'defx') | q | endif

" 定义defx快捷键
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> defx#do_action('call', 'DefxOpenView')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> t
        \ defx#do_action('drop', 'tabedit')
  nnoremap <silent><buffer><expr> l defx#do_action('call', 'DefxOpenView')
  nnoremap <silent><buffer><expr> mf
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> md
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> dd
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> re
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> sp
        \ defx#do_action('multi',[['drop','split']])
  nnoremap <silent><buffer><expr> vsp
        \ defx#do_action('multi',[['drop','vsplit']])
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <2-LeftMouse> defx#do_action('call', 'DefxOpenView')
endfunction

" 展开目录或打开文件
function! DefxOpenView(_)
  if defx#is_directory()
    call defx#call_action('open_tree')
  else
    call defx#call_action('drop')
  endif
endfunction


"----------------------------------------------------------------------
" git功能
"----------------------------------------------------------------------
 
Plug 'airblade/vim-gitgutter'

" git各状态颜色
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" 状态更新延时
:set updatetime=250

" 还原修改
nmap gco <Plug>(GitGutterUndoHunk)
" 预览变更
nmap gs <Plug>(GitGutterPreviewHunk)
" 跳转前/后git暂存区域
nmap gtn <Plug>(GitGutterNextHunk)zz
nmap gtp <Plug>(GitGutterPrevHunk)zz


"----------------------------------------------------------------------
" floaterm 终端窗口
"----------------------------------------------------------------------

Plug 'voldikss/vim-floaterm'

" 打开/关闭内部终端窗口
nnoremap <silent> <C-t> :w<CR>:FloatermToggle<CR>
tnoremap <silent> <C-t> <C-\><C-n>:FloatermToggle<CR>


"----------------------------------------------------------------------
" easymotion 快速跳转
"----------------------------------------------------------------------

Plug 'easymotion/vim-easymotion'

" ;前缀，;w：往后 ;b：往前 ;f/F前后搜索模式
nmap ; <Plug>(easymotion-prefix)
xmap ; <Plug>(easymotion-prefix)


"----------------------------------------------------------------------
" tagbar tag索引
"----------------------------------------------------------------------

Plug 'majutsushi/tagbar'

" 打开并进入tagbar标签窗口 q退出
nnoremap <silent> <Leader>t :TagbarToggle<CR>:wincmd l<CR>


"----------------------------------------------------------------------
" 快速注释
"----------------------------------------------------------------------

Plug 'tyru/caw.vim'

nmap ,c <Plug>(caw:prefix)
xmap ,c <Plug>(caw:prefix)


"----------------------------------------------------------------------
" markdown预览
"----------------------------------------------------------------------

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

nnoremap <Leader>m <Plug>MarkdownPreview


"----------------------------------------------------------------------
" lightline 状态栏
"----------------------------------------------------------------------

Plug 'itchyny/lightline.vim'

" 兼容问题关闭tabline
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'enable': {
      \   'statusline': 1,
      \   'tabline': 0
      \ },
      \ }


"----------------------------------------------------------------------
" bufferline buffer栏
"----------------------------------------------------------------------

Plug 'akinsho/nvim-bufferline.lua'
" buffer栏图标
Plug 'kyazdani42/nvim-web-devicons'

" buf前后跳转
nnoremap <silent><C-l> :BufferLineCycleNext<CR>
nnoremap <silent><C-s> :BufferLineCyclePrev<CR>

" 关闭buf
nnoremap <C-x> :call ExitTab()<CR>
function! ExitTab()
  if len(getbufinfo({'buflisted':1})) > 1 |
    let del_bn=buffer_number()
    bprevious
    execut "bdelete " . del_bn
  else |
    bdelete 
  endif
endfunction


"----------------------------------------------------------------------
" rainbow 括号层级染色
"----------------------------------------------------------------------

Plug 'luochen1990/rainbow'

let g:rainbow_active = 1
let g:rainbow_conf = {
      \	'guifgs': ['SlateBlue2', 'brown2', 'gold2', 'RoyalBlue1'],
      \}


"----------------------------------------------------------------------
" 颜色模板
"----------------------------------------------------------------------

Plug 'drewtempelmeyer/palenight.vim'

call plug#end()


"----------------------------------------------------------------------
" plug config
"----------------------------------------------------------------------

" 设置颜色模板
set background=dark
colorscheme palenight
set termguicolors


" 设置defx格式
call defx#custom#option('_', {
      \ 'columns': 'mark:indent:git:icons:filename',
      \ 'winwidth': 38,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'toggle': 1,
      \ 'root_marker': '[in]: '
      \ })

" 设置defx图标
call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })

" 设置defx文件名长度
call defx#custom#column('filename', {
      \ 'min_width': 40,
      \ 'max_width': 40,
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
hi Defx_git_Untracked guifg=#ec5f67
hi Defx_git_Staged guifg=#99c794


" bufferline setup
lua require'bufferline'.setup()

" startify banner颜色
highlight StartifyHeader  ctermfg=114
