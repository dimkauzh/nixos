{ pkgs, ... }:

let
  nvim-config = import ../../nixos/packages/neovim.nix { inherit pkgs; };
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
      source = ../assets/nvim;
    };

    desktopEntries = {
      zen = {
        name = "Zen Browser";
        exec = "zen %u";
        icon = "zen";
        genericName = "Web Browser";
        terminal = false;
        categories = [ "Application" "Network" "WebBrowser" ];
        mimeType = [
          "text/html"
          "text/xml"
          "application/xhtml+xml"
          "x-scheme-handler/http"
          "x-scheme-handler/https"
          "application/x-xpinstall"
          "application/pdf"
          "application/json"
        ];
      };
    };
  };
}
