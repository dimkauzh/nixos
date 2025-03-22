{
  description = "NixOS configuration";

  nixConfig = {
    extra-substituters = [
      "https://niri.cachix.org"
    ];
    extra-trusted-public-keys = [
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    mesa-pinned.url = "github:nixos/nixpkgs?rev=6a0ba68039594c1382d503f68e71a5217b3eb1b9";
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
    niri = {
      url = "github:sodiboo/nix-config?ref=main";
    };
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak?ref=latest";
    };
    fuckingnode = {
      url = "github:ZakaHaceCosas/FuckingNode";
    };
  };

  outputs = {
    nixpkgs, self,
    home-manager,
    nix-flatpak,
    mesa-pinned,
    niri,
    ...
  } @ inputs:
  let
    system = "x86_64-linux";
    mesa-pkg = import mesa-pinned { inherit system; };
  in 
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
        inherit inputs self mesa-pkg;
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
