filetype off

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

" Required:
filetype plugin indent on

syntax on
set encoding=utf-8
colorscheme desert
" colorscheme elfload
" colorscheme jellybeans
" colorscheme hybrid
set background=dark

let s:rc_vim = expand('~/.vim/rc.vim')
if filereadable(s:rc_vim)
    execute 'source' s:rc_vim
endif

