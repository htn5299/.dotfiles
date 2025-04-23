{ pkgs, inputs, ... }:
{
  imports = [
    ./settings.nix
    ./key-binds.nix
    ./rofi
    ./waybar
    ./dunst
    ./hyprlock.nix
    ./hypridle.nix
  ];

  wayland.windowManager.hyprland.enable = true;
  # wayland.windowManager.hyprland.plugins = [
  #   # ... whatever
  #   inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
  # ];
  wayland.windowManager.hyprland = {
    plugins = [
      # inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
      # (inputs.hyprspace.packages.${pkgs.system}.Hyprspace.overrideAttrs {
      #   dontUseCmakeConfigure = true;
      # })
    ];
  };

  home.packages = with pkgs; [
    hyprshot # screenshot
    hyprpicker # color picker
    hypridle
    hyprlock
    pavucontrol
    pamixer
    brightnessctl # screen brightness
    playerctl # media player control
    swww # wallpaper
    waypaper
    cliphist
    wl-clipboard # clipboard manager
  ];
}
