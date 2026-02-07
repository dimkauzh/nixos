{ pkgs, lib, config, ... }:

let
  mod = "Super";
  alt = "Alt";
  corner-radius = 10;

  resizeSpeed = "8";
  resizeSpeedSlowed = "4";

  toFloat = x: x + 0.0;

  script = { path, args ? [] }:
  [ (lib.getExe pkgs.zsh)
    config.xdg.configFile."${path}".target
  ] ++ args;

  services = [
    "waybar"
    "dunst"
    "nm-applet"
    "polkit-gnome"
    "swaybg"
    "joystickwake"
    "caffeine"
    "batsignal"
    "xss-lock"
    "blueman-applet"
  ];
in 
{
  programs.niri = {
    enable = true;

    settings = {
      prefer-no-csd = true;
      clipboard.disable-primary = true;

      layout = {
        background-color = "transparent";
        empty-workspace-above-first = false;
      };

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
        {
          command =
            [ "${pkgs.systemd}/bin/systemctl" "--user" "restart" ]
            ++ map (s: "${s}.service") services;
        }
      ];

      layer-rules = [
        {
          matches = [ { namespace = "^wallpaper$"; } ];
          place-within-backdrop = true;
        }
      ];


      binds = with config.lib.niri.actions; {
        # System Audio Controls
        "XF86AudioRaiseVolume".action.spawn = script { path = "niri/volume_brightness.sh"; args = [ "volume_up" ]; };
        "XF86AudioLowerVolume".action.spawn = script { path = "niri/volume_brightness.sh"; args = [ "volume_down" ]; };
        "XF86AudioMute".action.spawn = script { path = "niri/volume_brightness.sh"; args = [ "volume_mute" ]; };

        # Media keys
        "XF86AudioPlay".action.spawn = [ "${lib.getExe pkgs.playerctl}" "play-pause" ];
        "XF86AudioPause".action.spawn = [ "${lib.getExe pkgs.playerctl}" "play-pause" ];
        "XF86AudioNext".action.spawn = [ "${lib.getExe pkgs.playerctl}" "position next" ];
        "XF86AudioPrev".action.spawn = [ "${lib.getExe pkgs.playerctl}" "position previous" ];
        "XF86AudioMedia".action.spawn = [ "${lib.getExe pkgs.lutris}" ];

        # System Brightness Controls
        "XF86MonBrightnessUp".action.spawn = script { path = "niri/volume_brightness.sh"; args = [ "brightness_up" ]; };
        "XF86MonBrightnessDown".action.spawn = script { path = "niri/volume_brightness.sh"; args = [ "brightness_down" ]; };

        # Window Managment
        "${mod}+q".action = close-window;
        "${mod}+f".action = toggle-window-floating;
        "${mod}+Shift+f".action = fullscreen-window;
        "${mod}+m".action = maximize-column;
        "${mod}+p".action.spawn = [ "${lib.getExe pkgs.wdisplays}" ];
        "${alt}+Backspace".action.set-column-width = "default";

        # Resize Horizontal
        "${alt}+Left".action.set-column-width = "-${resizeSpeed}%";
        "${alt}+Right".action.set-column-width = "+${resizeSpeed}%";
        "${alt}+Shift+Left".action.set-column-width = "-${resizeSpeedSlowed}%";
        "${alt}+Shift+Right".action.set-column-width = "+${resizeSpeedSlowed}%";

        # Resize Vertical
        "${alt}+Down".action.set-window-height = "+${resizeSpeed}%";
        "${alt}+Up".action.set-window-height = "-${resizeSpeed}%";
        "${alt}+Shift+Down".action.set-window-height = "+${resizeSpeedSlowed}%";
        "${alt}+Shift+Up".action.set-window-height = "-${resizeSpeedSlowed}%";

        # Moving through columns
        "${mod}+Left".action = focus-column-left;
        "${mod}+Right".action = focus-column-right;
        "${mod}+Shift+Left".action = move-column-left;
        "${mod}+Shift+Right".action = move-column-right; 

        # Moving through workspaces
        "${mod}+Down".action = focus-workspace-down;
        "${mod}+Up".action = focus-workspace-up;
        "${mod}+Shift+Down".action = move-workspace-down;
        "${mod}+Shift+Up".action = move-workspace-up; 

        # Focus on certain workspaces
        "${mod}+1".action.focus-workspace = 1;
        "${mod}+2".action.focus-workspace = 2;
        "${mod}+3".action.focus-workspace = 3;
        "${mod}+4".action.focus-workspace = 4;
        "${mod}+5".action.focus-workspace = 5;
        "${mod}+6".action.focus-workspace = 6;
        "${mod}+7".action.focus-workspace = 7;
        "${mod}+8".action.focus-workspace = 8;
        "${mod}+9".action.focus-workspace = 9;

        # Move windows to cetain workspaces
        "${mod}+Shift+1".action.move-window-to-workspace = [ { focus = false; } 1 ];
        "${mod}+Shift+2".action.move-window-to-workspace = [ { focus = false; } 2 ];
        "${mod}+Shift+3".action.move-window-to-workspace = [ { focus = false; } 3 ];
        "${mod}+Shift+4".action.move-window-to-workspace = [ { focus = false; } 4 ];
        "${mod}+Shift+5".action.move-window-to-workspace = [ { focus = false; } 5 ];
        "${mod}+Shift+6".action.move-window-to-workspace = [ { focus = false; } 6 ];
        "${mod}+Shift+7".action.move-window-to-workspace = [ { focus = false; } 7 ];
        "${mod}+Shift+8".action.move-window-to-workspace = [ { focus = false; } 8 ];
        "${mod}+Shift+9".action.move-window-to-workspace = [ { focus = false; } 9 ];

        # Move window and focus to certain workspaces
        "${alt}+1".action.move-window-to-workspace = [ { focus = true; } 1 ];
        "${alt}+2".action.move-window-to-workspace = [ { focus = true; } 2 ];
        "${alt}+3".action.move-window-to-workspace = [ { focus = true; } 3 ];
        "${alt}+4".action.move-window-to-workspace = [ { focus = true; } 4 ];
        "${alt}+5".action.move-window-to-workspace = [ { focus = true; } 5 ];
        "${alt}+6".action.move-window-to-workspace = [ { focus = true; } 6 ];
        "${alt}+7".action.move-window-to-workspace = [ { focus = true; } 7 ];
        "${alt}+8".action.move-window-to-workspace = [ { focus = true; } 8 ];
        "${alt}+9".action.move-window-to-workspace = [ { focus = true; } 9 ];

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
    xdg.configFile = {
    "niri/window_ss.sh" = {
      text = ''
      '';
      executable = true;
    };

    "niri/volume_brightness.sh" = {
      text = ''
        volume_step=5
        brightness_step=5
        max_volume=125
        notification_timeout=1000

        get_volume() {
            ${lib.getExe pkgs.pulsemixer} --get-volume | ${lib.getExe pkgs.gawk} '{print $1}'
        }

        get_mute() {
            ${lib.getExe pkgs.pulsemixer} --get-mute
        }

        get_brightness() {
            ${lib.getExe pkgs.light} -G | cut -d. -f1
        }

        get_volume_icon() {
            volume=$(get_volume)
            mute=$(get_mute)
            if [ "$volume" -eq 0 ] || [ "$mute" -eq 1 ]; then
                volume_icon=""  # Mute icon
            elif [ "$volume" -lt 50 ]; then
                volume_icon=""  # Low volume icon
            else
                volume_icon=""  # High volume icon
            fi
        }

        get_brightness_icon() {
            brightness_icon=""
        }

        show_volume_notif() {
            volume=$(get_volume)
            get_volume_icon
            ${lib.getExe pkgs.libnotify} \
                -t $notification_timeout \
                -h string:x-dunst-stack-tag:volume_notif \
                -h int:value:$volume \
                "$volume_icon    $volume%"
        }

        show_brightness_notif() {
            brightness=$(get_brightness)
            get_brightness_icon
            ${lib.getExe pkgs.libnotify} \
                -t $notification_timeout \
                -h string:x-dunst-stack-tag:brightness_notif \
                -h int:value:$brightness \
                "$brightness_icon    $brightness%"
        }

        case $1 in
            volume_up)
                ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ 0
                ${lib.getExe pkgs.pulsemixer} --change-volume +$volume_step --max-volume $max_volume
                show_volume_notif
                ;;

            volume_down)
                ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ 0
                ${lib.getExe pkgs.pulsemixer} --change-volume -$volume_step --max-volume $max_volume
                show_volume_notif
                ;;

            volume_mute)
                ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle
                show_volume_notif
                ;;

            brightness_up)
                ${lib.getExe pkgs.brightnessctl} set +$brightness_step%
                show_brightness_notif
                ;;

            brightness_down)
                ${lib.getExe pkgs.brightnessctl} set $brightness_step%-
                show_brightness_notif
                ;;

            *)
                ${lib.getExe pkgs.libnotify} "Error" "Invalid argument. Use 'volume_up', 'volume_down', 'volume_mute', 'brightness_up', or 'brightness_down'."
                ;;
        esac
      '';
      executable = true;
    };
  };
}

