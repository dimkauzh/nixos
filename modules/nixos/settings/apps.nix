{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    protontricks.enable = true;
    extraCompatPackages = with pkgs; [
      proton-cachyos
      proton-ge-custom
    ];
  };
  
  programs.gamescope.enable = true;

  virtualisation.waydroid.enable = true;
}
