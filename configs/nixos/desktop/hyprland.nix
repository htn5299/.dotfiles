{ pkgs, inputs, ... }:
let
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.hyprland.enable = true;

  xdg.portal.enable = true;

  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        lockAll = true;
        settings = {
          "org/gnome/desktop/wm/preferences".button-layout = "appmenu";
          "org/gnome/desktop/interface".color-scheme = "prefer-dark";
        };
      }
    ];
  };

  security.pam.services.hyprlock = { };
}
