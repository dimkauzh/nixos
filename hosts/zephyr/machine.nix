# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:


{
  imports =
    [
      ./boot.nix
      ./packages.nix
      ./services.nix
      ./power.nix

      ./hardware/hardware.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;

  networking.hostName = "zephyr";
  networking.networkmanager.enable = true;
  networking.dhcpcd.enable = true;

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.utf8";
  services.xserver.xkb.layout = "us";

  environment.variables = lib.mkForce {
    QT_QPA_PLATFORMTHEME  = "qt6ct";
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  users.users.dima = {
    isNormalUser = true;
    description = "Dima";
    extraGroups = [ "wheel" ];
  };

  services.xserver.displayManager.lightdm.greeters.gtk = {
    enable = true;
    theme.package = pkgs.gruvbox-gtk-theme;
    theme.name = "Gruvbox-Dark";
    iconTheme.package = pkgs.gruvbox-plus-icons;
    iconTheme.name = "Gruvbox-Plus-Dark";
    extraConfig = ''
      background=/home/dima/Pictures/Backgrounds/forest-3.jpg
    '';
  };


  # DO NOT MODIFY
  system.stateVersion = "24.11";
}
