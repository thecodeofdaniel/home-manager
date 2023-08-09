zsh_dir="$HOME/.config/home-manager/programs/zsh";

PROMPT=$'\n┏╸%B%~%b $(gitprompt)\n' \
&& PROMPT+='┗╸%U${CONDA_DEFAULT_ENV}%u%(!.%F{1}.%F{238})' \
&& PROMPT+='[%n@%M]%f%(!.#.$) '

source ${zsh_dir}/settings.zsh
source ${zsh_dir}/aliases.zsh
