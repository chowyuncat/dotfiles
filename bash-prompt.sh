function setup_prompt {
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

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]csmbp:\[\033[33;1m\]\w\[\033[m\] \$(setup_prompt) \nλ "
# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] $purple$__git_branch$default_color \nλ "

# Prepend a timestamp
export PS1="\n ^-- \D{%F %T}\n\n$PS1"

# These commands should be organized into a separate file
shopt -s histverify
export HISTCONTROL=erasedups:ignorespace
set -o ignoreeof


# I prefer vim bindings to emacs
set -o vi
