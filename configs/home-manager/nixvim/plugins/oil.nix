{
  programs.nixvim.plugins.oil = {
    enable = true;

    settings = {
      default_file_explorer = true;
      delete_to_trash = true;
      skip_confirm_for_simple_edits = true;
      keymaps = {
        "<C-h>" = false;
        "<C-j>" = false;
        "<C-k>" = false;
        "<C-l>" = false;
        "<leader>e" = "actions.close";
        "y." = "actions.copy_entry_path";
      };
      view_options = {
        is_always_hidden.__raw = ''
            function(name, _)
            local hidden = { ".git", ".direnv" }

          for _, value in ipairs(hidden) do
            if name == value then
              return true
                end
                end
                end
        '';
        natural_order = true;
        show_hidden = true;
      };

      win_options = {
        wrap = true;
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      action = "<cmd>Oil<CR>";
      key = "<leader>n";
      mode = "n";
      options = {
        desc = "Open parent directory";
      };
    }
  ];
}
