{ ... }:

{
  environment.variables = rec {
    QT_QPA_PLATFORMTHEME="darker";
    QT_STYLE_OVERRIDE="Fusion";
    GTK_THEME="Gruvbox-Dark";
    ZED_WINDOW_DECORATIONS="server";
  };
}
