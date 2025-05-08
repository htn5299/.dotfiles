{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };
    iconTheme = {
      # package = pkgs.adwaita-icon-theme;
      # name = "Adwaita";

      name = "Arc";
      package = pkgs.arc-icon-theme;
    };
  };
}
