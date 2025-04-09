{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "[d" = "goto_prev";
            "]d" = "goto_next";
          };

          lspBuf = {
            "<leader>ld" = "definition";
            "<leader>lr" = "references";
            # gt = "type_definition";
            # "gi" = "implementation";
            "K" = "hover";
            "<leader>rn" = "rename";
          };
        };

        servers = {
          gopls.enable = true;
          golangci_lint_ls.enable = true;
          lua_ls.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
          pylsp.enable = true;
          tflint.enable = true;
          templ.enable = true;
          html.enable = true;
          htmx.enable = true;
          tailwindcss.enable = true;
          protols.enable = true;
        };
      };
    };
  };
}
