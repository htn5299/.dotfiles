{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../../configs/nixos/core/network.nix
    ../../configs/nixos/core/nix.nix
    ../../configs/nixos/core/bluetooth.nix
    ../../configs/nixos/core/nvidia.nix
    ../../configs/nixos/core/shell.nix

    ../../configs/nixos/apps/commons.nix
    ../../configs/nixos/apps/dropbox.nix
    ../../configs/nixos/apps/flatpak.nix
    ../../configs/nixos/apps/kanata.nix
    ../../configs/nixos/apps/keyring.nix
    ../../configs/nixos/apps/postgresql.nix
    ../../configs/nixos/apps/steam.nix
    ../../configs/nixos/apps/thunar.nix

    ../../configs/nixos/desktop/fcitx5.nix
    ../../configs/nixos/desktop/fonts.nix
    ../../configs/nixos/desktop/hyprland.nix
    ../../configs/nixos/desktop/sound.nix
  ];
  # ++ (with inputs.nixos-hardware.nixosModules; [
  #   common-cpu-intel
  #   common-gpu-nvidia
  #   common-pc-ssd
  # ]);

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = false;
      timeout = -1;

      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
    };
  };

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # gdm display manager
  services.xserver.displayManager.gdm.enable = true;

  # ly display manager
  # services.displayManager.ly.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.htn = {
    isNormalUser = true;
    description = "htn";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "input"
    ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "24.11";
}
