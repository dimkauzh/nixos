{ pkgs, config, ... }:

{
  programs.niri = {
    settings = {
      outputs."eDP-1" = {
        scale = 1.0;
      };

      binds = with config.lib.niri.actions; {
        "Super+E".action.spawn = [
          "${pkgs.rofi-wayland}/bin/rofi"
          "-show" "p"
          "-modi" "p:${pkgs.rofi-power-menu}/bin/rofi-power-menu"
          "-font" "JetBrains Mono NF 20"
        ];
        "Super+Space".action.spawn = [ "${pkgs.rofi-wayland}/bin/rofi" "-show" "drun" "-show-icons" ];
        "Super+k".action.spawn = "${pkgs.kitty}/bin/kitty";

        # Screenshotting
        "Print".action.spawn = [ "${pkgs.flameshot}/bin/flameshot" "gui" "-c" "-p" "~/Pictures/Screenshots" ];
        "Super+Shift+Print".action.spawn = [ "${pkgs.flameshot}/bin/flameshot" "full" "-c" "-p" "~/Pictures/Screenshots" ];
      };

      input.touchpad = {
        click-method = "clickfinger";
        natural-scroll = false;
      };
    };
  };
}

