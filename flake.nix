{
  description = "NixOS configuration";

  nixConfig = {
    extra-substituters = [
      "https://niri.cachix.org"
      "https://attic.xuyh0120.win/lantian"
    ];
    extra-trusted-public-keys = [
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-25.11";
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
    nixpkgs, nixpkgs-unstable, self,
    home-manager,
    nix-flatpak,
    niri,
    ...
  } @ inputs:
  let
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
      };

      modules = [
        ./hosts/zephyrwork/machine.nix
        ./modules/nixos
        ./modules/nixos/graphics/amd.nix

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
          };
        }
      ];
    };

  };
}
