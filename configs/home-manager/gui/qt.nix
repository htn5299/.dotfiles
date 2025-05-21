{ pkgs, ... }:

{
  qt = {
    enable = true;

    platformTheme.name = "qt5ct";

    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-frappe-blue
    '';

    "Kvantum/catppuccin-frappe-blue".source =
      "${pkgs.catppuccin-kvantum}/share/Kvantum/catppuccin-frappe-blue";
  };
}
