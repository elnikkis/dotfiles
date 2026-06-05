# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
reverse_lines() {
    if command -v tac >/dev/null 2>&1; then
        tac
    else
        tail -r
    fi
}
peco_select_history() {
    line=$(HISTTIMEFORMAT= history | reverse_lines | LC_ALL=C sort -u -k2 | LC_ALL=C sort -n -r -k1 | sed -e 's/^[[:space:]]*[0-9][0-9]*[[:space:]][[:space:]]*//' | TERM=xterm peco --on-cancel 'error' --query "$READLINE_LINE")
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
shopt -s globstar 2>/dev/null || true

# make less more friendly for non-text input files, see lesspipe(1)
if command -v lesspipe >/dev/null 2>&1; then
    eval "$(SHELL=/bin/sh lesspipe)"
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-16color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if command -v tput >/dev/null 2>&1 && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;33m\]\W\[\033[00m\] \$ '
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='\u@\h \W \$ '
fi

# Load git prompt support when it is available.
for git_prompt in \
    /usr/share/git-core/contrib/completion/git-prompt.sh \
    /etc/bash_completion.d/git-prompt \
    /opt/homebrew/share/git-core/contrib/completion/git-prompt.sh \
    /usr/local/share/git-core/contrib/completion/git-prompt.sh \
    /opt/homebrew/etc/bash_completion.d/git-prompt.sh \
    /usr/local/etc/bash_completion.d/git-prompt.sh
do
    if [ -r "$git_prompt" ]; then
        . "$git_prompt"
        break
    fi
done
unset git_prompt

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
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if command -v dircolors >/dev/null 2>&1 || command -v gdircolors >/dev/null 2>&1; then
    dircolors_cmd=$(command -v dircolors || command -v gdircolors)
    test -r ~/.dircolors && eval "$("$dircolors_cmd" -b ~/.dircolors)" || eval "$("$dircolors_cmd" -b)"
    unset dircolors_cmd
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
elif [ "$(uname -s)" = "Darwin" ]; then
    export CLICOLOR=1
    alias ls='ls -G'
    if command -v grep >/dev/null 2>&1 && grep --color=auto '' /dev/null >/dev/null 2>&1; then
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    for bash_completion in \
        /usr/share/bash-completion/bash_completion \
        /etc/bash_completion \
        /opt/homebrew/etc/bash_completion \
        /usr/local/etc/bash_completion
    do
        if [ -r "$bash_completion" ]; then
            . "$bash_completion"
            bash_completion_loaded=yes
            break
        fi
    done
    if [ -z "$bash_completion_loaded" ] && \
        { [ "${BASH_VERSINFO[0]}" -gt 4 ] || { [ "${BASH_VERSINFO[0]}" -eq 4 ] && [ "${BASH_VERSINFO[1]}" -ge 1 ]; }; }; then
        for bash_completion in \
            /opt/homebrew/etc/profile.d/bash_completion.sh \
            /usr/local/etc/profile.d/bash_completion.sh
        do
            if [ -r "$bash_completion" ]; then
                . "$bash_completion"
                break
            fi
        done
    fi
    unset bash_completion bash_completion_loaded
fi

# pyenv
if [ -n "$PYENV_ROOT" ] && [ ! -e "$PYENV_ROOT" ]; then
    echo "Do you wish to install pyenv to $PYENV_ROOT?"
    PS3="Enter a number: "
    select yn in "Yes" "No"; do
        echo "$yn"
        case $yn in
            Yes )
                # Install pyenv
                echo 'Installing pyenv ...'
                # ref: https://github.com/yyuu/pyenv-installer
                curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
                break;;
            No ) break;;
        esac
    done
fi
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    if pyenv commands | grep -qx 'virtualenv-init'; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# nvm
for nvm_prefix in "$NVM_DIR" /opt/homebrew/opt/nvm /usr/local/opt/nvm
do
    if [ -s "$nvm_prefix/nvm.sh" ]; then
        . "$nvm_prefix/nvm.sh"  # This loads nvm
        [ -s "$nvm_prefix/bash_completion" ] && . "$nvm_prefix/bash_completion"  # This loads nvm bash_completion
        break
    fi
done
unset nvm_prefix
