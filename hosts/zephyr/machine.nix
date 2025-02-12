{ config, lib, pkgs, inputs, ... }:

let
  mantablockscreen = import ./packages/mantablockscreen.nix { inherit pkgs; };
in
{
  imports =
    [
      ../default/graphics/intel.nix
      ../default/nixos/default.nix


      ./boot.nix
      ./packages.nix
      ./power.nix
      ./hardware/hardware.nix
    ];

  networking.hostName = "zephyr";

  # DO NOT MODIFY
  system.stateVersion = "24.11";
}
