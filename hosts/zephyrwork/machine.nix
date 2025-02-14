{ ... }:

{
  imports =
    [
      ../default/nixos/default.nix


      ./boot.nix
      ./packages.nix
      ./power.nix
      ./hardware/hardware.nix
    ];

  services.fprintd.enable = true;
  services.fprintd.tod.enable = false;
  security.pam.services.lightdm.fprintAuth = true;

  networking.hostName = "zephyr";
  networking.networkmanager.wifi.powersave = false;

  # DO NOT MODIFY
  system.stateVersion = "24.11";
}
