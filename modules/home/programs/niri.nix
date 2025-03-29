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
        "Super+k".action.spawn = "kitty";
      };
    };
  };
}
