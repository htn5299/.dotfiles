{ pkgs, inputs, ... }:
{
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

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

  xdg.portal = {
    enable = true;
    config.common.default = "*";
  };

  security.pam.services.hyprlock = { };
}
