{ config, pkgs, ... }:


{
  xdg.mimeApps = {
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

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
