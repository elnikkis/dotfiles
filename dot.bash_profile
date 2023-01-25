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
export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p $XDG_CONFIG_HOME
export XDG_CACHE_HOME="$HOME/.cache"
mkdir -p $XDG_CACHE_HOME
export XDG_DATA_HOME="$HOME/.local/share"
mkdir -p $XDG_DATA_HOME

# pyenv settings
# xdevではworkにあるpyenvを使う
if [[ $(hostname) =~ ^xdev[0-9]{2} ]] || [[  $(hostname) =~ ^xsnd[0-9]{2} ]] ; then
    export PYENV_ROOT="/work/$USER/.pyenv"
else
    export PYENV_ROOT="$HOME/.pyenv"
fi
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi

# for Rust
if [ -d "$HOME/.cargo/bin" ] ; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
if [ -d "$GEM_HOME/bin" ] ; then
    export PATH="$GEM_HOME/bin:$PATH"
fi

# for deno
export DENO_INSTALL="$HOME/.local"

export LESSCHARSET=utf-8

# Interactive jobのときはwork dirへ移動する
if [ -n "$PBS_O_WORKDIR" -a "$PBS_ENVIRONMENT" = "PBS_INTERACTIVE" ]; then
    cd "$PBS_O_WORKDIR"
fi

# Execute .bashrc after .bash_profile
if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi

