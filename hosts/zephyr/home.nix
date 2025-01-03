{ config, pkgs, ... }:


{
  home = {
    username = "dima";
    homeDirectory = "/home/dima";
    stateVersion = "24.05"; # (dont change)
    sessionVariables = {
      EDITOR = "zeditor";
      BROWSER = "zen-browser";

      QT_QPA_PLATFORMTHEME="darker";
      QT_STYLE_OVERRIDE="Fusion";
      GTK_THEME="Gruvbox-Dark";
    };
  };



  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.home-manager.enable = false;
}
