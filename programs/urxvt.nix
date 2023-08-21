{ config, pkgs, ... }:

{
  enable = true;

  fonts = [
    "xft:MesloLGS Nerd Font:size=14"
  ];

  extraConfig = {
    # special
    background = "[70]#000000";
    foreground = "#d6deeb";
    cursorColor = "#d6deeb";

    # black
    color0 = "#011627";
    color8 = "#575656";

    # red
    color1 = "#ef5350";
    color9 = "#ef5350";

    # green
    color2 = "#22da6e";
    color10 = "#22da6e";

    # yellow
    color3 = "#addb67";
    color11 = "#ffeb95";

    # blue
    color4 = "#82aaff";
    color12 = "#82aaff";

    # magenta
    color5 = "#c792ea";
    color13 = "#c792ea";

    # cyan
    color6 = "#21c7a8";
    color14 = "#7fdbca";

    # white
    color7 = "#ffffff";
    color15 = "#ffffff";

    # "perl-ext-common" = "default,resize-font";
    # "perl-lib" = "${config.home.profileDirectory}/lib/urxvt/perl";
  };

  # scroll = {
  #   bar = {
  #     enable = false;
  #     align = "top";
  #     floating = false;
  #   };
  # };

  # transparent = true;
  # shading = 199;
}