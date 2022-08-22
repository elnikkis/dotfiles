filetype off

if &compatible
    set nocompatible  " Be iMproved
endif

"let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

"dein Scripts-----------------------------
" Required:
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
"set runtimepath+=/home/nicky/.local/share/dein/repos/github.com/Shougo/dein.vim
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" Required:
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " Let dein manage dein
    " Required:
    call dein#add('Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('w0ng/vim-hybrid')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/deoplete.nvim')
    "call dein#add('thaerkh/vim-indentguides')
    call dein#add('tyru/caw.vim')

    call dein#add('zchee/deoplete-jedi', {'on_ft': ['python', 'python3']})
    call dein#add('Vimjas/vim-python-pep8-indent', {'on_ft': ['python', 'python3', 'snakemake']})
    call dein#add('zchee/deoplete-clang', {'on_ft': ['c', 'cpp']})
    call dein#add('rust-lang/rust.vim', {'on_ft': ['rust']})
    call dein#add('sebastianmarkow/deoplete-rust', {'on_ft': ['rust']})
    call dein#add('chase/vim-ansible-yaml', {'on_ft': ['ansible', 'yaml']})
    call dein#add('ShaiberAlon/snakemake-vim', {'on_ft': ['snakemake']})

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------

" Enable rst style
let g:rst_style = 1

" Disable tex symbol relpacing
let g:tex_conceal = ""

" Start deoplete
let g:deoplete#enable_at_startup = 1

" Enterで候補を確定できるようにする
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
endfunction

" neosnippetの設定
let g:neosnippet#snippets_directory = '~/.vim/snippets'

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" TABで補完候補とneosnippetの展開の両方をする設定
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

" Setting of deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/x86_64-linux-gnu/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

" Setting for deoplete-rust
"let g:deoplete#sources#rust#racer_binary='/home/hironaka15/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/usr/local/src/rust/src'
let g:deoplete#sources#rust#show_duplicates=1

syntax on
set background=dark
colorscheme hybrid

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
