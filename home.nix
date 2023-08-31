{ config, pkgs, unstable, ... }:

let
  HM-dir = "/home/${config.home.username}/.config/home-manager";
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "user";
  home.homeDirectory = "/home/user";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  dconf = import ./dconf/dconf.nix;

  # Enable fonts
  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.fzf
    pkgs.zoxide

    (pkgs.nerdfonts.override { fonts = [ "Meslo" ]; })

    # Shell scripts
    (pkgs.writeShellScriptBin "my-hello" ''echo "Hello, ${config.home.username}!"'')
    (pkgs.writeShellScriptBin "backupfile" ''source ${HM-dir}/scripts/backupfile.sh'')
    (pkgs.writeShellScriptBin "link2dir" ''source ${HM-dir}/scripts/link2dir.sh'')
    (pkgs.writeShellScriptBin "link2file" ''source ${HM-dir}/scripts/link2file.sh'')
  ];


  programs.git = import ./programs/git.nix;
  programs.tmux = import ./programs/tmux.nix pkgs;
  # programs.urxvt = import ./programs/urxvt.nix { inherit config pkgs; };

  programs.vscode = import ./programs/vscode/vscode.nix pkgs;
  programs.zsh = import ./programs/zsh/zsh.nix { inherit config; };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/daniel/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
