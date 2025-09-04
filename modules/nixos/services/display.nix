{ ... }:

{
  services.displayManager.sddm = {
    enable = false;
    
    wayland = {
      enable = true;
    };

    # theme = "sugar-dark";
    # theme = "Elegant";

    # extraPackages = [
      # pkgs.sddm-sugar-dark
      # (pkgs.elegant-sddm.override {
      #   themeConfig.General = {
      #      background = "${pkgs.gruvbox-wallpapers}/backgrounds/wallpapers/irl/gruvbox-forest.jpg";
      #   };
      # })
    # ];
  };
}
