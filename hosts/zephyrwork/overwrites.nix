{ lib, pkgs, ... }:

{
  xsession.windowManager.i3.config.keybindings = {
    "Mod4+z" = lib.mkForce "exec xrandr --output eDP --primary --mode 2256x1504 --pos 0x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DisplayPort-6 --off --output DisplayPort-7 --off";
    "XF86AudioMedia" = lib.mkForce "exec kitty -e btop";
    "XF86AudioNext" = lib.mkForce "exec playerctl next";
    "XF86AudioPrev" = lib.mkForce "exec playerctl previous";
  };

  services.polybar.settings = {
    "module/battery".battery = lib.mkForce "BAT1";
    "module/backlight".card = lib.mkForce "amdgpu_bl1";
    "module/cpu-temp".exec = lib.mkForce "${pkgs.lm_sensors}/bin/sensors | ${pkgs.gawk}/bin/awk '/^cpu@4c:/ {temp = $2 + 0.5; print int(temp)\"°\"}'";
  };
}
