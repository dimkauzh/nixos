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
        IPv6 = {
          Enabled = true;
        };
        IPv4 = {
          Enabled = true;
        };
        Settings = {
          AutoConnect = true;
        };
      };
    };
  };

  systemd.services.fingerprint-restart = {
    description = "Restart services to fix fingerprint integration";
    wantedBy = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" "suspend-then-hibernate.target" ];
    after = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" "suspend-then-hibernate.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.systemd}/bin/systemctl lightdm-gtk-greeter.service restart open-fprintd.service python3-validity.service
      '';
    };
  };

  # DO NOT MODIFY
  system.stateVersion = "24.11";
}
