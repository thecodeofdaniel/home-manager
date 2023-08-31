zsh_dir="/home/user/.config/home-manager/programs/zsh";

alias src="source ~/.zshrc"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# source ${zsh_dir}/settings.zsh
# source ${zsh_dir}/aliases.zsh

# ALLOW FZF WITH: <CTRL> + R
if [ -n "${commands[fzf-share]}" ]; then
    source "$(fzf-share)/key-bindings.zsh"
    source "$(fzf-share)/completion.zsh"
fi

# Theming variables for primary prompt
# ZSH_THEME_GIT_PROMPT_PREFIX=""
# ZSH_THEME_GIT_PROMPT_SUFFIX=""
# ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
# ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[yellow]%}:"
# ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
# ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "
# ZSH_THEME_GIT_PROMPT_UPSTREAM_NO_TRACKING="%{$fg_bold[red]%}!"
# ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
# ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"
# ZSH_THEME_GIT_PROMPT_BEHIND="↓"
# ZSH_THEME_GIT_PROMPT_AHEAD="↑"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
# ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
# ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
# ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

# # Theming variables for the secondary prompt
# ZSH_THEME_GIT_PROMPT_SECONDARY_PREFIX=""
# ZSH_THEME_GIT_PROMPT_SECONDARY_SUFFIX=""
# ZSH_THEME_GIT_PROMPT_TAGS_SEPARATOR=", "
# ZSH_THEME_GIT_PROMPT_TAGS_PREFIX="🏷 "
# ZSH_THEME_GIT_PROMPT_TAGS_SUFFIX=""
# ZSH_THEME_GIT_PROMPT_TAG="%{$fg_bold[magenta]%}"

# PROMPT
PROMPT=$'\n┏╸%B%~%b $(gitprompt)\n' \
&& PROMPT+='┗╸%U${CONDA_DEFAULT_ENV}%u%(!.%F{1}.%F{238})' \
&& PROMPT+='[%n@%M]%f%(!.#.$) '
