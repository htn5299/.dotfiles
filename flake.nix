{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
    hyprland.url = "github:hyprwm/Hyprland";
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
