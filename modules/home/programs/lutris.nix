{ pkgs, unstable, ... }:

{
  programs.lutris = {
    enable = true;

    steamPackage = pkgs.steam;
    protonPackages = [
      unstable.proton-ge-bin
      #pkgs.proton-cachyos
      #pkgs.proton-ge-custom
    ];
  };
}
