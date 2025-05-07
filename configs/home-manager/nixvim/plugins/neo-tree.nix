{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    popupBorderStyle = "single";
  };

  programs.nixvim.keymaps = [
    {
      action = "<cmd>Neotree reveal float<CR>";
      key = "<leader>e";
      mode = "n";
      options = {
        desc = "Neotree files";
      };
    }
  ];
}
