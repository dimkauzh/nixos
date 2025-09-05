{ pkgs, config, ... }:

let
  mod = "Super";
in 
{
  programs.niri = {
    enable = true;

    settings = {
      outputs."eDP-1" = {
        scale = 1.0;
      };

      # with config.lib.niri.actions; 
      binds = {
        # Rofi-based shortcuts
        "${mod}+Escape".action.spawn = [ "${pkgs.rofi-wayland}/bin/rofi" "-show" "p" "-modi" "p:${pkgs.rofi-power-menu}/bin/rofi-power-menu" "-font" "JetBrains Mono NF 20" ];
        "${mod}+Space".action.spawn = [ "${pkgs.rofi-wayland}/bin/rofi" "-show" "drun" "-show-icons" ];
        "${mod}+x".action.spawn = [ "${pkgs.rofi-wayland}/bin/rofi" "-show" "cliphist" "-modi" "cliphist:${pkgs.cliphist}/bin/cliphist-rofi" ];

        # Screenshotting
        "Print".action.spawn = [ "${pkgs.flameshot}/bin/flameshot" "gui" "-c" "-p" "${config.home.homeDirectory}/Pictures/Screenshots" ];
        "${mod}+Shift+Print".action.spawn = [ "${pkgs.flameshot}/bin/flameshot" "full" "-c" "-p" "${config.home.homeDirectory}/Pictures/Screenshots" ];
      };

      input.touchpad = {
        click-method = "clickfinger";
        natural-scroll = false;
        scroll-factor = 0.8;
      };
    };
  };
}

