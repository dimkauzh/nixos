{ lib, pkgs, ... }:

{
  xsession.windowManager.i3.config.keybindings."Mod4+z" = lib.mkForce "exec xrandr --output eDP-1 --primary --mode 2256x1504 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off --output DP-6 --off --output DP-7 --off --output DP-8 --off";

  services.polybar.settings."module/battery".battery = lib.mkForce "BAT0";
  services.polybar.settings."module/backlight".card = lib.mkForce "amdgpu_bl1";
  services.polybar.settings."module/cpu-temp".exec = lib.mkForce "${pkgs.lm_sensors}/bin/sensors | ${pkgs.gawk}/bin/awk '/^cpu_f75303@4d:/ {temp = $2 + 0.5; print int(temp)\"°\"}'";


}
