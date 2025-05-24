{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "screenshot-rofi";
  runtimeInputs = with pkgs; [
  ];
  text = ''
    screenshot_output="  Fullscreen"
    screenshot_window="󰹑  Window"
    screenshot_region="󱣴  Region"

    selected=$(
      printf "%s\n%s\n%s\n" \
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
}
