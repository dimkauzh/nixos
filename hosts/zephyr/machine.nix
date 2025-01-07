{ config, lib, pkgs, inputs, ... }:

let
  gruvboxPlusIcons = import ./packages/gruvbox-icons.nix { inherit pkgs; };
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports =
    [
      ./boot.nix
      ./packages.nix
      ./services.nix
      ./power.nix
      ./fonts.nix
      ./environment.nix

      ./hardware/hardware.nix

      inputs.spicetify-nix.nixosModules.default
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=15m
  '';

  programs = {
    nix-ld.enable = true;
    zsh.enable = true;

    direnv = {
      package = pkgs.direnv;
      silent = false;
      loadInNixShell = true;
      direnvrcExtra = "";
      nix-direnv = {
        enable = true;
        package = pkgs.nix-direnv;
      };
    };

    spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        shuffle
      ];
      theme = spicePkgs.themes.onepunch;
    };
  };

  networking = {
    hostName = "zephyr";
    dhcpcd.enable = true;
    networkmanager.enable = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vpl-gpu-rt
      ];
    };
  };

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.utf8";

  environment.variables = lib.mkForce {
    QT_QPA_PLATFORMTHEME  = "qt6ct";
  };

  users = {
    defaultUserShell = pkgs.zsh;

    users.dima = {
      isNormalUser = true;
      description = "Dima";
      extraGroups = [ "wheel" ];
    };
  };

  services.xserver.displayManager.lightdm.greeters.gtk = {
    enable = true;

    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark";
    };

    iconTheme = {
      package = gruvboxPlusIcons;
      name = "Gruvbox-Plus-Dark";
    };

    extraConfig = ''
      background=/etc/backgrounds/forest-3.jpg
    '';
  };

  # DO NOT MODIFY
  system.stateVersion = "24.11";
}
