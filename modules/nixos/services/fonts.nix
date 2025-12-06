{ pkgs, ... }:


{
  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "Noto Mono" ];
      };
    };
  };

  fonts.packages = with pkgs; [
    # For polybar
    jetbrains-mono
    material-icons

    # System Fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    # Coding Fonts
    nerd-fonts.comic-shanns-mono
  ];
}
