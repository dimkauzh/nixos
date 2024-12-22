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
    extraGroups = [ "wheel" ];
  };

  # DO NOT MODIFY
  system.stateVersion = "24.11";
}
