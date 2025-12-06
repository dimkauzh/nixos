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
}
