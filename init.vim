if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
set nocompatible
set nu
set cul
set paste
set tabstop=4
set autoindent
let mapleader=","

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'preservim/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'  }
call plug#end()

colorscheme gruvbox
" defx
nmap - :Defx<CR>
call defx#custom#option('_', {
      \ 'columns': 'mark:indent:git:icon:filename',
      \ 'winwidth': 35,
      \ 'split': 'vertical',
      \ 'buffer_name': '',
      \ 'show_ignored_files': 0,
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
        \ defx#is_directory() ?
        \ defx#do_action('open_tree') :
        \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> t
        \ defx#do_action('drop', 'tabedit')
  nnoremap <silent><buffer><expr> l
        \ defx#is_directory() ?
        \ defx#do_action('open_tree') :
        \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> e defx#do_action('call', 'DefxOpenView')
endfunction
function! DefxOpenView(_)
  if defx#is_directory()
    call defx#call_action('open_tree')
  else
    call defx#call_action('drop')
    exec 'wincmd w'
  endif
endfunction
" coc
let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-html',
      \'coc-css',
      \'coc-json',
      \'coc-markdownlint']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Lf
let g:Lf_ShortcutF = "<C-p>"
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>")) <CR><CR>
xnoremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual()) <CR><CR>

let g:NERDSpaceDelims=1
