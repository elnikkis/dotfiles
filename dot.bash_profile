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
export PYENV_ROOT="$HOME/.pyenv"
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

# Set ssh-agent for WSL
if [ -e "/mnt/c/Users/shiori/.ssh/agent.sock" ]; then
    export SSH_AUTH_SOCK=/mnt/c/Users/shiori/.ssh/agent.sock
# Set symbolic link ssh-agent if exists
elif [ -d "$HOME/.ssh" ]; then
    if [ -S "$SSH_AUTH_SOCK" ]; then
        agent="$HOME/.ssh/agent"
        case $SSH_AUTH_SOCK in /tmp/*/agent.[0-9]*)
            ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
        esac
    # elif [ -S $agent ]; then
    #     export SSH_AUTH_SOCK=$agent
    fi
fi

# Execute .bashrc after .bash_profile
if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi
