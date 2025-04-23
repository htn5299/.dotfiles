{ config, ... }:
let
  colors = config.colorScheme.palette;
in
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = "(300, 500)";
        height = "(0, 750)";
        origin = "bottom-right";
        offset = "(32,32)";

        progress_bar = true;
        progress_bar_height = 6;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 400;
        progress_bar_coner_radius = 0;

        indicate_hidden = "yes";
        shrink = "no";

        separator_height = 1;
        separator_color = ''#${colors.base0F}'';
        padding = 15;
        horizontal_padding = 15;
        frame_width = 0;
        corner_radius = 0;
        sort = "yes";
        idle_threshold = 120;

        font = "Ubuntu Nerd Font 10";
        line_height = 0;
        markup = "full";
        format = "<span font='11'>%s</span>\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        word_wrap = "yes";
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        icon_position = "left";
        min_icon_size = 50;
        max_icon_size = 60;
        icon_path = "$HOME/.local/share/icons/dunst";
        sticky_history = "yes";
        history_length = 20;
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };

      experimental = {
        per_monitor_dpi = false;
      };

      urgency_low = {
        background = ''#${colors.base01}'';
        foreground = ''#${colors.base05}'';
        highlight = ''#${colors.base06}'';
        frame_color = ''#${colors.base06}'';
        timeout = 5;
      };

      urgency_normal = {
        background = ''#${colors.base01}'';
        foreground = ''#${colors.base05}'';
        highlight = ''#${colors.base06}'';
        frame_color = ''#${colors.base0F}'';
        timeout = 5;
      };

      urgency_critical = {
        background = ''#${colors.base01}'';
        foreground = ''#${colors.base05}'';
        frame_color = ''#${colors.base08}'';
        timeout = 1000;
      };

      volume = {
        appname = "Volume";
        highlight = ''#${colors.base0F}'';
      };

      backlight = {
        appname = "Backlight";
        highlight = ''#${colors.base0F}'';
      };
    };
  };
  home.file.".local/share/icons/dunst".source = ./icons;
}
