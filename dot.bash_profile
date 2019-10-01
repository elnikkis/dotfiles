# ~/.bash_profile
# このファイルがあると ~/.profile は読まれない

case $TERM in
    linux) export LANG=C ;;
    * ) export LANG='ja_JP.UTF-8' ;;
    #* ) if [ `locale -a` | grep -i 'ja_JP.utf8' ] ; then
    #        export LANG='ja_JP.UTF-8'
    #    elif [`locale -a` | grep -i 'en_US.utf8' ] ; then
    #        export LANG='en_US.UTF-8'
    #    else
    #        export LANG=C
    #    fi ;;
esac

# Set PATH for user bin
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/local/bin" ] ; then
    export PATH="$HOME/local/bin:$PATH"
fi

# perl setting
#export PERL_CPANM_OPT="--local-lib=~/perl5"
#export PATH="$HOME/perl5/bin:$PATH"
#export PERL5LIB="$HOME/perl5/lib/perl5:$PERL5LIB"

# Set XDG path
mkdir -p "$HOME/.config"
export XDG_CONFIG_HOME=~/.config
mkdir -p "$HOME/.cache"
export XDG_CACHE_HOME=~/.cache

# digdag setting
export PATH="$HOME/bin:$PATH"

# dotnet runtime
#export PATH=/gpfs/work/k131820/dotnet:$PATH
#export PATH=/gpfs/work/k131820/gcc-5_5_0/bin:$PATH
#export LD_LIBRARY_PATH=/gpfs/work/k131820/gcc-5_5_0/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/gpfs/work/k131820/gcc-5_5_0/lib64:$LD_LIBRARY_PATH

# Execute .bashrc after .bash_profile
if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi
