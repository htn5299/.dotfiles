{ pkgs, ... }:
let
  power-menu = import ../scripts/power-menu-rofi.nix { inherit pkgs; };
  clipboard-menu = import ../scripts/clipboard-rofi.nix { inherit pkgs; };
  screenshot-menu = import ../scripts/screenshot-rofi.nix { inherit pkgs; };
  translate-menu = import ../scripts/translate-rofi.nix { inherit pkgs; };
  backlight = import ../scripts/backlight.nix { inherit pkgs; };
  volume = import ../scripts/volume.nix { inherit pkgs; };
in
{
  home.packages = [
    power-menu
    clipboard-menu
    screenshot-menu
    translate-menu
    backlight
    volume
  ];
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "ghostty";
    "$fileManager" = "thunar";
    "$killMenu" = "killall rofi";
    "$menu" = "rofi -show-icons";
    "$mainMod" = "SUPER";
    "$shiftMod" = "SUPER SHIFT";

    bind = [
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod, O, exec, $fileManager"
      "$mainMod, C, killactive,"
      "$mainMod, V, togglefloating,"

      "$mainMod, Tab, cyclenext"
      "$shiftMod, Tab, cyclenext, prev"

      "$shiftMod, L, exec, $killMenu || ${power-menu}/bin/power-menu-rofi"
      "$shiftMod, H, exec, $killMenu || ${clipboard-menu}/bin/clipboard-rofi"
      "$shiftMod, S, exec, $killMenu || ${screenshot-menu}/bin/screenshot-rofi"

      "$mainMod, T, exec, $killMenu || ${translate-menu}/bin/translate-rofi"
      "$mainMod, F, exec, $killMenu || $menu -show drun"
      "$mainMod, R, exec, $killMenu || $menu -show window"

      # Move focus with mainMod + arrow keys
      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace with mainMod + ALT + [0-9]
      "$shiftMod, 1, movetoworkspace, 1"
      "$shiftMod, 2, movetoworkspace, 2"
      "$shiftMod, 3, movetoworkspace, 3"
      "$shiftMod, 4, movetoworkspace, 4"
      "$shiftMod, 5, movetoworkspace, 5"
      "$shiftMod, 6, movetoworkspace, 6"
      "$shiftMod, 7, movetoworkspace, 7"
      "$shiftMod, 8, movetoworkspace, 8"
      "$shiftMod, 9, movetoworkspace, 9"
      "$shiftMod, 0, movetoworkspace, 10"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
      "$mainMod, N, workspace, e+1"
      "$mainMod, P, workspace, e-1"
      "$mainMod, Left, workspace, e-1"
      "$mainMod, Up, workspace, e-1"
      "$mainMod, Right, workspace, e+1"
      "$mainMod, Down, workspace, e+1"
    ];

    bindm = [
      # move/resize window
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
    bindl = [
      # media control
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"

      # volume control: mute
      ", XF86AudioMute, exec, pamixer -t"
    ];
    bindle = [
      # volume control
      ", XF86AudioRaiseVolume, exec, pamixer -i 10"
      ", XF86AudioLowerVolume, exec, pamixer -d 10"

      # brightness control
      ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
      ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
    ];
    bindel = [
      ", XF86MonBrightnessUp, exec, backlight up"
      ", XF86MonBrightnessDown, exec, backlight down"
      ", XF86AudioRaiseVolume, exec, volume up"
      ", XF86AudioLowerVolume, exec, volume down"
      ", XF86AudioMute, exec, volume mute"

      "$mainMod, comma, exec, ${backlight}/bin/backlight down"
      "$mainMod, period, exec, ${backlight}/bin/backlight up"
      "$mainMod, minus, exec, ${volume}/bin/volume down"
      "$mainMod, equal, exec, ${volume}/bin/volume up"
      # "$shiftMod, M, exec, volume mute"
    ];
  };
}
