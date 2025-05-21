{
  programs.nixvim.plugins.neoscroll = {
    enable = true;
    settings = {
      cursor_scrolls_alone = true;
      easing_function = "quadratic";
      hide_cursor = true;
      mappings = [
        "<C-u>"
        "<C-d>"
      ];
      respect_scrolloff = false;
      stop_eof = true;
    };
  };
}
