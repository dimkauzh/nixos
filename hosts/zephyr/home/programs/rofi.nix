{ config, pkgs, lib, ... }:

{
  programs.rofi = {
    enable = true;
    font = "Noto Sans 14";
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = "~/projects/nixos/hosts/zephyr/home/assets/rofi/gruvbox-dark-soft.rasi";

    extraConfig = {
      show-icons = true;
      icon-theme = "Gruvbox-Plus-Dark";
    };
  };
}
