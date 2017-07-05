filetype off

if &compatible
    set nocompatible  " Be iMproved
endif

"dein Scripts-----------------------------
" Required:
set runtimepath+=/home/nicky/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/nicky/.local/share/dein')
    call dein#begin('/home/nicky/.local/share/dein')

    " Let dein manage dein
    " Required:
"    call dein#add('/home/nicky/.local/share/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('w0ng/vim-hybrid')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/deoplete.nvim')

    call dein#add('zchee/deoplete-jedi', { 'on_ft': ['python', 'python3'] })

    " You can specify revision/branch/tag.
    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

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


" Start deoplete
let g:deoplete#enable_at_startup = 1

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


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

" Ctrl + hjklでウィンドウ間の移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
