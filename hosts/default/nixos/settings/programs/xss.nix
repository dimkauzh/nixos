{ pkgs, ... }:

{
  programs.xss-lock = {
    enable = false;
    lockerCommand = "${pkgs.lightdm}/bin/dm-tool switch-to-greeter";
    extraOptions = [
      "--transfer-sleep-lock"
    ];
  };

    
  systemd.services.lock-screen = {
    description = "Lock the screen on resume from sleep/hibernation";
    after = [ "systemd-user-sessions.service" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.lightdm}/bin/dm-tool switch-to-greeter";
      Environment = "XDG_SEAT_PATH=/org/freedesktop/DisplayManager/Seat0";
    };

    wantedBy = [
      "systemd-suspend.service"
      "systemd-hibernate.service"
      "systemd-suspend-then-hibernate.service"
    ];
  };
}
