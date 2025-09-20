{ config, pkgs, lib, ... }:

{
  systemd.user.services.xeventbind = {
    Unit = {
      Description = "Start xeventbind to check for resolution changes";
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.xeventbind} resolution ${config.xdg.configFile."i3/redraw.sh".target}";
      Restart = "on-failure";
    };
  };
}
