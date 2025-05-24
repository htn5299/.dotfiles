{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "power-menu-rofi";
  runtimeInputs = with pkgs; [
    rofi-wayland
    systemd # provides systemctl
    hyprland # provides hyprctl (if you're using Hyprland)
  ];
  text = ''
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
}
