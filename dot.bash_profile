# ~/.bash_profile
# このファイルがあると ~/.profile は読まれない

# Set PATH for user bin
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Set XDG config path
export XDG_CONFIG_HOME=~/.config

# Execute .bashrc after .bash_profile
if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi

