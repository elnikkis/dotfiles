filetype off

if &compatible
    set nocompatible  " Be iMproved
endif

"let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Begin dein Settings -----------------------------

" Required:
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:dein_toml = '~/.config/nvim/dein.toml'

" Required:
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir, [expand('<sfile>'), s:dein_toml])
    call dein#load_toml(s:dein_toml, {'lazy': 0})
    call dein#end()
    call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if has('vim_starting') && dein#check_install()
    call dein#install()
endif
"End dein Settings -------------------------

" Enable rst style
let g:rst_style = 1

" Disable tex symbol relpacing
let g:tex_conceal = ""

" let g:vim_json_syntax_conceal = 0

filetype plugin indent on
syntax on

set t_Co=256
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set showmode
set ruler
set number
set ambiwidth=double
"折り畳み無効
set nofoldenable

" タブ関連
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set shiftround
set textwidth=0

set splitbelow
set splitright

set noerrorbells
set modeline

" 移動関連
set whichwrap=b,s,h,l,[,],<,>
nnoremap j gj
nnoremap k gk
nnoremap J 10j
nnoremap K 10k
nnoremap H 0
nnoremap L $

" スクロール行数の設定
if !&scrolloff
    set scrolloff=3
endif
if !&sidescrolloff
    set sidescrolloff=5
endif

" 不可視文字表示の設定
set listchars=eol:$,tab:>\ ,trail:-
set list

";も:にする
nnoremap ; :
vnoremap ; :

" ウィンドウとバッファまわりの設定
nnoremap t <Nop>
" ウィンドウの分割
nnoremap ts :split<Space>
nnoremap tv :vsplit<Space>
" Ctrl + hjklでウィンドウ間の移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 開く
"nnoremap to :edit<Space>
nnoremap tt :tabnew<Space>
" タブページの移動
nnoremap <C-n> gt
nnoremap <C-p> gT
" ウィンドウ幅のリセット
nnoremap t0 <C-w>=
