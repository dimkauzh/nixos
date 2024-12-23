{ config, pkgs, ... }:

{
  home = {
    username = "dima";
    homeDirectory = "/home/dima";
    stateVersion = "24.05"; # Please read the comment before changing. (dont change)
    sessionVariables = {
      EDITOR = "zeditor";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.home-manager.enable = true;
}
