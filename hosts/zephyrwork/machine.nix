{ lib, pkgs, ... }:

{
  imports =
    [
      ./boot.nix
      ./packages.nix
      ./power.nix
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

    udev = {
      packages = with pkgs; [
        numworks-udev-rules
        uhk-udev-rules
      ];

      extraRules = ''
        # Wakeup on keyboard
        ACTION=="add", SUBSYSTEM=="serio", DRIVERS=="atkbd", ATTR{power/wakeup}="enabled"

        # NS-USBLOADER
        SUBSYSTEM=="usb", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="3000", MODE="0666"

        # YAFI
        KERNEL=="port", TAG+="uaccess"
        KERNEL=="cros_ec", TAG+="uaccess"

        # SysDVR
        SUBSYSTEM=="usb", ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="4ee0", MODE="0666"
      '';
    };
  };

  # ONLY MODIFY ON RELEASE
  system.stateVersion = "25.11";
}
