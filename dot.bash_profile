# ~/.bash_profile
# このファイルがあると ~/.profile は読まれない

if [ $TERM = "linux" ]; then
    export LANG=C
else
    for lc in {'ja_JP','en_US'}.{'UTF-8','utf8'} 'C.UTF-8' 'C'
    do
        if locale -a | grep -q $lc ; then
            export LANG=$lc
            break
        fi
    done
fi

# Set PATH for user bin
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/local/bin" ] ; then
    export PATH="$HOME/local/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# set default umask
umask 022

# Set XDG path
mkdir -p "$HOME/.config"
export XDG_CONFIG_HOME=~/.config
mkdir -p "$HOME/.cache"
export XDG_CACHE_HOME=~/.cache

# pyenv settings
# xdevではworkにあるpyenvを使う
if [[ $(hostname) =~ ^xdev[0-9]{2} ]] || [[  $(hostname) =~ ^xsnd[0-9]{2} ]] ; then
    export PYENV_ROOT="/work/sh013/.pyenv"
else
    export PYENV_ROOT="$HOME/.pyenv"
fi
export PATH="$PYENV_ROOT/bin:$PATH"

# for Rust
if [ -d "$HOME/.cargo/bin" ] ; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

export LESSCHARSET=utf-8

# Interactive jobのときはwork dirへ移動する
if [ -n "$PBS_O_WORKDIR" -a "$PBS_ENVIRONMENT" = "PBS_INTERACTIVE" ]; then
    cd "$PBS_O_WORKDIR"
fi

# Execute .bashrc after .bash_profile
if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi

