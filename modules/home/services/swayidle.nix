{ lib, pkgs, ... }:

{
  services.swayidle = {
    enable = true;

    events = [
      { event = "before-sleep"; command = "${lib.getExe pkgs.gtklock}"; }
      { event = "lock"; command = "${lib.getExe pkgs.gtklock}"; }
    ];
    timeouts = [
      { timeout = 300; command = "${pkgs.systemd}/bin/systemctl suspend-then-hibernate"; }
    ];
  };
}
