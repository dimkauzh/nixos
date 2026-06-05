{ lib, pkgs, ... }:

let
  lockCmd = pkgs.writeShellScript "lock" ''
    ${pkgs.procps}/bin/pgrep -x gtklock || ${lib.getExe pkgs.gtklock} -d
  '';
in
{
  services.swayidle = {
    enable = true;
    
    events = {
      before-sleep = "${lockCmd}";
      lock = "${lockCmd}";
    };

    timeouts = [
      { 
        timeout = 300; 
        command = "${pkgs.systemd}/bin/systemctl suspend-then-hibernate"; 
      }
    ];
  };
}
