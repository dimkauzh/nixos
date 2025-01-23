{ config, pkgs, ... }:


{
  imports =
    [
      ./home/modules.nix
    ];

  home = {
    username = "dima";
    homeDirectory = "/home/dima";
    stateVersion = "24.11"; # (dont change)
    sessionVariables = {
      EDITOR = "zeditor";
      BROWSER = "zen-browser";
    };
  };

  programs.home-manager.enable = false;
}
