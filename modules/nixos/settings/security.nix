{ pkgs, ... }:

{
  services.gnome.gnome-keyring.enable = true;

  programs = {
    ssh = {
      extraConfig = ''
        AddKeysToAgent yes
      '';
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };
  };

  services.udev = {
    packages = with pkgs; [
      numworks-udev-rules
      uhk-udev-rules
    ];

    extraRules = ''
      # Wakeup on keyboard
      ACTION=="add", SUBSYSTEM=="serio", DRIVERS=="atkbd", ATTR{power/wakeup}="enabled"

      # Waybar fix
      ACTION=="change", SUBSYSTEM=="drm", RUN+="${pkgs.systemd}/bin/systemctl --user restart waybar.service"

      # NS-USBLOADER
      SUBSYSTEM=="usb", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="3000", MODE="0666"

      # YAFI
      KERNEL=="port", TAG+="uaccess"
      KERNEL=="cros_ec", TAG+="uaccess"

      # SysDVR
      SUBSYSTEM=="usb", ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="4ee0", MODE="0666"
    '';
  };

  networking.firewall = {
    enable = true;

    trustedInterfaces = [ "p2p-wl+" ];
    allowedTCPPorts = [
      # Counter Strike
      27015

      # No idea
      47984 47989 47990 48010 7236 7250 5353 
    ];
    allowedUDPPorts = [
      # Counter Strike
      27005 27015 27020
      
      # No idea
      27960 7236 5353 1900 1901 5353
    ];
    allowedUDPPortRanges = [
      { from = 47998; to = 48000; }
      { from = 5000; to = 5999; }
      { from = 8000; to = 8010; }
    ];
  };

  security = {
    rtkit.enable = true;

    pam.services = {
      gdm-password.enableGnomeKeyring = true;
      lightdm.enableGnomeKeyring = true;
      swaylock.enable = true;
    };

    polkit.extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.login1.suspend" ||
            action.id == "org.freedesktop.login1.hibernate" ||
            action.id == "org.freedesktop.login1.suspend-then-hibernate" ||
            action.id == "net.reactivated.fprint.device.verify") {
          return polkit.Result.YES;
        }
        if (action.id == "org.freedesktop.NetworkManager.settings.modify.system" &&
          subject.isInGroup("dima")) {
          return polkit.Result.YES;
        }
      });
    '';
  };
}
