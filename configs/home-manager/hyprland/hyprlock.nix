{ config, ... }:
let
  palette = config.colorScheme.palette;
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 0;
        hide_cursor = true;
      };

      background = {
        monitor = "";
        path = "screenshot";
        blur_size = 4;
        blur_passes = 3; # 0 disables blurring
        noise = 0.0117;
        contrast = 0.5000; # Vibrant!!!
        brightness = 0.3000;
        vibrancy = 0.4;
        vibrancy_darkness = 0.0;
      };

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo $(date +"%H:%M")'';
          color = "0xFF${palette.base03}";
          font_size = 64;
          font_family = "Ubuntu Nerd Font";
          position = "-30, -30";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo $(date +"%A, %d %B %Y")'';
          color = "0xFF${palette.base04}";
          font_size = 24;
          font_family = "Ubuntu Nerd Font";
          position = "-30, -120";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "";
          color = "0xFF${palette.base04}";
          font_size = 18;
          font_family = "Ubuntu Nerd Font";
          position = "0, 30";
          halign = "center";
          valign = "bottom";
        }
      ];

      input-field = {
        monitor = "";
        size = "250, 50";
        outline_thickness = 1;
        dots_size = 0.26; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
        inner_color = "0x00${palette.base00}";
        outer_color = "0xFF${palette.base03}";
        font_color = "0xFF${palette.base0F}";
        fade_on_empty = true;
        hide_input = false;
        rounding = 0; # -1 means complete rounding (circle/oval)
        # placeholder_text = ''<span foreground="##${palette.base02}">Password</span>'';
        placeholder_text = "";
        check_color = "0xFF${palette.base0A}";
        fail_color = "0xFF${palette.base08}"; # if authentication failed, changes outer_color and fail message color
        fail_text = "";
        fail_transition = 100; # transition time in ms between normal outer_color and fail_color
        position = "0, 0";
        halign = "center";
        valign = "center";
      };
    };
  };
}
