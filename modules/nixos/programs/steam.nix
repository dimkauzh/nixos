{ pkgs, ... }:

{
  programs = {
    gamescope.enable = true;
    steam = {
      enable = true;
      protontricks.enable = true;
      extraCompatPackages = with pkgs; [
        proton-cachyos
        proton-ge-custom
      ];
    };
  };
}
