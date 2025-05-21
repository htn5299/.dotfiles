{
  imports = [
    ./alpha.nix
    ./oil.nix
    ./fzf-lua
    ./lsp.nix
    ./treesitter.nix
    ./lualine.nix
    ./nix.nix
    ./git.nix
    ./which-key.nix
    ./blink-cmp.nix
    ./lz-n.nix
    ./conform.nix
    ./highlight-colors.nix
    ./indent.nix
    ./base16.nix
    ./neo-tree.nix
    ./neoscroll.nix
    ./tmux-navigator.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    plugins = {
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
      nvim-surround.enable = true;
      ts-autotag.enable = true;
      comment.enable = true;
      dressing.enable = true;
      # barbecue.enable = true;
      # navic.enable = true;
    };
  };
}
