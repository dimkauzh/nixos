{ pkgs, ... }:

{
  services.swayidle = {
    enable = false;

    events = [
      { event = "before-sleep"; command = "${pkgs.lightdm}/bin/dm-tool switch-to-greeter"; }
      { event = "lock"; command = "${pkgs.lightdm}/bin/dm-tool switch-to-greeter"; }
    ];
    timeouts = [
      { timeout = 300; command = "${pkgs.systemd}/bin/systemctl suspend-then-hibernate"; }
    ];
  };
}
