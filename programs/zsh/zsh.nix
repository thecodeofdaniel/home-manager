{ config, ... }:

let
  zsh_dir = "/home/${config.home.username}/.config/home-manager/programs/zsh";
in
{
  enable = true;
  # oh-my-zsh = {
  #   enable = true;
  #   plugins = [ "git" ];
  #   # theme = "robbyrussell";
  # };

  zplug = {
    enable = true;
    plugins = [
      { name = "woefe/git-prompt.zsh"; }
      # { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
      # { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
    ];
  };

    # initExtra = ''
    #   PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%~%{$reset_color%}"
    #   PROMPT+=' $(gitprompt)'

    #   source ${zsh_dir}/settings.zsh
    #   source ${zsh_dir}/aliases.zsh
    # '';

    initExtra = builtins.readFile ./prompt.zsh;
}
