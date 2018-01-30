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

# perl setting
export PERL_CPANM_OPT="--local-lib=~/perl5"
export PATH="$HOME/perl5/bin:$PATH"
export PERL5LIB="$HOME/perl5/lib/perl5:$PERL5LIB"

# Set XDG config path
export XDG_CONFIG_HOME=~/.config

# Execute .bashrc after .bash_profile
if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi

