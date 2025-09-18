{ pkgs, ... }:

{
  programs.swaylock = {
    enable = false;
    package = pkgs.swaylock-effects;
  };
}
