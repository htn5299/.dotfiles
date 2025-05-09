{ pkgs, ... }:
{
  home.packages = with pkgs; [
    psst
    qbittorrent
    nautilus
    loupe
    kdePackages.okular
    calibre
    telegram-desktop
    bitwarden-desktop
    rnote
    onlyoffice-bin
    lunatask
    krita
  ];

  programs = {
    # firefox.enable = true;
    obs-studio.enable = true;
  };
}
