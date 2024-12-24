{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  # Add home manager here too
  outputs = { nixpkgs, self, zen-browser, ... } @ inputs:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.zephyr = nixpkgs.lib.nixosSystem {
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
