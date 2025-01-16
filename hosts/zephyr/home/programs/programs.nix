{ lib, config, pkgs, inputs, ... }:

{
  imports = [
    ./rofi.nix
    ./zsh.nix
    ./starship.nix
    ./greenclip.nix
    ./kitty.nix
    ./polybar.nix
  ];
}
