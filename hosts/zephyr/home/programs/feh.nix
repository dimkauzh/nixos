{ pkgs, ... }:

let
  wallpapers = import ../../packages/wallpapers.nix { inherit pkgs; };
in
{
  home.services.feh = {
    enable = true;
    description = "Set wallpaper using feh";
    wantedBy = [ "default.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.feh}/bin/feh --bg-scale ${wallpapers}/backgrounds/forest-2.jpg";
      Restart = "on-failure";
    };
  };
}
