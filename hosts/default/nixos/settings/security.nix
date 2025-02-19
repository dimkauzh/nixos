{ ... }:

{
  security.pam.services.lightdm = {
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
    });
  '';
}
