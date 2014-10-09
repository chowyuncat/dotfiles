function setup_prompt {
	local default_color='\[\e[m\]'
	local purple="\[\033[35m\]"
	local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
	export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] $purple$__git_branch$default_color \n\$ "
}

export HISTCONTROL=erasedups:ignorespace
setup_prompt
