{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; 
    home-manager.url = "github:nix-community/home-manager"; 
    zen-browser.url = "github:0xc000022070/zen-browser-flake"; 
    hyprland.url = "github:hyprwm/Hyprland"; 
    xremap.url = "github:xremap/nix-flake";

    # Inner deps
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    # xremap.inputs.flake-parts.follows = "flake-parts";
    xremap.inputs.home-manager.follows = "home-manager";
    xremap.inputs.hyprland.follows = "hyprland";
    xremap.inputs.nixpkgs.follows = "nixpkgs";
    # xremap.inputs.treefmt-nix.follows = "treefmt-nix";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      "pavilion" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; 
	specialArgs = { inherit inputs; };
        modules = [
	  ./hosts/pavilion/configuration.nix
        ];
      };
    };
    homeConfigurations = {
      "htn@pavilion" = home-manager.lib.homeManagerConfiguration {
       pkgs = import nixpkgs {
         system = "x86_64-linux";
         config.allowUnfree = true;
       };
       extraSpecialArgs = {
         inherit inputs;
       };
       modules = [
         ./hosts/pavilion/home.nix
       ];
      }; 
    };
  };
}
