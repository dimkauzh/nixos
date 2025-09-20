{ pkgs, config, lib, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    font = "Noto Sans 14";
    terminal = "${lib.getExe pkgs.kitty}";
    theme = ../assets/rofi/gruvbox-material.rasi;

    extraConfig = {
      show-icons = false;
      icon-theme = "Gruvbox-Plus-Dark";

      display-ssh = "";
      display-run = "";
      display-drun = "";
      display-window = "";
      display-combi = "";
    };
  };

  home.sessionVariables = lib.recursiveUpdate {} {
    XDG_DATA_DIRS = "$XDG_DATA_DIRS:${config.home.homeDirectory}/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share";
  };
}
