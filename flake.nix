{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, self, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";
  in
  {
    # Define the 'zephyr' machine configuration
    nixosConfigurations.zephyr = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs self;
      };

      modules = [
        ./hosts/zephyr/configuration.nix  # Updated path to the new location
        inputs.home-manager.nixosModules.zephyr  # You can rename 'latitude' if needed
      ];
    };
  };
}

