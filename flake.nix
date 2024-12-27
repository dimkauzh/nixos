{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  # Add home manager here too
  outputs = { nixpkgs, self, spicetify-nix, ... } @ inputs:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.zephyr = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs self;
      };

      modules = [
        ./hosts/zephyr/machine.nix
        # home-manager.nixosModules.home-manager
        # {
        #     home-manager.useGlobalPkgs = true;
        #     home-manager.useUserPackages = true;
        #     home-manager.users.dima = import ./hosts/zephyr/home.nix;
        # }
      ];
    };
  };
}
