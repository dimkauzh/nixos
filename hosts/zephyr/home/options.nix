{ config, pkgs, ... }:

let
  nvim-config = import ./packages/neovim.nix { inherit pkgs; };
in
{
  xdg = {
    configFile."mimeapps.list".force = true;

    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/zip" = [ "xarchiver.desktop" ];
        "application/x-tar" = [ "xarchiver.desktop" ];
        "application/x-7z-compressed" = [ "xarchiver.desktop" ];
        "application/x-rar" = [ "xarchiver.desktop" ];
        "application/gzip" = [ "xarchiver.desktop" ];
        "application/x-bzip" = [ "xarchiver.desktop" ];
        "application/x-xz" = [ "xarchiver.desktop" ];

        "inode/directory" = [ "nemo.desktop" ];
      };
    };

    portal = {
      enable = true;
      config.common.default = "*";

      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-xapp
      ];
    };

    configFile."nvim/" = {
      source = "${nvim-config}/nvim";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
