{ pkgs, ... }:
{
  imports = [
    ./ghostty.nix
    ./joplin.nix
    ./kitty.nix
    ./mpv.nix
    ./zen.nix
  ];
  home.packages = with pkgs; [
    discord
    # spotify
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
    # figma-linux
  ];

  programs = {
    firefox.enable = true;
    obs-studio.enable = true;
  };

  programs.spotify-player = {
    enable = true;
    settings = {
      theme = "default";
      enable_notify = false;
      cover_img_width = 6;
      cover_img_length = 14;
      cover_img_scale = 1.0;
      copy_command = {
        command = "wl-copy";
        args = [ ];
      };
    };
    keymaps = [
      {
        command = "None";
        key_sequence = "q";
      }
      {
        command = {
          VolumeChange = {
            offset = 5;
          };
        };
        key_sequence = "=";
      }
    ];
  };

}
