{
  pkgs,
  config,
  lib,
  ...
}:
let
  colors = config.colorScheme.palette;
  power-menu = import ../../scripts/power-menu-rofi.nix { inherit pkgs; };
  clipboard-menu = import ../../scripts/clipboard-rofi.nix { inherit pkgs; };
  screenshot-menu = import ../../scripts/screenshot-rofi.nix { inherit pkgs; };
in
{
  home.packages = [
    power-menu
    clipboard-menu
    screenshot-menu
  ];
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
    # systemd.enable = true;
    settings = [
      {
        position = "top";
        include = [ "${./shared.json}" ];
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];

        modules-center = [
        ];

        modules-right = [
          "mpris"
          "tray"
          "pulseaudio"
          "idle_inhibitor"
          "custom/colorpicker"
          "custom/screenshot"
          "custom/clipboard"
          "custom/notification"
          "battery"
          "custom/menu"
          "custom/power"
          "clock"
        ];
        "custom/power" = {
          format = "󰚥";
          tooltip = false;
          on-click = "killall rofi || ${power-menu}/bin/power-menu-rofi";
        };
        "custom/clipboard" = {
          format = "";
          tooltip = false;
          on-click = "killall rofi ||  ${clipboard-menu}/bin/clipboard-rofi";
        };

        "custom/screenshot" = {
          format = "";
          tooltip = false;
          on-click = "killall rofi ||  ${screenshot-menu}/bin/screenshot-rofi";
        };
      }
    ];
  };

  home.file.".config/waybar/colors.css".text = ''
    @define-color foreground #${colors.base04};
    @define-color background #${colors.base00};
    @define-color cursor #${colors.base06};

    @define-color color0 #${colors.base00};
    @define-color color1 #${colors.base01};
    @define-color color2 #${colors.base02};
    @define-color color3 #${colors.base03};
    @define-color color4 #${colors.base04};
    @define-color color5 #${colors.base05};
    @define-color color6 #${colors.base06};
    @define-color color7 #${colors.base07};
    @define-color color8 #${colors.base08};
    @define-color color9 #${colors.base09};
    @define-color color10 #${colors.base0A};
    @define-color color11 #${colors.base0B};
    @define-color color12 #${colors.base0C};
    @define-color color13 #${colors.base0D};
    @define-color color14 #${colors.base0E};
    @define-color color15 #${colors.base0F};
  '';
}
