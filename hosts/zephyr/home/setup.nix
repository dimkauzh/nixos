{ config, pkgs, ... }:

{
  home.activation.symlinkZen = pkgs.lib.mkAfter ''
      ln -sf ~/projects/nixos/hosts/zephyr/packages/assets/zen.desktop ~/.local/share/applications/zen.desktop
      ln -sf /home/dima/projects/nixos/hosts/zephyr/configs/dunst ~/.config/dunst
      ln -sf /home/dima/projects/nixos/hosts/zephyr/configs/i3 ~/.config/i3
      ln -sf /home/dima/projects/nixos/hosts/zephyr/configs/polybar ~/.config/polybar
      ln -sf /home/dima/projects/nixos/hosts/zephyr/configs/nvim ~/.config/nvim
      ln -sf /home/dima/projects/nixos/hosts/zephyr/configs/kitty ~/.config/kitty
      ln -sf /home/dima/projects/nixos/hosts/zephyr/configs/greenclip/greenclip.toml ~/.config/greenclip.toml
  '';
}
