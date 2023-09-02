zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

zsh_dir="/home/user/.config/home-manager/programs/zsh";

alias src="source ~/.zshrc"

# ALLOW FZF WITH: <CTRL> + R
if [ -n "${commands[fzf-share]}" ]; then
    source "$(fzf-share)/key-bindings.zsh"
    source "$(fzf-share)/completion.zsh"
fi

# ALLOW ZOXIDE
eval "$(zoxide init zsh)"

# Allow to view stash entries
ZSH_GIT_PROMPT_SHOW_STASH=1

# Theming variables for primary prompt
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[yellow]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "
ZSH_THEME_GIT_PROMPT_UPSTREAM_NO_TRACKING="%{$fg_bold[red]%}!"
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"
ZSH_THEME_GIT_PROMPT_BEHIND=" ↓"
ZSH_THEME_GIT_PROMPT_AHEAD=" ↑"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[green]%}✚"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}?"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

# Theming variables for the secondary prompt
ZSH_THEME_GIT_PROMPT_SECONDARY_PREFIX=""
ZSH_THEME_GIT_PROMPT_SECONDARY_SUFFIX=""
ZSH_THEME_GIT_PROMPT_TAGS_SEPARATOR=", "
ZSH_THEME_GIT_PROMPT_TAGS_PREFIX="🏷 "
ZSH_THEME_GIT_PROMPT_TAGS_SUFFIX=""
ZSH_THEME_GIT_PROMPT_TAG="%{$fg_bold[magenta]%}"

# PROMPT
PROMPT=$'\n┏╸%B%~%b $(gitprompt)\n' \
&& PROMPT+='┗╸%U${CONDA_DEFAULT_ENV}%u%(!.%F{1}.%F{238})' \
&& PROMPT+='[%n@%M]%f%(!.#.$) '

function gacm
{
    # Check if two arugments is passed in
    if [[ $# < 2 ]]; then
        echo "${RED}This command needs at least two arguments :)${RST}"
        return
    fi

    # Check if the commit message is too long
    local msg=${@[-1]}
    if [[ ${#msg} -gt 72 ]]; then
        echo "${#msg}"
        echo "${RED}Commit message is greater than 72 chars${RST}"
        return
    fi

    # Run git add command
    for ((i = 1; i <= $# - 1; i++)); do
        git add ${@[${i}]}
    done

    git commit -m $msg
}

# git checkout
function gcAt
{
    if [[ $# == 0 ]] || ! [[ $1 =~ '^[0-9]+$' ]]; then
        echo "${RED}Please provide a value for the arguement ${RST}"
    else
        git checkout HEAD~$1
    fi
}

# git clone
function gclone {
    name=$(git config user.name)

    if ! [[ -z "$1" ]]; then
        git clone git@github.com:$name/$1.git
    else
        printf "\e[31mNeed the name of the repo!\e[0m\n"
    fi
}

# git reset --hard HEAD~$<arg>
function grH {
    _gr "hard" $1
}

# git reset --soft HEAD~$<arg>
function grs {
    _gr "soft" $1
}

# Helper Functions

## To display commits
function _displayCommits
{
    printf "\n${ULN}${YLW}Previous Commits\n\n${RST}"
    gl -$(($1 + 1))
    printf "\n${RED}^${ULN}You will go back to this commit!${RST}\n\n"
}

## To do a git reset
function _gr
{
    # NOTES
    # $1 = hard || soft
    # $2 = <value>

    low_arg=$1
    typeset -u upp_arg=$low_arg
    val=$2

    if [[ -z "$val" ]]; then
        echo "${YLW}Please provide a number on how far back you want to go :) ${RST}"
    else
        _displayCommits $val

        read "?Do you want to proceed? [\"yes\" for $upp_arg reset]: " choice

        if [[ $choice == "yes" ]]; then
            local cmnd="git reset --$low_arg HEAD~$val"
            eval $cmnd
        else
            printf "\n${BLD}NO RESET has been done\n${RST}"
        fi
    fi
}

export _gr
export gacm
export gcAt
export gclone
export grs
export grH
