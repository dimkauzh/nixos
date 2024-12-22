{ config, pkgs, ... }:

{
  home.username = "dima";
  home.homeDirectory = "/home/dima";
  home.stateVersion = "24.05"; # Please read the comment before changing. (dont change)
  home.sessionVariables = {
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.home-manager.enable = true;

}
