#!/bin/zsh
set -o vi
setopt HIST_IGNORE_SPACE


# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
# %b - branch
# %i - current revision
zstyle ':vcs_info:git:*' formats '(%b) %i'

function git_string() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1;
    then
	return
    fi

    local default_color='\e[39m'
    local purple="\e[35m"
    local red="\e[31m"
    local __git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    local __git_rev_local=$(git rev-parse --short HEAD 2> /dev/null)
    local __git_rev_upstream=$(git rev-parse --short @{upstream} 2> /dev/null)
    if [ "${__git_rev_local}" != "${__git_rev_upstream}" ]; then
        local __git_rev="${red}*$__git_rev_local / $__git_rev_upstream"
    else
        local __git_rev="$__git_rev_local"
    fi

    printf "(${__git_branch}) ${__git_rev} ${default_color}"
}
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n@ ${PWD/#$HOME/~} ${vcs_info_msg_0_}λ '
PROMPT='%n@ ${PWD/#$HOME/~} $(git_string)'$'\n''λ '

###
# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

# require explicit logout command
set -o ignoreeof

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}

# define right prompt, regardless of whether the theme defined it
RPS1='$(vi_mode_prompt_info)'
RPS2=$RPS1
###
