{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    font = "Noto Sans 14";
    terminal = "${pkgs.kitty}/bin/kitty";
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
}
