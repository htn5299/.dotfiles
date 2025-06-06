{ pkgs, inputs, ... }:
{
  imports = [
    ./git.nix
    ./starship.nix
    ./translate-shell.nix
    ./tmux.nix
    ./zsh.nix
    ./yazi.nix
  ];

  home.packages = with pkgs; [
    # Coreutils replacements
    bat # cat alternative
    bottom # top alternative
    htop
    du-dust # du alternative
    duf # df alternative
    eza # ls alternative
    fd # find alternative
    ripgrep # grep alternative
    lshw

    # Utilities
    ffmpeg # media manipulation
    fx # json viewer
    fzf # fazzy finder
    ghq # git repository manager
    httpie # http client
    imagemagick # image manipulation
    jq # json parser
    killall # process killer
    lazydocker # docker tui
    nh # nix cli helper
    nurl # generate nix fetcher
    nvfetcher # nix fetcher
    procs # ps alternative
    silicon # code to image
    speedtest-cli # speedtest
    tokei # analyze code statistics
    typos # find typos
    yazi # file manager
    zellij # terminal multiplexer

    # Archives
    unar
    unrar
    unzip
    zip
    file-roller

    # Rice
    fastfetch
    neofetch

    # Downloader
    spotdl
    yt-dlp
  ];
}
