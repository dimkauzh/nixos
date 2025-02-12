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
    # System Fonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans

    # Coding Fonts
    nerd-fonts.comic-shanns-mono
  ];
}
