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
    steam.enable = true;
    virt-manager.enable = true;
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
  };

  security.pam.services.lightdm.fprintAuth = true;
  users.groups.libvirtd.members = [ "dima" ];

  virtualisation = {
    podman.enable = true;
    docker.enable = true;
    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
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

    desktopManager.cosmic = {
      enable = true;
      xwayland.enable = true;
    };

    fprintd = {
      enable = true;
      tod.enable = false;
    };

    udev = {
      packages = with pkgs; [
        numworks-udev-rules
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
  system.stateVersion = "25.05";
}
