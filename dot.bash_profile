# ~/.bash_profile
# このファイルがあると ~/.profile は読まれない

path_prepend() {
    [ -n "$1" ] || return
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$1:$PATH" ;;
    esac
}

path_prepend_if_exists() {
    [ -d "$1" ] && path_prepend "$1"
}

if [ "$TERM" = "linux" ]; then
    export LANG=C
else
    for lc in {'ja_JP','en_US'}.{'UTF-8','utf8'} 'C.UTF-8' 'C'
    do
        if locale -a | grep -qx "$lc" ; then
            export LANG=$lc
            break
        fi
    done
fi

# Set PATH for Homebrew on macOS
if [ "$(uname -s)" = "Darwin" ]; then
    path_prepend_if_exists /usr/local/sbin
    path_prepend_if_exists /usr/local/bin
    path_prepend_if_exists /opt/homebrew/sbin
    path_prepend_if_exists /opt/homebrew/bin
fi

# Set PATH for user bin
path_prepend_if_exists "$HOME/bin"
path_prepend_if_exists "$HOME/local/bin"
path_prepend_if_exists "$HOME/.local/bin"

# set default umask
umask 022

# Set XDG path
export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME"
export XDG_CACHE_HOME="$HOME/.cache"
mkdir -p "$XDG_CACHE_HOME"
export XDG_DATA_HOME="$HOME/.local/share"
mkdir -p "$XDG_DATA_HOME"

# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
path_prepend "$PYENV_ROOT/bin"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi

# nvm settings
export NVM_DIR="$XDG_CONFIG_HOME/nvm"

# for Rust
path_prepend_if_exists "$HOME/.cargo/bin"

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
path_prepend_if_exists "$GEM_HOME/bin"

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
            ln -snf "$SSH_AUTH_SOCK" "$agent" && export SSH_AUTH_SOCK=$agent
        esac
    # elif [ -S $agent ]; then
    #     export SSH_AUTH_SOCK=$agent
    fi
fi

# Execute .bashrc after .bash_profile
if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi

unset -f path_prepend path_prepend_if_exists
