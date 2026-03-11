{ pkgs, inputs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" "impure-derivations" "ca-derivations" ];

  programs = {
    nix-ld.enable = true;
    nm-applet.enable = true;
  };

  nixpkgs = {
    overlays = [ inputs.niri.overlays.niri ];
    config.allowUnfree = true;
  };

  services = {
    scx.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
  };

  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto;

    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        splashImage = ../assets/grub/background.png;
        theme = pkgs.tartarus;
      };
    };

    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];
    };

    initrd = {
      verbose = false;
    };

    consoleLogLevel = 0;
  };

  system = {
    activationScripts.script.text = ''
      # User icon
      cp /home/dima/.face /var/lib/AccountsService/icons/dima
      echo -e "[User]\nIcon=/var/lib/AccountsService/icons/dima\n" > /var/lib/AccountsService/users/dima
    '';
  };
}
