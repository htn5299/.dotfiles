{
  imports = [
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
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes = {
      kanagawa = {
        enable = true;
        settings = {
          colors = {
            palette = {
              fujiWhite = "#FFFFFF";
              sumiInk0 = "#000000";
            };
            theme = {
              all = {
                ui = {
                  bg_gutter = "none";
                };
              };
              dragon = {
                syn = {
                  parameter = "yellow";
                };
              };
              wave = {
                ui = {
                  float = {
                    bg = "none";
                  };
                };
              };
            };
          };
          commentStyle = {
            italic = true;
          };
          compile = false;
          dimInactive = false;
          functionStyle = { };
          overrides = "function(colors) return {} end";
          terminalColors = true;
          theme = "wave";
          transparent = true;
          undercurl = true;
          background = {
            dark = "dragon";
            light = "lotus";
          };
        };
      };
    };

    plugins = {
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
      nvim-surround.enable = true;
    };
  };
}
