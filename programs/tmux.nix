pkgs: {
  enable = true;

  terminal = "screen-256color";
  baseIndex = 1;
  shortcut = "a";
  mouse = true;

  plugins = with pkgs; [
    tmuxPlugins.cpu

    # {
    #   plugin = tmuxPlugins.catppuccin;
    #   extraConfig = ''
    #     set -g @catppuccin_pill_theme_enabled on
    #     set -g @catppuccin_no_patched_fonts_theme_enabled on
    #     set -g @catppuccin_window_tabs_enabled on # or off to disable window_tabs
    #   '';
    # }

    {
      plugin = tmuxPlugins.resurrect;
      extraConfig = ''
        set -g @resurrect-strategy-nvim 'session'
      '';
    }

    tmuxPlugins.vim-tmux-navigator # Pane navigation with vim-keys (<ctrl> + h,j,k,l)
    tmuxPlugins.yank # Allow to copy with y key
  ];

  extraConfig = ''
    # Place the status bar at the top
    set-option -g status-position top

    # Status bar background color
    set-option -g status-style bg=colour234

    # Status bar info
    set-option -g status-left ""
    set-option -g status-right "#[fg=#BE8F59]#{session_name}"

    ## window list options.
    setw -g automatic-rename on

    # Inactive window.
    set-window-option -g window-status-format "\
    #[fg=colour240]#I)#W"

    # Active window
    set-window-option -g window-status-current-format "\
    #[fg=colour240]#I)#[fg=#46ACB8, bold]#W"

    # Pane border colors
    set -g pane-active-border-style bg=default,fg=black
    set -g pane-border-style fg=black

    # Highlighting when clicking and dragging
    set -g mode-style bg=#46ACB8

    # Message style
    set-option -g message-style bg=default,fg=#46ACB8

    # Split to horizontal with pipe '|'
    unbind %
    bind | split-window -h
    bind | split-window -h -c "#{pane_current_path}"

    # Split to vertical panes with underscore '_'
    unbind '"'
    bind _ split-window -v
    bind _ split-window -v -c "#{pane_current_path}"

    # Resize panes with vim-keys
    bind -r j resize-pane -D 1
    bind -r k resize-pane -U 1
    bind -r l resize-pane -R 1
    bind -r h resize-pane -L 1

    # Maximize pane with 'm'
    bind -r m resize-pane -Z \; display-message "Max key pressed"

    #bind -T copy-mode    DoubleClick1Pane select-pane \; send -X select-word \; send -X copy-pipe-no-clear "xsel -i"
    #bind -T copy-mode-vi DoubleClick1Pane select-pane \; send -X select-word \; send -X copy-pipe-no-clear "xsel -i"
    #bind -n DoubleClick1Pane select-pane \; copy-mode -M \; send -X select-word \; send -X copy-pipe-no-clear "xsel -i"
    #bind -T copy-mode    TripleClick1Pane select-pane \; send -X select-line \; send -X copy-pipe-no-clear "xsel -i"
    #bind -T copy-mode-vi TripleClick1Pane select-pane \; send -X select-line \; send -X copy-pipe-no-clear "xsel -i"
    #bind -n TripleClick1Pane select-pane \; copy-mode -M \; send -X select-line \; send -X copy-pipe-no-clear "xsel -i"

    # Source tmux.conf with <prefix> + r
    unbind r
    bind r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded."
  '';
}