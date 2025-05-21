{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    popupBorderStyle = "single";
    window = {
      width = 35;
    };
  };

  programs.nixvim.keymaps = [
    {
      action = "<cmd>Neotree left reveal<CR>";
      key = "<leader>e";
      mode = "n";
      options = {
        desc = "Neotree files";
      };
    }
  ];
}
