# ~/.bashrc is executed by ~/.bash_profile
# this file based on default ubuntu bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# コマンド履歴共有
shopt -u histappend
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'

# append to the history file, don't overwrite it
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# History filter using peco
peco_select_history() {
    line=$(HISTTIMEFORMAT= history | tac | LC_ALL=C sort -uk2 | LC_ALL=C sort -unrk1 | sed -e 's/^\s*[0-9]\+\s\+//' | peco --on-cancel 'error' --query "$READLINE_LINE")
    if [ $? -eq 0 ]; then
        READLINE_LINE="$line"
        READLINE_POINT=${#line}
        echo "exit with 0"
    fi
    unset line
}
if command -v peco >/dev/null 2>&1 ; then
    bind -x '"\C-r": peco_select_history'
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# 手動でgitのbash_completionを読み込む
if [ -r /etc/bash_completion.d/git ] ; then
    . /etc/bash_completion.d/git
fi


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|xterm-16color|xterm-256color|screen-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;33m\]\W\[\033[00m\] \$ '
else
    PS1='\u@\h \W \$ '
fi

# Set git info
if [ "$(type -t __git_ps1)" = "function" ]; then
    if [ "$color_prompt" = yes ]; then
        PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \W$(__git_ps1) \[\033[01;34m\]\$\[\033[00m\] '
    else
        PS1='\u@\h \W$(__git_ps1) \$ '
    fi
fi

unset color_prompt force_color_prompt


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
    alias ls='ls -G'
    alias grep='grep --color=auto'
fi

# pyenv
# xdevではworkにあるpyenvを使う
#if [[ -d "/work/s143369/.pyenv" ]] && [[ $(hostname) =~ ^xdev[0-9]{2} ]] ; then
#    export PYENV_ROOT="/work/s143369/.pyenv"
#else
#    export PYENV_ROOT="$HOME/.pyenv"
#fi
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
