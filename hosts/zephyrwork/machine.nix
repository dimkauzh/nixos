{ lib, pkgs, ... }:

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

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "dima" ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
  services.teamviewer.enable = true;

  networking = {
    hostName = lib.mkForce "zephyrwork";

    networkmanager.wifi = {
      powersave = false;
    };

  };

  services.udev.extraRules = ''
    # Wakeup on keyboard
    ACTION=="add", SUBSYSTEM=="serio", DRIVERS=="atkbd", ATTR{power/wakeup}="enabled"
  '';

  # DO NOT MODIFY
  system.stateVersion = "24.11";
}
