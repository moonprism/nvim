" -------------- oh my vim ~ --------------

set nocompatible
set nu
set cul
set smartindent
let mapleader=","

set autoread

set lz

map <Leader>p "0p

if has('mouse')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    set mouse=a
  else
    set mouse=nvi
  endif
endif

au FileType php,javascript,css,vue set ts=4 sw=4 expandtab
au FileType c,go set ts=4 sw=4
au FileType yaml,vim,json set ts=2 sw=2 expandtab

inoremap jk <ESC>
set hlsearch
set ignorecase
nnoremap <backspace> :nohl<CR>

" aotosave & undo/redo

set autowriteall
set undofile
set undodir=~/.vim/undodir

" quit

nmap <M-q> :wqa<CR>
imap <M-q> <Esc> :wqa<CR>

" session

set sessionoptions-=blank
let g:session_dir = $HOME . '/.vim/sessions'

function! SessionFile()
  return g:session_dir . "/" . substitute(getcwd(), '/', '_', 'g') . ".vim"
endfunction

autocmd VimLeave * nested if (!isdirectory(g:session_dir)) |
    \ call mkdir(g:session_dir) |
    \ endif |
    \ execute "mksession! " . SessionFile()

function! VimStart()
  if argc() == 0
    if filereadable(SessionFile())
      execute "source " . SessionFile()
      call DefxStart()
      execute "wincmd w"
    else
      call DefxStart()
    endif
  endif
endfunction

autocmd VimEnter * nested call VimStart()

" Plug

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'airblade/vim-gitgutter'
Plug 'mhartington/oceanic-next'
Plug 'voldikss/vim-floaterm'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'tyru/caw.vim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

" markdown

nmap <Leader>m <Plug>MarkdownPreview
let g:mkdp_auto_close = 0

" Theme

syntax enable
colorscheme OceanicNext

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" -------------- plug config --------------

" vim-startify

let g:startify_custom_header = [
      \ '   +------------------------------------+',
      \ '   |  __  _  __  __  _   __  __         |',
      \ '   | |  \| | \ \/ / | | |  \/  |        |',
      \ '   | |_|\__|  \__/  |_| |_|\/|_|        |',
      \ '   | https://github.com/moonprism/nvim  |',
      \ '   +-------------------+----------------+',
      \]

" tagbar

nmap <space>t :TagbarToggle<CR>:wincmd l<CR>

" defx

call defx#custom#option('_', {
      \ 'columns': 'mark:indent:git:icons:filename',
      \ 'winwidth': 38,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'toggle': 1,
      \ 'root_marker': '[in]: '
      \ })

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })

call defx#custom#column('filename', {
      \ 'min_width': 40,
      \ 'max_width': 40,
      \ })

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

function! DefxStart()
  execute "Defx -session-file=" . $HOME . "/.vim/defx_session -auto-cd"
endfunction

nmap <space><space> :call DefxStart()<CR>

autocmd BufLeave,BufWinLeave * nested call defx#call_action('add_session')

autocmd BufEnter * nested if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'defx') | q | endif

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

function! DefxOpenView(_)
  if defx#is_directory()
    call defx#call_action('open_tree')
  else
    call defx#call_action('drop')
  endif
endfunction

nmap <space>w :wincmd w<CR>
nmap <space><tab> <C-^>
nmap <space>h <C-w>h
nmap <space>j <C-w>j
nmap <space>k <C-w>k
nmap <space>l <C-w>l

" coc

let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-html',
      \'coc-css',
      \'coc-json',
      \'coc-go',
      \'coc-translator',
      \]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <Leader>r <Plug>(coc-rename)

" fzf

" nmap <C-p> :Files <CR>
nmap <C-f> :Lines <CR>

function! VisualText()
    try
        let x_save = @x
        norm! gv"xy
        return @x
    finally
        let @x = x_save
    endtry
endfunction

xnoremap <C-f> :<C-U><C-R>=printf("Lines %s", VisualText()) <CR><CR>

" todo rg 进程不会自动关闭导致cpu占用过高
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
xnoremap <C-g> :<C-U><C-R>=printf("Rg %s", escape(VisualText(), '()')) <CR><CR>

" airline

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" airline & buffer
 
nmap <space>1 <Plug>AirlineSelectTab1
nmap <space>2 <Plug>AirlineSelectTab2
nmap <space>3 <Plug>AirlineSelectTab3
nmap <space>4 <Plug>AirlineSelectTab4
nmap <space>5 <Plug>AirlineSelectTab5
nmap <space>6 <Plug>AirlineSelectTab6
nmap <space>7 <Plug>AirlineSelectTab7
nmap <space>8 <Plug>AirlineSelectTab8
nmap <space>9 <Plug>AirlineSelectTab9
nmap <M-h> <Plug>AirlineSelectPrevTab
nmap <M-l> <Plug>AirlineSelectNextTab
nmap <M-x> :call ExitTab()<CR>
imap <M-h> <Esc> :execut "normal \<Plug>AirlineSelectPrevTab"<CR>
imap <M-l> <ESC> :execut "normal \<Plug>AirlineSelectNextTab"<CR>
imap <M-x> <Esc> :call ExitTab()<CR>

function! ExitTab()
  if len(getbufinfo({'buflisted':1})) > 1 |
    let del_bn=buffer_number()
    bprevious
    execut "bdelete " . del_bn
  else |
    bdelete 
  endif
endfunction

" gitgutter

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

nmap ga <Plug>(GitGutterStageHunk)
nmap gco <Plug>(GitGutterUndoHunk)
nmap gs <Plug>(GitGutterPreviewHunk)
nmap gn <Plug>(GitGutterNextHunk)
nmap gp <Plug>(GitGutterPrevHunk)

:set updatetime=300

let g:NERDSpaceDelims=1

" translator

nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)

" floaterm

let g:floaterm_keymap_toggle = '<C-t>'

" motion

map ; <Plug>(easymotion-prefix)

" caw.vim

nmap <Leader>c <Plug>(caw:prefix)
xmap <Leader>c <Plug>(caw:prefix)
