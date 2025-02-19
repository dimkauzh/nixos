{ lib, ... }:

{
  imports =
    [
      ../default/nixos/default.nix
      ../default/graphics/amd.nix


      ./boot.nix
      ./packages.nix
      ./power.nix
      ./hardware/hardware.nix
    ];

  services.fprintd = {
    enable = true;
    tod.enable = false;
  };
  security.pam.services.lightdm.fprintAuth = true;

  networking = {
    hostName = lib.mkForce "zephyrwork";
    networkmanager.wifi.powersave = false;
  };


  # DO NOT MODIFY
  system.stateVersion = "24.11";
}
