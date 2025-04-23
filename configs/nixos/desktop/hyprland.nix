{ pkgs, inputs, ... }:
{
  # programs.hyprland.enable = true;
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  xdg.portal.enable = true;
  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        lockAll = true; # prevents overriding
        settings = {
          "org/gnome/desktop/wm/preferences".button-layout = "appmenu";
          "org/gnome/desktop/interface".color-scheme = "prefer-dark";
        };
      }
    ];
  };

  services.xremap.withWlroots = true; # for xremap to work with wlroots
  # security.pam.services.swaylock.text = "auth include login";
  security.pam.services.hyprlock = { };
}
