{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.vanilla-dmz;
    # name = "Vanilla-DMZ";
    name = "DMZ-White";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";

      # package = pkgs.dracula-theme;
      # name = "Dracula";
    };
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";

      # package = pkgs.arc-icon-theme;
      # name = "Arc";
    };
    font = {
      name = "Sans";
      size = 11;
    };
  };
}
