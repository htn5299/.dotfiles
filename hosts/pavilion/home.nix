{
  inputs,
  ...
}:

{
  home.homeDirectory = "/home/htn";
  home.username = "htn";

  imports = [
    ../../configs/home-manager/cli-utilities
    ../../configs/home-manager/commons
    ../../configs/home-manager/gui
    ../../configs/home-manager/hyprland
    ../../configs/home-manager/nixvim
    ../../configs/home-manager/xdg

    inputs.nixvim.homeManagerModules.nixvim
    inputs.nix-colors.homeManagerModules.default
  ];
  colorScheme = {
    palette = {
      base00 = "#101010";
      base01 = "#1F1F28";
      base02 = "#44445d";
      base03 = "#54546d";
      base04 = "#727169";
      base05 = "#dcd7ba";
      base06 = "#c8c093";
      base07 = "#717c7c";
      base08 = "#c34043";
      base09 = "#ffa066";
      base0A = "#c0a36e";
      base0B = "#76946a";
      base0C = "#6a9589";
      base0D = "#7e9cd8";
      base0E = "#957fb8";
      base0F = "#938AA9"; # accent
    };
  };

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,1366x768, 1920x100, 1.0"
      # "eDP-1,disable"
      "HDMI-A-1, 1920x1080, 0x0, 1.0"
    ];
    workspace = [
      "1,monitor:HDMI-A-1"
      "2,monitor:HDMI-A-1"
      "3,monitor:HDMI-A-1"
      "4,monitor:HDMI-A-1"
      "5,monitor:HDMI-A-1"
      "6,monitor:eDP-1"
      "7,monitor:eDP-1"
      "8,monitor:eDP-1"
      "9,monitor:HDMI-A-1"
      "10,monitor:HDMI-A-1"
    ];
    input.kb_layout = "us";
  };
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
