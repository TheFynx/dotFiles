# .bashrc

[ -z "$PS1" ] && return

## CMD Alias
alias ..="cd .."
alias ...="cd ../.."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias ..6="cd ../../../../../.."
alias ..7="cd ../../../../../../.."
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
