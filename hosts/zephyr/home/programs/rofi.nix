{ config, pkgs, lib, ... }:

{
  programs.rofi = {
    enable = true;
    font = "Noto Sans 14";
    theme = "~/projects/nixos/hosts/zephyr/home/assets/rofi/gruvbox-dark-soft.rasi";
    terminal = "\${pkgs.kitty}/bin/kitty";

    extraConfig = {
      show-icons = true;
      icon-theme = "Gruvbox-Plus-Dark";
    };
  };
}
