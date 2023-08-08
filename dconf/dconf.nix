{
  settings = {
    # Swap capslock to escape key
    "org/gnome/desktop/input-sources" = {
      xkb-options = ["caps:swapescape"];
    };

    # Focus on mouse hover
    "org/gnome/desktop/wm/preferences" = {
      focus-mode = "sloppy";
    };

    # Display scale factor to 1.25
    "org/gnome/desktop/interface" = {
      text-scaling-factor = 1.25;
    };

    # File Manager shortcut
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>e";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      command = "nautilus";
    };

    # Clipboard shortcut
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>v";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      command = "/usr/bin/diodon";
    };

    # Enable the shortcuts
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
    };
  };
}
