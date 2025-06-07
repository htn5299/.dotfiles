{
  imports = [
    ./base16.nix
    ./blink.nix
    ./conform.nix
    ./fzf-lua.nix
    ./gitsigns.nix
    ./highlight-colors.nix
    ./lint.nix
    ./lsp.nix
    ./neo-tree.nix
    ./neocord.nix
    ./oil.nix
    ./snacks.nix
    ./tmux-navigator.nix
    ./treesitter.nix
    ./trouble.nix
    ./which-key.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    plugins = {
      nix.enable = true;
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
      nvim-surround.enable = true;
      ts-autotag.enable = true;
      comment.enable = true;
      fugitive.enable = true;
      dressing.enable = true;
      lz-n.enable = true;
      markview.enable = true;
    };
  };
}
