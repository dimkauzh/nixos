{ pkgs, ... }:

{
  home.activation.symlinkZen = pkgs.lib.mkAfter ''
      ln -sf /home/dima/projects/nixos/hosts/zephyr/configs/dunst ~/.config/dunst
      ln -sf /home/dima/projects/nixos/hosts/zephyr/configs/i3 ~/.config/i3
  '';
}
