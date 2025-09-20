{ pkgs, lib, ... }:

{
  systemd.user.services.joystickwake = {
    Unit = {
      Description = "Start joystickwake";
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.joystickwake}";
      Restart = "on-failure";
    };
  };
}
