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
export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p $XDG_CONFIG_HOME
export XDG_CACHE_HOME="$HOME/.cache"
mkdir -p $XDG_CACHE_HOME
export XDG_DATA_HOME="$HOME/.local/share"
mkdir -p $XDG_DATA_HOME

# for Rust
if [ -d "$HOME/.cargo/bin" ] ; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
if [ -d "$GEM_HOME/gems/bin" ] ; then
    export PATH="$HOME/gems/bin:$PATH"
fi

# for deno
export DENO_INSTALL="$HOME/.local"

export LESSCHARSET=utf-8

# Execute .bashrc after .bash_profile
if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi
