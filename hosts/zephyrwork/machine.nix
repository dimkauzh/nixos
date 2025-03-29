{ lib, ... }:

{
  imports =
    [
      ../../modules/nixos/default.nix
      ../../modules/graphics/amd.nix


      ./boot.nix
      ./packages.nix
      ./power.nix
      ./hardware/hardware.nix
    ];

  services.fprintd = {
    enable = true;
    tod.enable = false;
  };

  programs.steam.enable = true;
  programs.niri.enable = lib.mkForce true;
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
    # Wakeup on keyboard
    ACTION=="add", SUBSYSTEM=="serio", DRIVERS=="atkbd", ATTR{power/wakeup}="enabled"
  '';

  # DO NOT MODIFY
  system.stateVersion = "24.11";
}
