{ ... }:

{
  services.xserver.xautolock = {
    enable = true;
    time = 5;
    locker = "systemctl suspend-then-hibernate";
  };

  services.screen-locker.xautolock = {
    enable = true;
    detectSleep = true;
  };
}
