{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    font = "ComicShannsMono Nerd Font";
  };
}
