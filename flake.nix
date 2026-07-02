{
  description = "NixOS configuration";

  nixConfig = {
    extra-substituters = [
      "https://niri.cachix.org"
      "https://kopuz.cachix.org"
      "https://attic.xuyh0120.win/lantian"
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "kopuz.cachix.org-1:J2X3AnAYhKTJW5S3aCLoA1ckonQXVNZMQvhZA0YAufw="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=main";
    kopuz.url = "github:temidaradev/kopuz";
    nvim-config.url = "git+https://codeberg.org/dimkauzh/nvim.git";

    home-manager = {
      url = "github:nix-community/home-manager?ref=release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    winapps = {
      url = "github:winapps-org/winapps";
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
  };

  outputs = {
    nixpkgs, nixpkgs-unstable, chaotic, self,
    home-manager,
    nix-flatpak,
    niri,
    ...
  } @ inputs:
  let
    system_version = "26.05";

    unstable = import nixpkgs-unstable {
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
      };
  };
  in
  {
    nixosConfigurations.zephyrwork = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs self unstable;
        system_version = system_version;
      };

      modules = [
        ./hosts/zephyrwork/machine.nix
        ./modules/nixos
        ./modules/nixos/graphics/amd.nix
        
        chaotic.nixosModules.default
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
            system_version = system_version;
          };
        }
      ];
    };

    nixosConfigurations.zephyr = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs self unstable;
        system_version = system_version;
      };

      modules = [
        ./hosts/zephyr/machine.nix
        ./modules/nixos
        ./modules/nixos/graphics/intel.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.dima.imports = [
            ./hosts/zephyr/home.nix
            ./modules/home

            niri.homeModules.niri
            nix-flatpak.homeManagerModules.nix-flatpak

          ];
          home-manager.extraSpecialArgs = {
            inherit inputs self unstable;
            system_version = system_version;
          };
        }
      ];
    };

  };
}
