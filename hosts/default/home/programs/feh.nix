{ pkgs, ... }:

let
  wallpapers = import ../../nixos/packages/wallpapers.nix { inherit pkgs; };
in
{
  systemd.user.services.feh = {
    Unit.Description = "Set wallpaper using feh";
    Install.WantedBy = [ "default.target" ];
    Service = {
      ExecStart = "${pkgs.feh}/bin/feh --bg-scale ${wallpapers}/backgrounds/wallpapers/irl/forest-4.jpg";
      Restart = "on-failure";
    };
  };
}
