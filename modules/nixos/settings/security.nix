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

  networking.firewall = {
    enable = true;

    allowedTCPPorts = [ 47984 47989 47990 48010 ];
    allowedUDPPorts = [ 27960 ];
    allowedUDPPortRanges = [
      { from = 47998; to = 48000; }
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
