{ pkgs, ... }:

{
  services.displayManager.ly = {
    enable = true;
    x11Support = true;
    settings = {
      animation = "gameoflife";
      gameoflife_frame_delay = 8;
      gameoflife_fg = 3;

      auto_login_session = "Niri";
      clock = "%H:%M - %d/%m/%Y";

      brightness_up_cmd = "${pkgs.brightnessctl}/bin/brightnessctl set +5%";
      brightness_down_cmd = "${pkgs.brightnessctl}/bin/brightnessctl set -5%";
      hibernate_cmd = "systemctl hibernate";
    };
  };
}
