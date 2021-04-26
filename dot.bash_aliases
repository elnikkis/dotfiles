# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias llh='ls -lh'

alias rm='rm -i'

if command -v nvim &> /dev/null
then
    alias view='nvim -R'
else
    alias view='vim -R'
fi

alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

alias qdelall='bash /work/my016/tool/qdel.sh all'
alias qdelq='bash /work/my016/tool/qdel.sh queue'

alias tmux='LD_LIBRARY_PATH=${HOME}/local/lib tmux'

#if [ -e /gpfs/work/s143369/twitter-research/main/sets_operation.py ]; then
#    alias setop='python /gpfs/work/s143369/twitter-research/main/sets_operation.py'
#fi
