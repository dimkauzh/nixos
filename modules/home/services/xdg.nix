{ ... }:

{
  xdg = {
    configFile."mimeapps.list".force = true;

    mimeApps = {
      enable = true;
      defaultApplications = {
        # Archives with XArchiver
        "application/zip" = [ "xarchiver.desktop" ];
        "application/x-tar" = [ "xarchiver.desktop" ];
        "application/x-7z-compressed" = [ "xarchiver.desktop" ];
        "application/x-rar" = [ "xarchiver.desktop" ];
        "application/gzip" = [ "xarchiver.desktop" ];
        "application/x-bzip" = [ "xarchiver.desktop" ];
        "application/x-xz" = [ "xarchiver.desktop" ];

        # Folders with Nemo
        "inode/directory" = [ "nemo.desktop" ];

        # Video files with mpv
        "video/mp4" = [ "mpv.desktop" ];
        "video/x-matroska" = [ "mpv.desktop" ];
        "video/x-msvideo" = [ "mpv.desktop" ];
        "video/quicktime" = [ "mpv.desktop" ];
        "video/webm" = [ "mpv.desktop" ];
        "video/x-flv" = [ "mpv.desktop" ];
        "video/mpeg" = [ "mpv.desktop" ];

        # Audio files with Audacity
        "audio/mpeg" = [ "audacity.desktop" ];
        "audio/ogg" = [ "audacity.desktop" ];
        "audio/wav" = [ "audacity.desktop" ];
        "audio/x-wav" = [ "audacity.desktop" ];
        "audio/flac" = [ "audacity.desktop" ];
        "audio/x-aiff" = [ "audacity.desktop" ];
        "audio/mp4" = [ "audacity.desktop" ];
        "audio/x-ms-wma" = [ "audacity.desktop" ];

        # Images with Loupe
        "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
        "image/png" = [ "org.gnome.Loupe.desktop" ];
        "image/gif" = [ "org.gnome.Loupe.desktop" ];
        "image/webp" = [ "org.gnome.Loupe.desktop" ];
        "image/bmp" = [ "org.gnome.Loupe.desktop" ];
        "image/tiff" = [ "org.gnome.Loupe.desktop" ];
        "image/svg+xml" = [ "org.gnome.Loupe.desktop" ];

        # Web & PDFs with Floorp
        "text/html" = [ "floorp.desktop" ];
        "application/pdf" = [ "floorp.desktop" ];
        "application/x-extension-pdf" = [ "floorp.desktop" ];
        "x-scheme-handler/http" = [ "floorp.desktop" ];
        "x-scheme-handler/https" = [ "floorp.desktop" ];
        "x-scheme-handler/about" = [ "floorp.desktop" ];
        "x-scheme-handler/unknown" = [ "floorp.desktop" ];
      };
    };

    desktopEntries = {
      # zen-beta = {
      #   name = "Zen Browser (Beta)";
      #   exec = "zen %u";
      #   icon = "zen-browser";
      #   genericName = "Web Browser";
      #   terminal = false;
      #   categories = [ "Application" "Network" "WebBrowser" ];
      #   mimeType = [
      #     "text/html"
      #     "text/xml"
      #     "application/xhtml+xml"
      #     "x-scheme-handler/http"
      #     "x-scheme-handler/https"
      #     "application/x-xpinstall"
      #     "application/pdf"
      #     "application/json"
      #   ];
      # };
    };
  };
}
