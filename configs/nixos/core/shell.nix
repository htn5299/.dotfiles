{ pkgs, ... }:
{
  programs = {
    zsh.enable = true;
    git.enable = true;
  };

  environment.systemPackages = with pkgs; [
    acpi
    bottom
    duf
    lsof
    pciutils
    vim
    nodejs
    gcc
  ];

}
