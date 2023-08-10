{ config, ... }:

let
  zsh_dir = "/home/${config.home.username}/.config/home-manager/programs/zsh";
in
{
  enable = true;

  zplug = {
    enable = true;
    plugins = [
      { name = "woefe/git-prompt.zsh"; }
    ];
  };

  initExtra = builtins.readFile ./prompt.zsh;
}
