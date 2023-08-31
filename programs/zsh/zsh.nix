{ config, ... }:

let
  zsh_dir = "/home/${config.home.username}/.config/home-manager/programs/zsh";
in
{
  enable = true;

  history = {
    expireDuplicatesFirst = true;
    # ignoreAllDups = true;
    path = "$HOME/.zsh_history";
  };

  historySubstringSearch = {
    enable = true;
  };

  shellAliases = {
    ".." = " cd ../";
    "..." = " cd ../../";
    "...." = " cd ../../../";
    c = " clear";
    g = "grep --color";
    l = "ll | awk '{ print \$1,\$9 }' | sed '/total/d'";
    ll = "ls -lAh";
    ls = "ls --color";
  };

  zplug = {
    enable = true;
    plugins = [
      { name = "woefe/git-prompt.zsh"; }
      { name = "zsh-users/zsh-syntax-highlighting"; }
    ];
  };

  initExtra = builtins.readFile ./prompt.zsh;
}
