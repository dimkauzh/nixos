{ config, pkgs, ... }:


{
  imports =
    [
      ../default/home/dima.nix
      ../default/home/modules.nix

      ./overwrites.nix
    ];

  home.sessionVariables = {
    EDITOR = "zeditor";
    BROWSER = "zen-browser";
  };

  home.stateVersion = "24.11"; # (dont change)

  programs.home-manager.enable = false;
}
