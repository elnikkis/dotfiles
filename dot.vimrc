filetype off

" NeoBundle settings

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

" if has('vim_starting')
"     if &compatible
"         set nocompatible    " Be iMproved
"     endif
" 
"     " neobundleを自動インストール
"     if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
"         echo "install neobundle..."
"         :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
"     endif
" 
"     " Required:
"     set runtimepath+=~/.vim/bundle/neobundle.vim/
" endif

" Required:
" call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
" NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:Neobundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'w0ng/vim-hybrid'

"NeoBundle 'Shougo/neocomplete'

" NeoBundleLazy 'hynek/vim-python-pep8-indent', {"autoload": {"filetypes": ['python', 'python3']}}
"NeoBundleLazy 'nvie/vim-flake8', {"autoload": {"filetypes": ["python", "python3", "djangohtml"]}}

" NeoBundleLazy 'rust-lang/rust.vim', {"autoload": {"filetypes": ['rust']}}

" call neobundle#end()

" Required:
filetype plugin indent on

" NeoBundleCheck


"set t_Co=256
syntax on
set encoding=utf-8
colorscheme desert
"colorscheme elfload
"colorscheme jellybeans
set background=dark
" colorscheme hybrid

let s:rc_vim = expand('~/.vim/rc.vim')
if filereadable(s:rc_vim)
    execute 'source' s:rc_vim
endif

