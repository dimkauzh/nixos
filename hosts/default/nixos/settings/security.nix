{ ... }:

{
  security.pam.services.lightdm = {
    enableGnomeKeyring = true;
  };
  security.pam.services.gdm-password = {
    enableGnomeKeyring = true;
  };

  services.gnome.gnome-keyring.enable = true;

  programs.ssh = {
    extraConfig = ''
      AddKeysToAgent yes
    '';
  };

  security.polkit.extraConfig = ''
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
}
