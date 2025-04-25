{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.homeDirectory = "/home/htn";
  home.username = "htn";

  imports = [
    ../../configs/home-manager/ghostty
    ../../configs/home-manager/yazi
    ../../configs/home-manager/kitty
    ../../configs/home-manager/cli-utilities
    ../../configs/home-manager/git
    ../../configs/home-manager/nixvim
    ../../configs/home-manager/xdg
    ../../configs/home-manager/gtk
    ../../configs/home-manager/mpv
    ../../configs/home-manager/qt
    ../../configs/home-manager/starship
    ../../configs/home-manager/zsh
    ../../configs/home-manager/zen-browser
    ../../configs/home-manager/hyprland

    inputs.nixvim.homeManagerModules.nixvim
    inputs.nix-colors.homeManagerModules.default
  ];
  colorScheme = {
    palette = {
      base00 = "#101010";
      base01 = "#1F1F28";
      base02 = "#2A2A37";
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

  home.packages = with pkgs; [
    discord
    spotify
    figma-linux
    qbittorrent
    nautilus
    loupe
    libsForQt5.okular
    calibre
    telegram-desktop
    bitwarden-desktop
    rnote
    onlyoffice-bin
    lunatask
  ];

  programs = {
    firefox.enable = true;
    obs-studio.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    monitor = [
      # "DP-1, 2560x1440@165, 1920x0, 1"
      # "DP-2, 1920x1080@144, 0x0, 1"
      "eDP-1,1366x768@60.02, 1920x100, 1.0"
      "eDP-1,disable"
      "HDMI-A-1, 1920x1080@60.0, 0x0, 1.0"
    ];
    workspace = [
      "1,monitor:HDMI-A-1"
      "2,monitor:HDMI-A-1"
      "3,monitor:HDMI-A-1"
      "4,monitor:HDMI-A-1"
      "5,monitor:HDMI-A-1"
      "6,monitor:HDMI-A-1"
      "7,monitor:HDMI-A-1"
      "8,monitor:HDMI-A-1"
      "9,monitor:eDP-1"
      "10,monitor:eDP-1"
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
