{ pkgs, ... }:

let
  mantablockscreen = import ../../packages/mantablockscreen.nix { inherit pkgs; };
in
{
  programs.xss-lock = {
    enable = true;
    lockerCommand = "${pkgs.lightdm}/bin/dm-tool switch-to-greeter";
  };
}
