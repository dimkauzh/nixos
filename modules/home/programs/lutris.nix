{ pkgs, ... }:

{
  programs.lutris = {
    enable = true;

    steamPackage = pkgs.steam;
    protonPackage = [
      pkgs.proton-ge-bin
    ];
  };
}
