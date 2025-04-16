{ lib, ... }:

{
  services.polybar.settings = {
    "module/battery".battery = lib.mkForce "BAT0";
    "module/backlight".card = lib.mkForce "intel_backlight";
    "module/title".label-maxlen = lib.mkForce 45;
  };
}
