{ pkgs, ... }:

{
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
