{ system_version, ... }:

{
  imports =
    [
      ./boot.nix
      ./packages.nix
      ./power.nix
      ./hardware/hardware.nix
    ];

  networking.hostName = "zephyr";
  system.stateVersion = system_version;
}
