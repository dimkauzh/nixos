{ ... }:

{
  imports =
    [
      ./boot.nix
      ./packages.nix
      ./power.nix
      ./hardware/hardware.nix
    ];

  networking.hostName = "zephyr";
  system.stateVersion = "25.11";
}
