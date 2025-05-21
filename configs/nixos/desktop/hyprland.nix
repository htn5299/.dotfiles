{ pkgs, inputs, ... }:
let
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  # programs.hyprland.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  hardware.graphics = {
    package = pkgs-unstable.mesa;

    # if you also want 32-bit support (e.g for Steam)
    # driSupport32Bit = true;
    # package32 = pkgs-unstable.pkgsi686Linux.mesa.drivers;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # Fixes OpenURI and cursor theme in flatpaks
  };
  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        lockAll = true; # prevents overriding
        settings = {
          "org/gnome/desktop/wm/preferences".button-layout = "appmenu";
          "org/gnome/desktop/interface".color-scheme = "prefer-dark";
          # "org/gnome/desktop/interface".cursor-theme = "DMZ-White";
          # "org/gnome/desktop/interface".cursor-size = "24";
        };
      }
    ];
  };

  # services.xremap.withWlroots = true; # for xremap to work with wlroots
  # security.pam.services.swaylock.text = "auth include login";
  security.pam.services.hyprlock = { };
}
