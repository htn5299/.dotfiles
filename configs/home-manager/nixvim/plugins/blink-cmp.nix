{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    # Không còn cần friendly-snippets
    settings = {
      keymap.preset = "super-tab";
      completion = {
        menu = {
          border = "single";
          draw = {
            columns = [
              [ "item_idx" ]
              [ "kind_icon" ]
              { __raw = ''{ "label", "label_description", gap = 1 }''; }
            ];
            components = {
              item_idx.text.__raw = "function(ctx) return tostring(ctx.idx) end";
            };
          };
        };
        documentation.window.border = "single";
      };

      cmdline = {
        enabled = true;
        completion.menu.auto_show = true;
      };
      appearance = {
        use_nvim_cmp_as_default = true;
        nerd_font_variant = "mono";
      };

      sources.default = [
        "lsp"
        "path"
        "buffer"
      ];
    };
  };
}
