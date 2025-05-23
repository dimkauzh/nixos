{ pkgs, inputs, ... }:

let
  tartarus = import ../packages/tartarus.nix { inherit pkgs; };
in
{
  nix.settings.experimental-features = [ "nix-command" "flakes" "impure-derivations" "ca-derivations" ];
  programs.nix-ld.enable = true;

  nixpkgs = {
    overlays = [ inputs.niri.overlays.niri ];
    config.allowUnfree = true;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        splashImage = ../assets/grub/background.png;
        theme = tartarus;
      };
    };

    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };

    initrd = {
      verbose = false;
    };

    consoleLogLevel = 0;
  };

  system.activationScripts.script.text = ''
    # User icon
    cp /home/dima/.face /var/lib/AccountsService/icons/dima
    echo -e "[User]\nIcon=/var/lib/AccountsService/icons/dima\n" > /var/lib/AccountsService/users/dima
  '';
}
