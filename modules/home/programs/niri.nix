{ pkgs, config, ... }:

{
  programs.niri = {
    enable = true;
    settings = {
      outputs."eDP-1" = {
        scale = 1.0;
      };

      binds = with config.lib.niri.actions; {
        "Mod+Shift+E".action = quit;
        "Super+Space".action.spawn = [ "${pkgs.rofi-wayland}/bin/rofi" "-show" "drun" "-show-icons" ];
        "Super+k".action.spawn = "${pkgs.kitty}/bin/kitty";
      };

      spawn-at-startup = [
        { command = [ "xwayland-satellite" ]; }
      ];

      environment = {
        QT_QPA_PLATFORM = "wayland";
        DISPLAY =":0";
      };

      input.touchpad = {
        click-method = "clickfinger";
        natural-scroll = false;
      };
    };
  };
}
