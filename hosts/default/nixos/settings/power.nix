{ ... }:

{
  services.logind = {
    powerKey = "ignore";
    lidSwitch = "suspend-then-hibernate";
    lidSwitchExternalPower = "suspend-then-hibernate";
    lidSwitchDocked = "suspend-then-hibernate";
  };

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=15m
  '';

  services.upower.enable = true;
}
