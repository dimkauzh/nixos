{ ... }:

{
  environment.variables = {
    # Themes
    QT_QPA_PLATFORMTHEME = "darker";
    QT_STYLE_OVERRIDE = "Fusion";
    GTK_THEME = "Gruvbox-Dark";

    # Cursor
    XCURSOR_SIZE = 30;

    # Apps
    ZED_WINDOW_DECORATIONS = "server";
    DOOMWADDIR = "$HOME/games/doom";

    # NixOS
    XDG_RUNTIME_DIR = "/run/user/$UID";

    # XSecureLock
    XSECURELOCK_NO_COMPOSITE = 1;
    XSECURELOCK_SHOW_MESSAGE = 0;
    XSECURELOCK_COMPOSITE_OBSCURER = 0;
    XSECURELOCK_BACKGROUND_COLOR = "#282828";
    XSECURELOCK_AUTH_BACKGROUND_COLOR = "#282828";
    XSECURELOCK_AUTH_FOREGROUND_COLOR = "#ebdbb2";
  };
}
