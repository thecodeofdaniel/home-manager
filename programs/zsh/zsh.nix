{ config, ... }:

let
  zsh_dir = "/home/${config.home.username}/.config/home-manager/programs/zsh";
in
{
  enable = true;

  enableAutosuggestions = true;

  history = {
    expireDuplicatesFirst = true;
    path = "$HOME/.zsh_history";
  };

  historySubstringSearch = {
    enable = true;
    searchUpKey = [ "^[[A" "^[OA" ];
    searchDownKey = [ "^[[B" "^[OB" ];
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

    # Git aliases
    ga = "git add";
    gb = "git branch";
    gc = "git checkout";
    gcm = "git commit";
    gcma = "git commit --amend";
    gd = "git diff";
    gf = "git fetch";
    gl=''git log --graph --oneline --pretty=format:"%C(yellow)%h%C(reset) %C(yellow)(%C(auto)%D%C(yellow))%C(reset)%n%s [%C(dim)%an%C(reset)]%n"'';
    gll = "git log --graph";
    gres = "git restore --staged";
    gs = "git status -s";
    gst = "git status";
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
