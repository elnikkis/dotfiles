# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias llh='ls -lh'

alias rm='rm -i'
alias view='vim -R'

alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

alias qwatch='perl /gpfs/work/my016/tool/qwatch.pl'
alias qshell='qsub -I -q wSrchq'
alias qdelall='bash /gpfs/work/my016/tool/qdel.sh all'

alias tmux='LD_LIBRARY_PATH=${HOME}/local/lib tmux'

if [ -e /gpfs/work/s143369/twitter-research/main/sets_operation.py ]; then
    alias setop='python /gpfs/work/s143369/twitter-research/main/sets_operation.py'
fi
