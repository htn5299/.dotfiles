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

  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;
    plugins = [
    ];
  };

  services.swww.enable = true;

  home.packages = with pkgs; [
    waybar
    hyprshot # screenshot
    hyprpicker # color picker
    hypridle
    hyprlock
    pavucontrol
    pamixer
    brightnessctl # screen brightness
    playerctl # media player control
    waypaper
    cliphist
    wl-clipboard # clipboard manager
  ];
}
