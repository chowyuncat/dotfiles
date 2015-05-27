# Easily jump around the file system by manually adding marks
# marks are stored as symbolic links in the directory $MARKPATH (default $HOME/.marks)
#
# jump FOO: jump to a mark named FOO
# mark FOO: create a mark named FOO
# unmark FOO: delete a mark
# marks: lists all marks
#
export MARKPATH=$HOME/.marks

jump() {
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

function _jump {
	local cur=${COMP_WORDS[COMP_CWORD]}
	local marks=$(find $MARKPATH -type l | awk -F '/' '{print $NF}')
	COMPREPLY=($(compgen -W '${marks[@]}' -- "$cur"))
	return 0
}

complete -o default -o nospace -F _jump jump unmark


# mark() {
# 	if (( $# == 0 )); then
# 		MARK=$(basename "$PWD")
# 	else
# 		MARK="$1"
# 	fi
# 	if read -q \?"Mark $PWD as ${MARK}? (y/n) "; then
# 		mkdir -p "$MARKPATH"; ln -s "$PWD" "$MARKPATH/$MARK"
# 	fi
# }

function mark {
	mkdir -p $MARKPATH; ln -s "$(pwd)" $MARKPATH/$1
}

unmark() {
	rm -i "$MARKPATH/$1"
}

# aka 'autoload' colors under zsh
red=$'\e[1;31m'
green=$'\e[1;32m'
yellow=$'\e[1;33m'
blue=$'\e[1;34m'
magenta=$'\e[1;35m'
cyan=$'\e[1;36m'
reset_color=$'\e[0m'

# marks() {
# 	for link in $MARKPATH/*(@); do
# 		local markname="$fg[cyan]${link:t}$reset_color"
# 		local markpath="$fg[blue]$(readlink $link)$reset_color"
# 		printf "%s\t" $markname
# 		printf "-> %s \t\n" $markpath
# 	done
# }

function marks {
	\ls -l $MARKPATH | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

_completemarks() {
	if [[ $(ls "${MARKPATH}" | wc -l) -gt 1 ]]; then
		reply=($(ls $MARKPATH/**/*(-) | grep : | sed -E 's/(.*)\/([_a-zA-Z0-9\.\-]*):$/\2/g'))
	else
		if readlink -e "${MARKPATH}"/* &>/dev/null; then
			reply=($(ls "${MARKPATH}"))
		fi
	fi
}

# compctl -K _completemarks jump
# compctl -K _completemarks unmark

_mark_expansion() {
	setopt extendedglob
	autoload -U modify-current-argument
	modify-current-argument '$(readlink "$MARKPATH/$ARG")'
}

# zle -N _mark_expansion
# bindkey "^g" _mark_expansion