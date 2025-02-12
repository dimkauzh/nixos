{ pkgs, ... }:

let
  mantablockscreen = import ../../packages/mantablockscreen.nix { inherit pkgs; };
in
{
  programs.xss-lock = {
    enable = true;
    lockerCommand = "${mantablockscreen}/bin/mantablockscreen -sc";
  };
}
