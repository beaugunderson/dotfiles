PATH=$PATH:$HOME/skbin:$HOME/bin:/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/lib/php:/var/lib/gems/1.8/bin

CDPATH=.:/home/www

BASH_ENV=$HOME/.bashrc

EDITOR=vim

SSH_ENV="$HOME/.ssh/environment"

INPUTRC=~/.inputrc

shopt -s checkwinsize
shopt -s cdspell

alias git=hub

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

# Pager and man page viewer
#if [ -x "/usr/local/bin/vim" ]; then
#	vman() { man $* | col -b | vim -c 'set ft=man nomod nolist' -; }
#
#	alias man='vman'
#
#	PAGER="/usr/local/share/vim/vim73/macros/less.sh"
#elif [ -x "/usr/bin/less" ]; then
#	PAGER="/usr/bin/less"
#else
#	PAGER="more"
#fi

PAGER="less"

export PATH BASH_ENV EDITOR PAGER INPUTRC CDPATH

export TERM=xterm-256color

if echo hello|grep --color=auto l >/dev/null 2>&1; then
	export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
fi

# Selector
alias h='selector -d -i -b -v -f <(history)'

# LS
#if [ -x "/usr/local/bin/gnuls" ]; then
# alias ll="/usr/local/bin/gnuls -hlaF --color=yes"
# alias ls="/usr/local/bin/gnuls -haF --color=yes"
#elif [ -x "/usr/local/bin/gls" ]; then
# alias ll="/usr/local/bin/gls -hlaF --color=yes"
# alias ls="/usr/local/bin/gls -haF --color=yes"
#else
alias ll="ls -hlaF --color"
alias ls="ls -haF --color"
#fi

alias df="df -h"
alias pico="nano -w"

alias permsXX="chown -R www:wheel * && chmod -R g+w *"

alias ae="$EDITOR /usr/local/etc/apache22/Includes/hosts.conf"

alias cd..="cd .."
alias su="su -l"
alias nss="netskel_sync"

# Create Prompt
BL="\[\033[0;36m\]"
WH="\[\033[1;37m\]"
LG="\[\033[0;37m\]"
DG="\[\033[1;30m\]"
NC="\[\033[0m\]"

PS1="$BL[$WH\h$BL]$LG.$BL[$WH\u$BL]$LG.$BL[$WH\w $DG($LG\$(lbsum)$DG)$BL]$LG.$BL[$WH\@$BL]$NC "
