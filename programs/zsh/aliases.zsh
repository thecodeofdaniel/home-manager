# source $zsh_vars

# Aliases for colors and formatting
RST="\e[0m"
BLD="\e[1m"
DIM="\e[2m"
ULN="\e[4m"
RED="\e[31m"
GRN="\e[32m"
YLW="\e[33m"
BLU="\e[34m"

# System Commands
alias ..=" cd ../"
alias ...=" cd ../../"
alias ....=" cd ../../../"
alias c=" clear"
alias g="grep --color"
alias l="ll | awk '{ print \$1,\$9 }' | sed '/total/d'"
alias ll="ls -lAh"
alias ls="ls --color"

# Installed packages
alias bat="batcat"
alias cat="bat -p"
alias trm="trash"
alias zz="zi"

# Gnome Desktop Environment
alias gt=" nohup gnome-terminal . && rm nohup.out"
alias nt=" nohup nautilus . && rm nohup.out"

# Git Commands
alias ga="git add"
alias gb="git branch"
alias gc="git checkout"
alias gcm="git commit"
alias gcma="git commit --amend"
alias gd="git diff"
alias gf="git fetch"
alias gl='git log --graph --oneline --pretty=format:"\
%C(yellow)%h%C(reset) %C(yellow)(%C(auto)%D%C(yellow))%C(reset)%n\
%s [%C(dim)%an%C(reset)]%n"'
alias gll="git log --graph"
alias gres="git restore --staged"
alias gs="git status -s"
alias gst="git status"

# Git Command Functions

# git add && git commit --amend
function gacm
{
    # Check if two arugments is passed in
    if [[ $# < 2 ]]; then
        echo "${RED}This command needs at least two arguments :)${RST}"
        return
    fi

    # Check if the commit message is too long
    local msg=${@[-1]}
    if [[ ${#msg} > 72 ]]; then
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
