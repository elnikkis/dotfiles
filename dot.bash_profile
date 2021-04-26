# ~/.bash_profile
# このファイルがあると ~/.profile は読まれない

case $TERM in
    linux) export LANG=C ;;
    * ) export LANG='ja_JP.UTF-8' ;;
esac

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
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# for Rust
if [ -d "$HOME/.cargo/bin" ] ; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

export LESSCHARSET=utf-8

# Execute .bashrc after .bash_profile
if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi
