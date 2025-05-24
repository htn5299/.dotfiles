{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "clipboard-rofi";
  runtimeInputs = with pkgs; [
    rofi-wayland
    cliphist
  ];
  text = ''
    cliphist list | rofi -dmenu -p "Clipboard" | cliphist decode | wl-copy
  '';
}
