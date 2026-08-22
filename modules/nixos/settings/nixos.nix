{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "impure-derivations"
    "ca-derivations"
  ];

  programs = {
    nix-ld.enable = true;
    nm-applet.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.download-buffer-size = 21474836480;

  hardware.enableRedistributableFirmware = true;

  services = {
    dbus.enable = true;
    flatpak.enable = true;

    # Started to give me issues
    scx = {
      enable = true;
      scheduler = "scx_rusty";
    };
  };

  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    initrd.verbose = false;
    consoleLogLevel = 3;

    supportedFilesystems = [
      "nfs"
      "cifs"
      "ntfs"
      "exfat"
      "vfat"
      "btrfs"
    ];

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
  };

  system = {
    activationScripts.script.text = ''
      # Dima User icon
      cp ${../../home/assets/icons/dima.png} /var/lib/AccountsService/icons/dima
      echo -e "[User]\nIcon=/var/lib/AccountsService/icons/dima\n" > /var/lib/AccountsService/users/dima
    '';
  };
}
