{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = true;
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
      unsetopt PROMPT_SP
      bindkey -v
      export KEYTIMEOUT=1
      bindkey '^?' backward-delete-char
      bindkey '^e' autosuggest-accept
      export YT_X_FZF_OPTS="--color 16"
    '';
  };
}
