{ pkgs, ... }:

{
  programs.xss-lock = {
    enable = true;
    lockerCommand = "${pkgs.lightdm}/bin/dm-tool switch-to-greeter";
    extraOptions = [
      "--transfer-sleep-lock"
    ];
  };

  # systemd.services.lock-screen = {
  #   description = "Lock the screen on resume from sleep/hibernation";
  #   after = [
  #     "systemd-user-sessions.service"
  #     "systemd-logind.service"
  #     "graphical.target"
  #   ];
  #   wants = [ "graphical.target" ];
  #
  #   serviceConfig = {
  #     Type = "oneshot";
  #     ExecStart = "${pkgs.lightdm}/bin/dm-tool switch-to-greeter";
  #     Environment = "XDG_SEAT_PATH=/org/freedesktop/DisplayManager/Seat0";
  #   };
  #
  #   wantedBy = [
  #     "sleep.target"
  #     "suspend.target"
  #     "hibernate.target"
  #     "suspend-then-hibernate.target"
  #   ];
  # };
}
