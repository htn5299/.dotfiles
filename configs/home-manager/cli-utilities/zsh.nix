{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    # tmux.enableShellIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      cat = "bat";
      grep = "rg";
      ls = "eza --icons always --classify always";
      la = "eza --icons always --classify always --all ";
      ll = "eza --icons always --long --all --git ";
      tree = "eza --icons always --classify always --tree";
    };

    history = {
      size = 10000;
    };

    initExtra = ''
      # unsetopt PROMPT_SP
      # bindkey -v
      # export KEYTIMEOUT=1
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

      function zvm_after_init() {
        zvm_bindkey viins "^R" fzf-history-widget
      }

      bindkey '^?' backward-delete-char
      bindkey '^e' autosuggest-accept
    '';
  };
}
