{ mesa-pkg, ... }:

{
  environment.variables = {
    # Themes
    QT_QPA_PLATFORMTHEME = "darker";
    QT_STYLE_OVERRIDE = "Fusion";
    GTK_THEME = "Gruvbox-Dark";

    # Apps
    ZED_WINDOW_DECORATIONS = "server";
    DOOMWADDIR = "$HOME/games/doom";

    # NixOS
    XDG_RUNTIME_DIR = "/run/user/$UID";

    LIBGL_DRIVERS_PATH = "${mesa-pkg.mesa.drivers}/lib/dri";
    LIBGL_DRIVERS_PATH_32 = "${mesa-pkg.pkgsi686Linux.mesa.drivers}/lib/dri";
  };
}
