{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable-small";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };
    fuckingnode = {
      url = "github:ZakaHaceCosas/FuckingNode";
    };
  };

  outputs = {
    nixpkgs, self,
    home-manager,
    nix-flatpak,
    ...
  } @ inputs:
  {
    nixosConfigurations.zephyr = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs self;
      };

      modules = [
        ./hosts/zephyr/machine.nix
        home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dima.imports = [
              ./hosts/zephyr/home.nix
              nix-flatpak.homeManagerModules.nix-flatpak
            ];
            home-manager.extraSpecialArgs = {
              inherit inputs self;
            };
        }
        nix-flatpak.nixosModules.nix-flatpak
      ];
    };

    nixosConfigurations.zephyrwork = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs self;
      };

      modules = [
        ./hosts/zephyrwork/machine.nix
        home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dima.imports = [
              ./hosts/zephyrwork/home.nix
              nix-flatpak.homeManagerModules.nix-flatpak
            ];
            home-manager.extraSpecialArgs = {
              inherit inputs self;
            };
        }
        nix-flatpak.nixosModules.nix-flatpak
      ];
    };
  };
}
