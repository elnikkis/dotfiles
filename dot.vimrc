filetype off

" NeoBundle settings

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible    " Be iMproved
    endif

    " neobundleを自動インストール
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install neobundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:Neobundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'nanotech/jellybeans.vim'
NeoBundleLazy 'hynek/vim-python-pep8-indent', {"autoload": {"filetypes": ['python', 'python3']}}

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck


"set t_Co=256
syntax on
"colorscheme desert
"colorscheme elfload
colorscheme jellybeans

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd     " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all modes)

set scrolloff=3 "スクロール時の余白
set whichwrap=b,s,h,l,[,],<,> "カーソルキーで行頭／行末を移動可能
set wildmenu  ":を押すと補完
set autoindent "自動的にインデントする
set ts=4 sw=4 sts=0 "タブを設定
set expandtab "tabではなく空白を挿入
set shiftround  " インデントするときにshiftwidthの倍数に丸める
set number "行番号
set tw=0
set list    "改行とかタブとかを表示
set listchars=eol:$,tab:>\
set wrap

"debianでbackspaceが効かなかった
noremap  
noremap!  
set backspace=indent,eol,start

set nowritebackup
set nobackup
set noswapfile

" j,kの移動を折り返されたテキストでも自然に移動
nnoremap j gj
nnoremap k gk

" Ctrl + hjklでウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


