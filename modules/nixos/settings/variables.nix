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
  };
}
