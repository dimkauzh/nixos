{ lib, ... }:

{
  services.polybar.settings = {
    "module/battery".battery = lib.mkForce "BAT0";
    "module/backlight".card = lib.mkForce "intel_backlight";
    "module/temperature".hwmon-path = lib.mkForce "/sys/devices/platform/coretemp.0/hwmon/hwmon5/temp1_input";

  };
}
