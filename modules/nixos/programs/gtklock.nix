{ pkgs, ... }:

{
  programs.gtklock = {
    enable = true;

    config = {
      main = {
        gtk-theme = "Gruvbox-Dark";
        background = "${pkgs.gruvbox-wallpapers}/backgrounds/wallpapers/irl/forest-3-blur-dark.jpg";
      };
    };

    modules = with pkgs; [
      gtklock-playerctl-module
      gtklock-powerbar-module
      gtklock-userinfo-module
    ];
  };
}
