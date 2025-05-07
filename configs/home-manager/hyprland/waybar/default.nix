{
  config,
  pkgs,
  lib,
  ...
}:
let
  colors = config.colorScheme.palette;
in
{
  programs.waybar = {
    enable = true;
    # systemd.enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        # width = 20;
        # spacing = 0;
        # fixed-center = false;
        reload_style_on_change = true;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "hyprland/window"
          # "custom/spotify"
        ];
        modules-right = [
          "tray"
          # "network"
          "custom/colorpicker"
          # "custom/clipboard"
          "custom/screenshot"
          "idle_inhibitor"
          # "custom/power"
          "battery"
          "pulseaudio"
          # "custom/notification"
          "clock"
        ];
        "hyprland/workspaces" = {
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        clock = {
          format = "{:L%H:%M}";
          tooltip = true;
          tooltip-format = "<small>{calendar}</small>";
          calendar = {
            mode = "month";
            weeks-pos = "left";
            on-scroll = 1;
            format = {
              months = ''<span color="#${colors.base06}"><b>{}</b></span>'';
              weeks = ''<span color="#${colors.base0B}"><b>W{}</b></span>'';
              weekdays = ''<span color="#${colors.base09}"><b>{}</b></span>'';
              days = ''<span color="#${colors.base06}"><b>{}</b></span>'';
              today = ''<span color="#${colors.base08}"><b><u>{}</u></b></span>'';
            };
          };
          actions = {
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };
        "hyprland/window" = {
          format = "{title}";
          icon = false;
          # max-length = 50;
          # rotate = 90;
          # separate-outputs = false;
          tooltip = false;
          # rewrite = {
          #   "" = "";
          # };
        };
        tray = {
          icon-size = 12;
          show-passive-items = true;
          spacing = 12;
        };
        pulseaudio = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{icon} {volume}% {format_source}";
          format-bluetooth-muted = "{icon} {format_source}";
          format-muted = "󰝟";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphones = [
              " "
              " "
              " "
            ];
            handsfree = "󰴸";
            headset = [
              " "
              " "
              " "
            ];
            phone = [
              " "
              " "
              " "
            ];
            portable = [
              " "
              " "
              " "
            ];
            car = [
              " "
              " "
              " "
            ];
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };
        idle_inhibitor = {
          format = "{icon}";
          tooltip-format-activated = "Idle Inhibitor is active";
          tooltip-format-deactivated = "Idle Inhibitor is not active";
          format-icons = {
            activated = "󰈈";
            deactivated = "󰈉";
          };
        };
        network = {
          interval = 60;
          interface-ethernet = "enp1s*";
          interface-wifi = "wlan0";
          format-ethernet = "eth ";
          format-wifi = "󰤨";
          tooltip-format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          tooltip-format-wifi = "󰤨 {essid} ({signalStrength}%) - {ifname}: {ipaddr}/{cidr}";
          format-linked = "(No IP) ";
          format-disconnected = "Disconnected ⚠";
          on-click = "sleep 0.15 && rofi-wifi-menu";
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "<b>{icon}</b>";
          format-full = ''<span color="#${colors.base0B}"><b>{icon}</b></span>'';
          format-icons = [
            "󰁻"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰂂"
            "󰁹"
          ];
          tooltip-format = "{timeTo} {capacity} % | {power} W";
        };
        "custom/clipboard" = {
          format = "󰅍";
          tooltip = false;
          on-click = "killall rofi || rofi-clipboard";
          interval = 86400;
        };
        "custom/screenshot" = {
          format = "";
          tooltip = false;
          on-click = "hyprshot -m output";
          on-click-right = "hyprshot -m window";
        };
        "custom/power" = {
          format = "";
          tooltip = false;
          on-click = "killall rofi || rofi-power-menu";
        };
        "custom/spotify" = {
          exec = "/usr/bin/python3 $HOME/.local/bin/mediaplayer.py --player spotify";
          format = "{}";
          return-type = "json";
          on-click = "playerctl play-pause --player spotify";
          on-scroll-up = "playerctl next";
          on-scroll-down = "playerctl previous";
          max-length = 50;
          escape = true;
        };
        "custom/colorpicker" = {
          format = "";
          tooltip = false;
          on-click = "sleep 0.15 && hyprpicker -a";
          on-click-right = "sleep 0.15 && hyprpicker --format=rgb -a";
          signal = 1;
        };
      }
    ];
  };
  home.file.".config/waybar/config.jsonc".source = ./config.jsonc;
  home.file.".config/waybar/style.css".source = ./style.css;
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
