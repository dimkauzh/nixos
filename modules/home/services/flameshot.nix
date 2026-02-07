{ ... }:

{
  services.flameshot = {
    enable = true;

    settings = {
      General = {
        useGrimAdapter = true;
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
      };
    };
  };
}
