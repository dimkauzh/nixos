{ config, pkgs, ... }:

{
  home.username = "dima";
  home.homeDirectory = "/home/dima";
  home.stateVersion = "24.05"; # Please read the comment before changing. (dont change)
  home.sessionVariables = {
  };

  programs.home-manager.enable = true;

}
