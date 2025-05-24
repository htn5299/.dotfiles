{
  pkgs,
  config,
  inputs,
  ...
}:
let
  colors = config.colorScheme.palette;
  tmux-nvim = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux.nvim";
    version = "unstable-2023-01-06";
    src = pkgs.fetchFromGitHub {
      owner = "aserowy";
      repo = "tmux.nvim/";
      rev = "57220071739c723c3a318e9d529d3e5045f503b8";
      sha256 = "sha256-zpg7XJky7PRa5sC7sPRsU2ZOjj0wcepITLAelPjEkSI=";
    };
  };

in
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    baseIndex = 1;
    mouse = true;
    escapeTime = 0;
    keyMode = "vi";
    plugins = with pkgs; [
      {
        plugin = inputs.minimal-tmux.packages.${pkgs.system}.default;
        extraConfig = ''
          # set -g @minimal-tmux-justify "centre"
          set -g @minimal-tmux-justify "left"
          set -g @minimal-tmux-fg "#${colors.base08}"
          set -g @minimal-tmux-bg "default"
          set -g @minimal-tmux-indicator-str ' '
        '';
      }

      tmux-nvim
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.yank
    ];
    extraConfig = ''
      set-option -g automatic-rename on
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"
      set -g set-titles on
      set-option -g automatic-rename-format '#{b:pane_current_path}'
      set-option -g history-limit 20000
      set-option -g pane-base-index 1
      set-option -g renumber-windows on
      set-option -g set-clipboard on
      set-option -g status on
      set-option -g status-interval 1
      set-option -g wrap-search off

      set -g status-position bottom
      set -g allow-passthrough on

      set -g status-style 'fg=#${colors.base03},bg=default'

      set -g message-command-style bg=default,fg=#${colors.base0A}
      set -g message-style bg=default,fg=#${colors.base0A}
      set -g mode-style bg=default,fg=#${colors.base0B}
      set -g pane-active-border-style 'fg=#${colors.base0B},bg=default'
      set -g pane-border-style 'fg=#${colors.base03},bg=default'

      set -g window-status-format '#[fg=#${colors.base03}]#{window_index}:#{window_name}#{window_flags} '
      set -g window-status-current-format '#[fg=#${colors.base0B}]#{window_index}:#{window_name}#{window_flags} '

      set -g status-right '#S '

      # keybindings
      unbind C-b
      unbind r
      set -g prefix C-a
      bind C-a send-prefix
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind c new-window -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"
      bind '%' split-window -h -c "#{pane_current_path}"
      bind space last-window
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
    '';
  };
}
