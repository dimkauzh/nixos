{ ... }: 

{
  environment.variables = {
    # Themes
    QT_QPA_PLATFORMTHEME = "darker";
    QT_STYLE_OVERRIDE = "Fusion";
    GTK_THEME = "Gruvbox-Dark";

    # Wayland
    DISPLAY = ":0";
    NIXOS_OZONE_WL = 0;
    QT_QPA_PLATFORM = "xcb";

    # Cursor
    XCURSOR_SIZE = 30;

    # Apps
    ZED_WINDOW_DECORATIONS = "server";
    DOOMWADDIR = "$HOME/games/doom";

    # NixOS
    XDG_RUNTIME_DIR = "/run/user/$UID";
    GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";

    # XSecureLock
    XSECURELOCK_NO_COMPOSITE = 1;
    XSECURELOCK_SHOW_MESSAGE = 0;
    XSECURELOCK_COMPOSITE_OBSCURER = 0;
    XSECURELOCK_BACKGROUND_COLOR = "#282828";
    XSECURELOCK_AUTH_BACKGROUND_COLOR = "#282828";
    XSECURELOCK_AUTH_FOREGROUND_COLOR = "#ebdbb2";
  };
}
