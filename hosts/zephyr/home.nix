{ config, pkgs, ... }:


{
  imports =
    [
      ./home/options.nix
      ./home/setup.nix
      ./home/services.nix

      ./home/gtk.nix

      ./home/programs/zsh.nix
      ./home/programs/starship.nix
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
