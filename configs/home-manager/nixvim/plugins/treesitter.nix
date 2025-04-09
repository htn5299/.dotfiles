{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      lazyLoad.settings = {
        cmd = [
          "TSInstall"
          "TSUpdate"
          "TSUpdateSync"
        ];

        event = [
          "BufNewFile"
          "BufReadPost"
          "BufWritePost"
          "DeferredUIEnter"
        ];

        lazy.__raw = "vim.fn.argc(-1) == 0";
      };
      nixvimInjections = true;

      folding = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        # ensure_installed = "all";
        auto_install = true;
      };
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;
  };
}
