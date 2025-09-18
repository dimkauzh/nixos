{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = false;
    wayland.enable = true;
    theme = "${pkgs.elegant-sddm}/share/sddm/themes/Elegant";

    extraPackages = [
      pkgs.elegant-sddm
    ];
  };
}
