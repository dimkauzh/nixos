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
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-25.05";
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
    nvim-config = {
      url = "github:dimkauzh/nvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fuckingnode = {
      url = "github:ZakaHaceCosas/FuckingNode";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak?ref=latest";
    };
  };

  outputs = {
    nixpkgs, self,
    home-manager,
    nix-flatpak,
    niri,
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
              niri.homeModules.niri
            ];
            home-manager.extraSpecialArgs = {
              inherit inputs self;
            };
        }
      ];
    };
  };
}
