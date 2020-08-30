export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

~/.ssh-agent-add

#cyrilic aliases
alias ецхо=echo
alias жим=vim
alias лл="ls -l --color=auto"
alias лс="ls --color=auto"
alias ман=man
alias судо=sudo
alias пвд=pwd
alias цат=cat
alias цд=cd
alias цлеар=clear
alias я=q
alias нео="neofetch"
#alias упс="sudo pacman -Syu"
alias упс="update_arch.sh"
alias упсъ="sudo pacman -Syyu"

#aliases for shortened commands
alias free="free -h"
alias hist="history | grep "
alias ll="ls -l --color=auto"
alias ls="ls --color=auto"
alias neo="neofetch"
alias reboot="sudo reboot"
alias poweroff="sudo poweroff"
#alias ups="sudo pacman -Syu"
alias ups="update_arch.sh"
alias upsy="sudo pacman -Syyu"

pwd () {
	echo
	echo "Welcome to $(command pwd):"
	echo
	ls 
	echo
}

cd () {
	echo

	if [ -z "$*" ]; then
		command	cd ~
	else
		command cd "$*"
	fi
	
	pwd
}

q () {
	pkill firefox  #usually only my web browser is active when I try to poweroff
	#pkill chrome

	sleep 0.2

	sudo poweroff
}

locate () {
    /usr/bin/locate $1 | grep -v timeshift
}

#Function that is used in the $PS1 variable to show me if I am on a git branch
get_branch () {
    git branch 2>/dev/null | grep '^*' | tr '*' ':' | tr -d ' '
}

export PS1="\
\$(if [[ \$? -eq 0 ]]; then printf \"\[\e[1;33m\]\u\[\e[1;35m\]@\h:\[\e[1;32m\]\w\[\e[0;33m\]\$(get_branch)\[\e[1;32m\]\"; else printf \"\[\e[1;33m\]\u\[\e[1;35m\]@\h:\[\e[1;32m\]\w\[\e[0;33m\]\$(get_branch)\[\e[0;31m\]\"; fi)>$ \[\e[m\]"


#The following code adds a cool output when starting a new session. It causes troubles to X server on boot so a check is needed to avoid the warning

PNAME=$(ps --pid=$PPID --no-header | awk '{print $(NF)}')
if [ ${PNAME} != 'gdm-x-session' ]; then #for GNOME DE
#	cmatrix -C cyan -s
    neo 
fi
SSH_AUTH_SOCK=/tmp/ssh-IbIoh5ApUQ6r/agent.8398; export SSH_AUTH_SOCK; SSH_AGENT_PID=8400; export SSH_AGENT_PID;
