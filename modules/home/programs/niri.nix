{ pkgs, config, ... }:

let
  mod = "Super";
  corner-radius = 10;

  toFloat = x: x + 0.0;
in 
{
  programs.niri = {
    enable = false;

    settings = {
      prefer-no-csd = true;
      layout.background-color = "transparent";

      outputs."eDP-1" = {
        scale = 1.0;
      };

      overview.workspace-shadow = {
        softness = 20;
        offset = {
          x = 10;
          y = 30;
        };
      };

      window-rules = [
        {
          open-focused = true;
          open-maximized = true;

          clip-to-geometry = true;
          draw-border-with-background = true;
          geometry-corner-radius = {
            bottom-left = toFloat corner-radius;
            bottom-right = toFloat corner-radius;
            top-left = toFloat corner-radius;
            top-right = toFloat corner-radius;
          };

          focus-ring = {
            enable = true;

            active = { color = "#83a598"; };
            inactive = { color = "#282828"; };
            urgent = { color = "#dfbf8e"; };
          };
        }
      ];
      
      spawn-at-startup = [
        { command = [ "${pkgs.swaybg}/bin/swaybg" "--image" "${pkgs.gruvbox-wallpapers}/backgrounds/wallpapers/irl/forest-4.jpg" ]; }
      ];

      layer-rules = [
        {
          matches = [ { namespace = "^wallpaper$"; } ];
          place-within-backdrop = true;
        }
      ];


      binds = with config.lib.niri.actions; {
        # Main shortcuts
        "${mod}+q".action = close-window;

        # Moving through windows
        "${mod}+Left".action = focus-column-left;
        "${mod}+Right".action = focus-column-right;

        # Moving through workspaces
        "${mod}+Down".action = focus-workspace-down;
        "${mod}+Up".action = focus-workspace-up;

        # Rofi-based shortcuts
        "${mod}+Escape".action.spawn = [ "${pkgs.rofi}/bin/rofi" "-show" "p" "-modi" "p:${pkgs.rofi-power-menu}/bin/rofi-power-menu" "-font" "JetBrains Mono NF 20" ];
        "${mod}+Space".action.spawn = [ "${pkgs.rofi}/bin/rofi" "-show" "drun" "-show-icons" ];
        "${mod}+x".action.spawn = [ "${pkgs.rofi}/bin/rofi" "-show" "cliphist" "-modi" "cliphist:${pkgs.cliphist}/bin/cliphist-rofi" ];

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

