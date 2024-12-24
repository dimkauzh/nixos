{ config, lib, pkgs, ... }:

let
  gruvboxPlusIcons = import ./packages/gruvbox-icons.nix {
    inherit (pkgs) lib stdenvNoCC fetchFromGitHub gtk3 plasma5Packages gnome-icon-theme hicolor-icon-theme;
  };
in
{
  imports =
    [
      ./boot.nix
      ./packages.nix
      ./services.nix
      ./power.nix
      ./fonts.nix

      ./hardware/hardware.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  programs = {
    nix-ld.enable = true;
    zsh.enable = true;
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
