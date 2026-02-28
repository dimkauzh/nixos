{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    config.common.default = [ "*" ];
    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
}
