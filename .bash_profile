BASH_ENV=$HOME/.bashrc
CDPATH=".:/home/www"
EDITOR=vim
HISTIGNORE="&:ls:ls *:ll:ll *:[bf]g:exit"
HISTSIZE=256
INPUTRC=~/.inputrc
PAGER="less -r"
PATH=$PATH:$HOME/bin:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/lib/php:/var/lib/gems/1.9/bin
SHELL=bash
SSH_ENV=$HOME/.ssh/environment
TERM=xterm-256color

export PATH BASH_ENV EDITOR PAGER INPUTRC CDPATH TERM HISTIGNORE HISTSIZE SHELL

PROMPT_COMMAND="history -a"

shopt -s checkwinsize
shopt -s cdspell
shopt -s cmdhist
shopt -s dirspell
shopt -s histappend
shopt -s no_empty_cmd_completion

# Ignore Ctrl-S, Ctrl-Q
stty -ixon -ixoff

# Ignore Ctrl-D
set -o ignoreeof

function start_agent {
	echo "Initialising new SSH agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	echo succeeded
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" > /dev/null
	/usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" > /dev/null
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
		start_agent;
	}
else
	start_agent;
fi

if echo hello|grep --color=auto l >/dev/null 2>&1; then
	export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
fi

# Fancy LS_COLORS
eval $(dircolors -b $HOME/.dircolors)

# Add some github magic
alias git=hub

alias ls='ls -hF --group-directories-first --color'
alias ll='ls -hlF --group-directories-first --color --time-style="+%D %r"'

alias df="df -h"

alias www-permissions="chown -R www-data: . && chmod -R ug+rw ."

alias ..="cd .."
alias ...="cd ../.."

alias cd..="cd .."
alias cd...="cd ../.."

# Selector
source bash-selector.sh --hist --cd

# Create Prompt
BL="\[\033[0;36m\]"
WH="\[\033[1;37m\]"
LG="\[\033[0;37m\]"
DG="\[\033[1;30m\]"
NC="\[\033[0m\]"

#PS1="$BL[$WH\h$BL]$LG.$BL[$WH\u$BL]$LG.$BL[$WH\w $DG($LG\$(lbsum)$DG)$BL]$LG.$BL[$WH\@$BL]$NC "
PS1="$BL[$WH\h$BL]$LG.$BL[$WH\u$BL]$LG.$BL[$WH\w$BL]$LG.$BL[$WH\@$BL]$NC "
