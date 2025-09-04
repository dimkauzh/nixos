{ pkgs, ... }:

{
  services.xidlehook = {
    enable = true;

    detect-sleep = true;
    not-when-audio = true;

    timers = [
      {
        delay = 300;
        command = "${pkgs.systemd}/bin/systemctl suspend-then-hibernate";
      }
    ];
  };
}
