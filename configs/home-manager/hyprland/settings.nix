{ lib, config, ... }:
let
  colors = config.colorScheme.palette;
in
{
  wayland.windowManager.hyprland.settings = {
    env = [
      # "GTK_IM_MODULE, fcitx"
      # "QT_IM_MODULE, fcitx"
      # "XMODIFIERS, @im=fcitx"

      # hyprland arch config
      # QT_QPA_PLATFORMTHEME,qt6ct
      # QT_QPA_PLATFORM,wayland;xcb # Qt should use Wayland first, then X11.
      # GDK_BACKEND,wayland,x11 # GTK should use Wayland first, then X11.
      # QT_WAYLAND_DISABLE_WINDOWDECORATION,1
      # QT_AUTO_SCREEN_SCALE_FACTOR,1
      # MOZ_ENABLE_WAYLAND,1
    ];
    exec-once = [
      "waybar"
      "nm-applet --indicator"
      "swww init"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "hyprctl dispatch workspace 1"
      "fcitx5 -d -r"
      "fcitx5-remote -r"
    ];
    windowrule = [
      "pseudo, noblur, class:(fcitx)"
    ];
    windowrulev2 = [
      # "suppressevent maximize, class:.*"
      # "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      # "noborder, onworkspace:w[t1]"

      "float,class:^(org.pulseaudio.pavucontrol)$"
      "float,class:^(blueman-manager)$"
      "float,class:^(nm-applet)$"
      "float,class:^(waypaper)$"
      "float,class:^(zenity)$"
      "float,class:^(kvantummanager)$"
      "float,class:^(nwg-look)$"
      "float,class:^(nwg-displays)$"
      "float,class:^(qt6ct)$"
      "float,class:^(qt5ct)$"
      "float,class:^(mpv)$"
      "float,class:^(org.kde.gwenview)$"
      "float,class:^(org.gnome.Loupe)$"
      "float,class:^(.blueman-manager-wrapped)$"

      "workspace 10, class:^(spotify)$"

    ];
    input = {
      kb_layout = "us";
      repeat_delay = 300;
      repeat_rate = 30;
      accel_profile = "flat"; # flat, adaptive
      force_no_accel = true; # Force no mouse acceleration
      follow_mouse = 1;
      sensitivity = lib.mkDefault (0); # -1.0 - 1.0, 0 means no modification.
      # touchpad = {
      #   natural_scroll = false;
      # };
    };
    # device = {
    #   name = "razer-razer-deathadder-essential";
    #   accel_profile = "flat";
    # };

    general = {
      gaps_in = 2;
      gaps_out = 4;
      border_size = 1;
      "col.active_border" = "0x55${colors.base0F}";
      "col.inactive_border" = "0x55${colors.base00}";
      resize_on_border = false;
    };
    decoration = {
      rounding = 0;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        xray = true;
        ignore_opacity = true;
        new_optimizations = true;
      };
    };
    animations = {
      bezier = [
        "easeOutQuint,0.23,1,0.32,1"
        "easeInOutCubic,0.65,0.05,0.36,1"
        "linear,0,0,1,1"
        "almostLinear,0.5,0.5,0.75,1.0"
        "quick,0.15,0,0.1,1"
      ];

      animation = [
        "workspaces, 1, 9, default"
        "global, 1, 10, default"
        "border, 1, 5.39, easeOutQuint"
        "windows, 1, 4.79, easeOutQuint"
        "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        "windowsOut, 1, 1.49, linear, popin 87%"
        "fadeIn, 1, 1.73, almostLinear"
        "fadeOut, 1, 1.46, almostLinear"
        "fade, 1, 3.03, quick"
        "layers, 1, 3.81, easeOutQuint"
        "layersIn, 1, 4, easeOutQuint, fade"
        "layersOut, 1, 1.5, linear, fade"
        "fadeLayersIn, 1, 1.79, almostLinear"
        "fadeLayersOut, 1, 1.39, almostLinear"
        "workspaces, 1, 1.94, almostLinear, fade"
        "workspacesIn, 1, 1.21, almostLinear, fade"
        "workspacesOut, 1, 1.94, almostLinear, fade"
      ];
    };
    dwindle = {
      pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # you probably want this
    };
    misc = {
      disable_hyprland_logo = true;
    };
    master = {
      new_status = "slave";
    };
  };
}
