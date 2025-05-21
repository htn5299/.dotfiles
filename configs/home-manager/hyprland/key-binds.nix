{ pkgs, ... }:
let
  volume =
    pkgs.writeScriptBin "volume"
      # bash
      ''
        case $1 in
        up)
          # Set the volume on (if it was muted)
          wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
          wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 5%+
          ;;
        down)
          wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
          wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 5%-
          ;;
        mute)
          wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
          ;;
        esac

        VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | tr -dc '0-9' | sed 's/^0\{1,2\}//')

        send_notification() {
          if [ "$1" = "mute" ]; then ICON="mute"; elif [ "$VOLUME" -lt 33 ]; then ICON="low"; elif [ "$VOLUME" -lt 66 ]; then ICON="medium"; else ICON="high"; fi
          if [ "$1" = "mute" ]; then TEXT="Currently muted"; else TEXT="Currently at $VOLUME%"; fi

          dunstify -a "Volume" -r 9993 -h int:value:"$VOLUME" -i "volume-$ICON" "Volume" "$TEXT" -t 2000
        }

        case $1 in
        mute)
          case "$(wpctl get-volume @DEFAULT_AUDIO_SINK@)" in
          *MUTED*) send_notification mute ;;
          *) send_notification ;;
          esac
          ;;
        *)
          send_notification
          ;;
        esac
      '';
  backlight =
    pkgs.writeScriptBin "backlight"
      # bash
      ''
        #!/bin/sh

        # Use brightnessctl to naturally adjust laptop screen brightness and send a notification

        CURRENTBRIGHTNESS=$(brightnessctl -e4 -m | awk -F, '{print substr($4, 0, length($4)-1)}')
        if [ "$CURRENTBRIGHTNESS" -lt 30 ] && [ "$1" = "down" ]; then exit 1; fi

        send_notification() {
        	BRIGHTNESS=$(brightnessctl -e4 -m | awk -F, '{print substr($4, 0, length($4)-1)}')
        	dunstify -a "Backlight" -u low -r 9994 -h int:value:"$BRIGHTNESS" -i "brightness" "Brightness" "Currently at $CURRENTBRIGHTNESS%" -t 1000
        }

        case $1 in
        	up)
        		brightnessctl -e4 set 5%+
        		send_notification "$1"
        		;;
        	down)
        		brightnessctl -e4 set 5%-
        		send_notification "$1"
        		;;
        esac
      '';
  rofi-clipboard =
    pkgs.writeScriptBin "rofi-clipboard"
      # bash
      ''
        cliphist list | rofi -dmenu -p "Clipboard" | cliphist decode | wl-copy
      '';

  rofi-translate =
    pkgs.writeScriptBin "rofi-translate"
      # bash
      ''
        #!/bin/sh

        # Prompt for translation input using rofi
        input=$(rofi -dmenu -p "Translate")

        # Check if input is not empty
        if [[ -n "$input" ]]; then
            # Translate the input
            translation=$(trans -b "$input")

            # Remove newlines from translation
            clean_translation=$(echo "$translation" | tr -d '\n')

            # Only notify if translation is not empty
            if [[ -n "$clean_translation" ]]; then
                dunstify -t 5000 "Translation" "$input\n$clean_translation"
            fi
        fi
      '';
  rofi-screenshot-menu =
    pkgs.writeScriptBin "rofi-screenshot-menu"
      # bash
      ''
        screenshot_output="  Fullscreen"
        screenshot_window="󰹑  Window"
        screenshot_region="󱣴  Region"

        selected=$(
          printf "%s\n%s\n%s\n%s\n" \
            "$screenshot_output" "$screenshot_window" "$screenshot_region" |
            rofi -dmenu -i -p "Screenshot Menu" -lines 3
        )

        case $selected in
        "$screenshot_output")
          hyprshot -m output
          ;;

        "$screenshot_window")
          hyprshot -m window
          ;;

        "$screenshot_region")
          hyprshot -m region
          ;;
        esac
      '';
  rofi-power-menu =
    pkgs.writeScriptBin "rofi-power-menu"
      # bash
      ''
        lang_pc_shutdown="  Shutdown"
        lang_pc_reboot="  Reboot"
        lang_pc_logout="  Logout"
        lang_pc_lock="  Lock"

        selected=$(
          printf "%s\n%s\n%s\n%s\n" \
            "$lang_pc_lock" "$lang_pc_logout" "$lang_pc_reboot" "$lang_pc_shutdown" |
            rofi -dmenu -i -p "Power Menu" -lines 4
        )

        case $selected in
        "$lang_pc_shutdown")
          systemctl poweroff
          ;;

        "$lang_pc_reboot")
          systemctl reboot
          ;;

        "$lang_pc_logout")
          hyprctl dispatch exit
          ;;
        "$lang_pc_lock")
          hyprctl dispatch exec hyprlock
          ;;
        esac
      '';
in
{
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "ghostty";
    "$fileManager" = "nautilus";
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

      "$shiftMod, L, exec, $killMenu || ${rofi-power-menu}/bin/rofi-power-menu"
      "$shiftMod, H, exec, $killMenu || ${rofi-clipboard}/bin/rofi-clipboard"
      "$shiftMod, S, exec, $killMenu || ${rofi-screenshot-menu}/bin/rofi-screenshot-menu"

      "$mainMod, T, exec, $killMenu || ${rofi-translate}/bin/rofi-translate"
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
