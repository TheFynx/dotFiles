# .bashrc

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib/:$LD_LIBRARY_PATH
export ORACLE_HOME=/usr/lib/oracle/11.2/client
export PATH=$PATH:$ORACLE_HOME/bin
export PATH=$PATH:$HOME/.cabal/bin


[ -z "$PS1" ] && return

## Functions
function kgrep { ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9; }


##Exports
export -f kgrep

## CMD Alias
alias ..="cd .."
alias ...="cd ../.."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias ..6="cd ../../../../../.."
alias ..7="cd ../../../../../../.."
alias vcb="vim +BundleClean! +BundleInstall! +qall!"
alias v="vim"
alias vi="vim"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -lhSrta'
alias l='ls -CF'
alias lt='ls -lrt'
alias pgrep='ps -ef|grep'
alias cnt='ls -l ./|grep -v ^l|wc -l'
alias fuck='sudo $(history -p \!\!)'

bind TAB:menu-complete

# Source global definitions
if [ -f /etc/bashrc ]; then
            . /etc/bashrc
    fi

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/opt/android-studio/bin/

#generate random passwords
genpasswd() {
    local l=$1
        [ "$l" == "" ] && l=16
        tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
