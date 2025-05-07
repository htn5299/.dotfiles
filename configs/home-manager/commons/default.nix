{ pkgs, ... }:
{
  home.packages = with pkgs; [
    psst
    qbittorrent
    nautilus
    loupe
    libsForQt5.okular
    calibre
    telegram-desktop
    bitwarden-desktop
    rnote
    onlyoffice-bin
    lunatask
    krita
  ];

  programs = {
    firefox.enable = true;
    obs-studio.enable = true;
  };
}
