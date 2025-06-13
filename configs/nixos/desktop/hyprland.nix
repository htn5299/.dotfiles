{ pkgs, ... }:
{
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };
  # ...

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
