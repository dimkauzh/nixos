{ ... }:

{
  services = {
    upower.enable = true;

    logind.settings.Login = {
      HandlePowerKey = "ignore";
      HandleLidSwitch = "suspend-then-hibernate";
      HandleLidSwitchExternalPower = "suspend-then-hibernate";
      HandleLidSwitchDocked = "suspend-then-hibernate";
      IdleAction = "suspend-then-hibernate";
      IdleActionSec = "5min";
    };
  };

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=15m
  '';
}
