{ pkgs ,... } :

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
          grace = 0;
      };
      
      background = {
          monitor = "";
          path = "screenshot";
          blur_size = 4;
          blur_passes = 3; # 0 disables blurring
          noise = 0.0117;
          contrast = 1.3000; # Vibrant!!!
          brightness = 0.5000;
          vibrancy = 0.4;
          vibrancy_darkness = 0.0;
      };
      
      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo $(date +"%H:%M")'';
          color = "rgb(A0A0AB)";
          font_size = 64;
          font_family = "Ubuntu Nerd Font";
          position = "0, 150";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo $(date +"%A, %d %B %Y")'';
          color = "rgb(5D5E72)";
          font_size = 24;
          font_family = "Ubuntu Nerd Font";
          position = "0, 60";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "";
          color = "rgb(A0A0AB)";
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
          outline_thickness = 3;
          dots_size = 0.26; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
          inner_color = "rgba(0, 0, 0, 0.0)";
          outer_color = "rgb(5D5E72)";
          font_color = "rgb(A0A0AB)";
          fade_on_empty = true;
          placeholder_text = "";
          hide_input = false;
          rounding = -1; # -1 means complete rounding (circle/oval)
          check_color = "rgb(fab387)";
          fail_color = "rgb(f38ba8)"; # if authentication failed, changes outer_color and fail message color
          fail_text = "";
          fail_transition = 300; # transition time in ms between normal outer_color and fail_color
          position = "0, -30";
          halign = "center";
          valign = "center";
      };
    };

  }; 
}
