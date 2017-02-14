# ~/.bash_profile
# このファイルがあると ~/.profile は読まれない

export LANG='ja_JP.UTF-8'

# Set PATH for user bin
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/local/bin" ] ; then
    export PATH="$HOME/local/bin:$PATH"
fi

# Set XDG config path
mkdir -p "$HOME/.config"
export XDG_CONFIG_HOME=~/.config

# Execute .bashrc after .bash_profile
if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi

