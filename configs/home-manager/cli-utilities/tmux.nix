{
  pkgs,
  config,
  inputs,
  ...
}:
let
  colors = config.colorScheme.palette;
  t-smart-manager = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "t-smart-tmux-session-manager";
    version = "unstable-2023-01-06";
    rtpFilePath = "t-smart-tmux-session-manager.tmux";
    src = pkgs.fetchFromGitHub {
      owner = "joshmedeski";
      repo = "t-smart-tmux-session-manager";
      rev = "a1e91b427047d0224d2c9c8148fb84b47f651866";
      sha256 = "sha256-HN0hJeB31MvkD12dbnF2SjefkAVgtUmhah598zAlhQs=";
    };
  };
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
  tmux-browser = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-browser";
    version = "unstable-2023-01-06";
    src = pkgs.fetchFromGitHub {
      owner = "ofirgall";
      repo = "tmux-browser";
      rev = "c3e115f9ebc5ec6646d563abccc6cf89a0feadb8";
      sha256 = "sha256-ngYZDzXjm4Ne0yO6pI+C2uGO/zFDptdcpkL847P+HCI=";
    };
  };

  tmux-super-fingers = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-super-fingers";
    version = "unstable-2023-01-06";
    src = pkgs.fetchFromGitHub {
      owner = "artemave";
      repo = "tmux_super_fingers";
      rev = "2c12044984124e74e21a5a87d00f844083e4bdf7";
      sha256 = "sha256-cPZCV8xk9QpU49/7H8iGhQYK6JwWjviL29eWabuqruc=";
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
    # terminal = "tmux-256color";
    plugins = with pkgs; [
      tmux-nvim
      tmuxPlugins.tmux-thumbs
      # TODO: why do I have to manually set this
      {
        plugin = t-smart-manager;
        extraConfig = ''
          set -g @t-fzf-prompt '  '
          set -g @t-bind "T"
        '';
      }
      tmuxPlugins.sensible
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
        '';
      }
      {
        plugin = inputs.minimal-tmux.packages.${pkgs.system}.default;
        extraConfig = ''
          set -g @minimal-tmux-justify "left"
          set -g @minimal-tmux-fg "#${colors.base08}"
          set -g @minimal-tmux-bg "default"
          set -g @minimal-tmux-indicator-str ' '
        '';
      }
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.yank
    ];
    extraConfig = ''
      set-option -g automatic-rename on
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"
      set -g set-titles on
      # set-option -g terminal-features ',*:RGB'
      # set-option -g default-terminal 'xterm-256color'
      set-option -g automatic-rename-format '#{b:pane_current_path}'
      # set-option -g base-index 1
      set-option -g history-limit 20000
      # set-option -g mode-keys vi
      # set-option -g mouse on
      set-option -g pane-base-index 1
      set-option -g renumber-windows on
      set-option -g set-clipboard on
      set-option -g status on
      set-option -g status-interval 1
      set-option -g wrap-search off
      # set-option -s escape-time 0

      set -g status-position top
      # set -g status-style 'bg=default' # transparent
      set -g allow-passthrough on

      set -g status-style 'fg=#${colors.base03},bg=default'

      set -g message-command-style bg=default,fg=#${colors.base0A}
      set -g message-style bg=default,fg=#${colors.base0A}
      set -g mode-style bg=default,fg=#${colors.base0B}
      set -g pane-active-border-style 'fg=#${colors.base0B},bg=default'
      set -g pane-border-style 'fg=#${colors.base03},bg=default'

      set -g window-status-format '#[fg=#${colors.base03}]#{window_index}:#{window_name}#{window_flags} '
      set -g window-status-current-format '#[fg=#${colors.base0B}]#{window_index}:#{window_name}#{window_flags} '

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
