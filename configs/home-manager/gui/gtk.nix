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

      # package = pkgs.orchis-theme;
      # name = "Orchis-Purple-Dark-Compact";

      # package = pkgs.catppuccin-gtk;
      # name = "catppuccin-frappe-blue-standard";

      # package = pkgs.nordic;
      # name = "Nordic-darker";

      # package = pkgs.flat-remix-gtk;
      # name = "Flat-Remix-GTK-Blue-Dark";
    };
    iconTheme = {
      # package = pkgs.adwaita-icon-theme;
      # name = "Adwaita";

      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    font = {
      name = "Sans";
      size = 11;
    };
  };
}
