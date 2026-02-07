{ pkgs, lib, ... }:

{
  systemd.user.services.swaybg = {
    Unit = {
      Description = "Set wallpaper using swaybg";
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.swaybg} --image ${pkgs.gruvbox-wallpapers}/backgrounds/wallpapers/irl/forest-4.jpg";
      Restart = "on-failure";
    };
  };
}
