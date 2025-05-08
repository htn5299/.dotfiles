## NIXOS

### Enabling Flakes Support for NixOS
```nix
{ config, pkgs, ... }:

{
  # ......

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    # Flakes clones its dependencies through the git command,
    # so git must be installed first
    git
    vim
    wget
  ];

  # ......
}
```

### Install
```sh
sudo nixos-rebuild switch
# git clone ......
cp /etc/nixos/hardware-configuration.nix ~/.dotfiles/hosts/pavilion/hardware-configuration.nix
cd ~/.dotfiles
sudo nixos-rebuild switch --flake "./#pavilion"
nix run home-manager --no-write-lock-file -- switch --flake "./#htn@pavilion"
```

### Git
```sh
git remote -v
git remote set-url origin git@github.com:htn5299/.dotfiles.git
# git ......
```
