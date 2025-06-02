{ ... }:

{
  imports =
    [
      ../../modules/graphics/intel.nix
      ../../modules/nixos/default.nix


      ./boot.nix
      ./packages.nix
      ./power.nix
      ./hardware/hardware.nix
    ];

  networking.hostName = "zephyr";

  # DO NOT MODIFY
  system.stateVersion = "25.05";
}
