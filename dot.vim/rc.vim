" Enable rst style
let g:rst_style = 1

" Disable tex symbol relpacing
let g:tex_conceal = ""

set t_Co=256
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set showmode
set ruler
set number
set hidden             " Hide buffers when they are abandoned
set ambiwidth=double
"折り畳み無効
set nofoldenable

set wildmode=longest,full

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
" nnoremap J 10j
" nnoremap K 10k
" nnoremap H 0
" nnoremap L $

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

" Esc2回でハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>
