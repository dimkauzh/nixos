{
  description = "NixOS configuration";

  nixConfig = {
    extra-substituters = [
      "https://niri.cachix.org"
      "https://chaotic-nyx.cachix.org"
    ];
    extra-trusted-public-keys = [
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
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
      url = "git+https://codeberg.org/dimkauzh/nvim-config.git";
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
      url = "github:gmodena/nix-flatpak?ref=main";
    };
  };

  outputs = {
    nixpkgs, nixpkgs-unstable, chaotic, self,
    home-manager,
    nix-flatpak,
    niri,
    ...
  } @ inputs:
  let
    unstable = import nixpkgs-unstable { system = "x86_64-linux"; };
  in
  {
    nixosConfigurations.zephyrwork = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs self unstable;
      };

      modules = [
        ./hosts/zephyrwork/machine.nix
        ./modules/nixos
        ./modules/nixos/graphics/amd.nix

        chaotic.nixosModules.nyx-cache
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry

        home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dima.imports = [
              ./hosts/zephyrwork/home.nix
              ./modules/home

              niri.homeModules.niri
              nix-flatpak.homeManagerModules.nix-flatpak
            ];
            home-manager.extraSpecialArgs = {
              inherit inputs self unstable;
            };
        }
      ];
    };

    nixosConfigurations.zephyr = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs self unstable;
      };

      modules = [
        ./hosts/zephyr/machine.nix
        ./modules/nixos
        ./modules/nixos/graphics/intel.nix

        chaotic.nixosModules.nyx-cache
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry

        home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dima.imports = [
              ./hosts/zephyr/home.nix
              ./mmodules/home

              niri.nixosModules.niri
              nix-flatpak.homeManagerModules.nix-flatpak

            ];
            home-manager.extraSpecialArgs = {
              inherit inputs self unstable;
            };
        }
      ];
    };

  };
}
