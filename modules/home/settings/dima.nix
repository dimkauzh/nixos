{ pkgs, ... }:

{
  home = {
    username = "dima";
    homeDirectory = "/home/dima";
  };

  home.file.".face".source = ../assets/icons/dima.png;
  home.file."Pictures/wallpapers" = {
    source = "${pkgs.gruvbox-wallpapers}/backgrounds/wallpapers";
    recursive = true;
  };
}
