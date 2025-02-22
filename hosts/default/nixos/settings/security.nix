{ ... }:

{
  security.pam.services.lightdm = {
    enableGnomeKeyring = true;
  };
  security.pam.services.gdm-password = {
    enableGnomeKeyring = true;
  };
  services.gnome.gnome-keyring.enable = true;

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.login1.suspend" ||
          action.id == "org.freedesktop.login1.hibernate" ||
          action.id == "org.freedesktop.login1.suspend-then-hibernate") {
        return polkit.Result.YES;
      }
      if (action.id == "net.reactivated.fprint.device.verify") {
        return polkit.Result.YES;
      }
    });
  '';
}
