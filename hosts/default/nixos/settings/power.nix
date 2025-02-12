{ ... }:

{
  services.logind.extraConfig = ''
     HandlePowerKey=ignore
  '';

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=15m
  '';

  services.upower.enable = true;
}
