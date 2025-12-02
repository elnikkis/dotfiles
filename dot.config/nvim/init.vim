filetype off

if &compatible
    set nocompatible  " Be iMproved
endif

"let g:python_host_prog = '/usr/bin/python2'
" let g:python3_host_prog = '/usr/bin/python3'
let g:python3_host_prog = $HOME . '/venv/neovim/bin/python3'

" Begin dein Settings -----------------------------

" Required:
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let s:dein_toml = s:config_home . '/nvim/dein.toml'
let s:dein_lazy_toml = s:config_home . '/nvim/deinlazy.toml'

" Required:
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir, [expand('<sfile>'), s:dein_toml, s:dein_lazy_toml])
    call dein#load_toml(s:dein_toml, {'lazy': 0})
    call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
    call dein#end()
    call dein#call_hook('source')
    call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if has('vim_starting') && dein#check_install()
    call dein#install()
endif
"End dein Settings -------------------------

" function! Is_WSL() abort
"   let proc_version = '/proc/version'
"   return filereadable(proc_version)
"        \  ? !empty(filter(
"        \    readfile(proc_version, '', 1), { _, val -> val =~? 'microsoft' }))
"        \  : v:false
" endfunction

" Clipboard settings
"set clipboard+=unnamedplus
"if Is_WSL()
"    let g:clipboard = {
"    \   'name': 'WslClipboard',
"    \   'copy': {
"    \      '+': ['sh', '-c', 'nkf -sc | clip.exe'],
"    \      '*': ['sh', '-c', 'nkf -sc | clip.exe'],
"    \    },
"    \   'paste': {
"    \      '+': ['powershell.exe', '-c', '[Console]::OutputEncoding = [Text.Encoding]::UTF8;[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("\`r", "")'],
"    \      '*': ['powershell.exe', '-c', '[Console]::OutputEncoding = [Text.Encoding]::UTF8;[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("\`r", "")'],
"    \   },
"    \   'cache_enabled': 0,
"    \ }
"endif
"    \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',

filetype plugin indent on
syntax on

let s:rc_vim = expand('~/.vim/rc.vim')
if filereadable(s:rc_vim)
    execute 'source' s:rc_vim
endif

