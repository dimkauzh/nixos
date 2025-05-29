{ pkgs, ... }:

{
  xdg = {
    configFile."mimeapps.list".force = true;

    mimeApps = {
      enable = true;
      defaultApplications = {
        # Archives
        "application/zip" = [ "xarchiver.desktop" ];
        "application/x-tar" = [ "xarchiver.desktop" ];
        "application/x-7z-compressed" = [ "xarchiver.desktop" ];
        "application/x-rar" = [ "xarchiver.desktop" ];
        "application/gzip" = [ "xarchiver.desktop" ];
        "application/x-bzip" = [ "xarchiver.desktop" ];
        "application/x-xz" = [ "xarchiver.desktop" ];

        # Folders
        "inode/directory" = [ "nemo.desktop" ];

        # Video files with VLC
        "video/mp4" = [ "vlc.desktop" ];
        "video/x-matroska" = [ "vlc.desktop" ];
        "video/x-msvideo" = [ "vlc.desktop" ];
        "video/quicktime" = [ "vlc.desktop" ];
        "video/webm" = [ "vlc.desktop" ];
        "video/x-flv" = [ "vlc.desktop" ];
        "video/mpeg" = [ "vlc.desktop" ];

        # Audio files with Audacity
        "audio/mpeg" = [ "audacity.desktop" ];
        "audio/ogg" = [ "audacity.desktop" ];
        "audio/wav" = [ "audacity.desktop" ];
        "audio/x-wav" = [ "audacity.desktop" ];
        "audio/flac" = [ "audacity.desktop" ];
        "audio/x-aiff" = [ "audacity.desktop" ];
        "audio/mp4" = [ "audacity.desktop" ];
        "audio/x-ms-wma" = [ "audacity.desktop" ];
      };
    };

    desktopEntries = {
      zen-beta = {
        name = "Zen Browser (Beta)";
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
