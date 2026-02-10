{ lib, pkgs, ... }:

{
  imports =
    [
      ./boot.nix
      ./packages.nix
      ./hardware/hardware.nix
    ];


  programs = {
    virt-manager.enable = true;
  };

  security.pam.services.lightdm.fprintAuth = true;
  users.groups.libvirtd.members = [ "dima" ];
  users.groups.dialout.members = [ "dima" ];

  virtualisation = {
    podman.enable = true;
    docker.enable = true;
    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
      };
    };
  };

  networking = {
    hostName = lib.mkForce "zephyrwork";
    networkmanager.wifi.powersave = false;
  };

  services = {
    spice-vdagentd.enable = true;
    teamviewer.enable = true;
    power-profiles-daemon.enable = lib.mkForce false;

    fprintd = {
      enable = true;
      tod.enable = false;
    };
  };

  # ONLY MODIFY ON RELEASE
  system.stateVersion = "25.11";
}
