{ lib, pkgs, ... }:

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

    networkmanager.wifi = {
      powersave = false;
      backend = "iwd";
    };

    wireless.iwd = {
      enable = true;
      settings = {
        Settings = {
          AutoConnect = true;
        };
      };
    };
  };

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", \
    ATTRS{idVendor}=="27c6", ATTRS{idProduct}=="609c", \
    ATTR{power/persist}="1", RUN+="${pkgs.coreutils}/bin/chmod 444 %S%p/../power/persist"
  '';


  # DO NOT MODIFY
  system.stateVersion = "24.11";
}
