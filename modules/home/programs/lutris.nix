{ pkgs, unstable, ... }:

{
  programs.lutris = {
    enable = true;

    steamPackage = pkgs.steam;
    protonPackages = [ unstable.proton-ge-bin ];
  };
}
