{ pkgs, ... }:

{
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    libinput.enable = true;
    openssh.enable = true;

    acpid.enable = true;
    fwupd.enable = true;
  };

  xdg.portal = {
    enable = true;
    config.common.default = [ "gtk" "xapp" "gnome" ];
    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-xapp
      xdg-desktop-portal-gnome
    ];
  };
}
