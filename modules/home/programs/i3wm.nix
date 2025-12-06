{ pkgs, lib, config, ... }:

let
  execScript = { path, args ? "" }: ''
    exec ${lib.getExe pkgs.zsh} ${config.xdg.configFile."${path}".target} ${args}
  '';

  mod = "Mod4";
  alt = "Mod1";

  resizeSpeed = "8";
  resizeSpeedSlowed = "4";
  moveSpeed = "10";
  moveSpeedSlowed = "5";

  services = [
    "dunst"
    "nm-applet"
    "polkit-gnome"
    "feh"
    "picom"
    "polybar"
    "sunshine"
    "joystickwake"
    "xeventbind"
    "xidlehook"
    "caffeine"
    "batsignal"
    "xss-lock"
    "blueman-applet"
    "xsettingsd"
  ];
in
{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      bars = [];

      fonts = {
        names = [ "Noto Sans" ];
        style = "Regular";
        size = 10.0;
      };

      keybindings = {
        # System Audio Controls
        "XF86AudioRaiseVolume" = execScript { path = "i3/volume_brightness.sh"; args = "volume_up"; };
        "XF86AudioLowerVolume" = execScript { path = "i3/volume_brightness.sh"; args = "volume_down"; };
        "XF86AudioMute" = execScript { path = "i3/volume_brightness.sh"; args = "volume_mute"; };

        # Media keys
        "XF86AudioPlay" = "exec ${lib.getExe pkgs.playerctl} play-pause";
        "XF86AudioPause" = "exec ${lib.getExe pkgs.playerctl} play-pause";
        "XF86AudioNext" = "exec ${lib.getExe pkgs.playerctl} position 10+";
        "XF86AudioPrev" = "exec ${lib.getExe pkgs.playerctl} position 10-";

        # System Brightness Controls
        "XF86MonBrightnessUp" = execScript { path = "i3/volume_brightness.sh"; args = "brightness_up"; };
        "XF86MonBrightnessDown" = execScript { path = "i3/volume_brightness.sh"; args = "brightness_down"; };

        # Binding other top keys
        "${mod}+p" = "exec ${lib.getExe pkgs.arandr}";
        "F9" = "exec ${lib.getExe pkgs.kitty}";

        # Kill focused window
        "${mod}+q" = "kill";

        # Change focus
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        # Move focused window
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        # Split in different orientation
        "${mod}+h" = "split h";
        "${mod}+v" = "split v";

        # Toggle fullschreen mode
        "${mod}+Shift+f" = "fullscreen toggle";

        # Change container layout (stacked, tabbed, toggle split)
        "${mod}+s" = "layout stacking";
        "${mod}+t" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        # Toggle floating mode
        "${mod}+f" = "floating toggle, resize set 1000 600, move position center,";

        # Switch to workspace
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";

        # Move focused container to workspace
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";

        # Move focused container to workspace and move to it too
        "${alt}+1" = "move container to workspace number 1, workspace number 1";
        "${alt}+2" = "move container to workspace number 2, workspace number 2";
        "${alt}+3" = "move container to workspace number 3, workspace number 3";
        "${alt}+4" = "move container to workspace number 4, workspace number 4";
        "${alt}+5" = "move container to workspace number 5, workspace number 5";
        "${alt}+6" = "move container to workspace number 6, workspace number 6";
        "${alt}+7" = "move container to workspace number 7, workspace number 7";
        "${alt}+8" = "move container to workspace number 8, workspace number 8";
        "${alt}+9" = "move container to workspace number 9, workspace number 9";

        # Move to different workspaces
        "${mod}+period" = "workspace next_on_output";
        "${mod}+comma" = "workspace prev_on_output";

        # Move focused container to different workspaces
        "${mod}+Shift+period" = "move container to workspace next";
        "${mod}+Shift+comma" = "move container to workspace prev";

        # Moving focus between windows, ment for tabbed mode
        "${alt}+Tab" = "focus right";
        "${alt}+Shift+Tab" = "focus left";

        # Screenshotting
        "Print" = "exec ${lib.getExe pkgs.flameshot} gui -c -p ${config.home.homeDirectory}/Pictures/Screenshots";
        "${mod}+Print" = execScript { path = "i3/window_ss.sh"; };
        "${mod}+Shift+Print" = "exec ${lib.getExe pkgs.flameshot} full -c -p ${config.home.homeDirectory}/Pictures/Screenshots";

        # Rofi
        "${mod}+space" = "exec ${lib.getExe config.programs.rofi.package} -show drun -show-icons";
        "${mod}+x" = "exec ${lib.getExe config.programs.rofi.package} -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'";

        # Reset monitor settings
        "${mod}+z" = "exec ${lib.getExe pkgs.xorg.xrandr} --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output DP-2 --off";

        "${mod}+Shift+x" = "exec ${lib.getExe pkgs.xorg.xrandr} --output eDP --primary --mode 2256x1504 --pos 0x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --mode 1920x1080 --pos 2256x212 --rotate normal --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DisplayPort-6 --off --output DisplayPort-7 --off";
        # Display redraw
        "${mod}+Shift+z" = execScript { path = "i3/redraw.sh"; };

        # Toggle polybar
        "${alt}+p" = "exec ${pkgs.polybar}/bin/polybar-msg cmd toggle";

        # Restart picom
        "${mod}+Shift+p" = "exec ${pkgs.systemd}/bin/systemctl --user restart picom";

        # Reload the configuration file
        "${mod}+Shift+r" = "reload";

        # Modes
        "${mod}+Escape" = "mode system";
        "${mod}+r" = "mode resize";
        "${mod}+m" = "mode move";
      };

      colors = {
        focused = {
          border = "#83a598";
          background = "#83a598";
          text = "#32302f";
          indicator = "#83a598";
          childBorder = "#83a598";
        };

        unfocused = {
          border = "#282828";
          background = "#282828";
          text = "#dfbf8e";
          indicator = "#282828";
          childBorder = "#282828";
        };

        focusedInactive = {
          border = "#282828";
          background = "#282828";
          text = "#dfbf8e";
          indicator = "#282828";
          childBorder = "#282828";
        };
      };

      modes = {
        system = {
          e = "exec ${pkgs.i3}/bin/i3-msg exit";
          l = "exec ${lib.getExe pkgs.mantablockscreen} -sc, mode default";
          p = "exec ${pkgs.systemd}/bin/systemctl suspend, mode default";
          h = "exec ${pkgs.systemd}/bin/systemctl hibernate, mode default";
          r = "exec ${pkgs.systemd}/bin/systemctl reboot, mode default";
          s = "exec ${pkgs.systemd}/bin/systemctl poweroff, mode default";

          Escape = "mode default";
          Return = "mode default";
          "${mod}+Escape" = "mode default";
        };

        resize = {
          Left = "resize shrink width ${resizeSpeed} px or ${resizeSpeed} ppt";
          Down = "resize grow height ${resizeSpeed} px or ${resizeSpeed} ppt";
          Up = "resize shrink height ${resizeSpeed} px or ${resizeSpeed} ppt";
          Right = "resize grow width ${resizeSpeed} px or ${resizeSpeed} ppt";

          "Shift+Left" = "resize shrink width ${resizeSpeedSlowed} px or ${resizeSpeedSlowed} ppt";
          "Shift+Down" = "resize grow height ${resizeSpeedSlowed} px or ${resizeSpeedSlowed} ppt";
          "Shift+Up" = "resize shrink height ${resizeSpeedSlowed} px or ${resizeSpeedSlowed} ppt";
          "Shift+Right" = "resize grow width ${resizeSpeedSlowed} px or ${resizeSpeedSlowed} ppt";

          Return = "mode default";
          Escape = "mode default";
          "${mod}+Shift+r" = "mode default";
          "${mod}+r" = "mode default";
          "${mod}+m" = "mode move";
        };

        move = {
          Left = "move left ${moveSpeed} px";
          Down = "move down ${moveSpeed} px";
          Up = "move up ${moveSpeed} px";
          Right = "move right ${moveSpeed} px";

          "Shift+Left" = "move left ${moveSpeedSlowed} px";
          "Shift+Down" = "move down ${moveSpeedSlowed} px";
          "Shift+Up" = "move up ${moveSpeedSlowed} px";
          "Shift+Right" = "move right ${moveSpeedSlowed} px";

          Return = "mode default";
          Escape = "mode default";
          "${mod}+Shift+m" = "mode default";
          "${mod}+m" = "mode default";
          "${mod}+r" = "mode resize";
        };
      };

      window = {
        titlebar = false;
        border = 2;
      };

      floating = {
        titlebar = false;
        modifier = mod;
        border = 2;
      };

      gaps = {
        inner = 9;
        outer = 1;
      };

      startup = [
        { command = "${pkgs.systemd}/bin/systemctl --user restart " + builtins.concatStringsSep " " (map (s: "${s}.service") services); }
      ];
    };

    extraConfig = ''
      default_border pixel 2
      default_floating_border pixel 2
      for_window [class="^.*"] border pixel 2
    '';

  };

  home.file = {
    ".Xresources" = {
      text = ''
        Xcursor.theme: capitaine-cursors
        Xcursor.size: 30
      '';
    };
  };

  xdg.configFile = {
    "i3/redraw.sh" = {
      text = ''
        ${pkgs.systemd}/bin/systemctl --user restart feh picom
      '';
      executable = true;
    };

    "i3/window_ss.sh" = {
      text = ''
        filename="$HOME/Pictures/Screenshots/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"

        mkdir -p "$HOME/Pictures/Screenshots"

        ${lib.getExe pkgs.scrot} -u "$filename"

        if [[ -f "$filename" ]]; then
            ${lib.getExe pkgs.xclip} -selection clipboard -t image/png < "$filename"

            ${lib.getExe pkgs.libnotify} "Screenshot saved" "File: $filename (copied to clipboard)"
        else
            ${lib.getExe pkgs.libnotify} "Screenshot failed" "File: $filename could not be saved"
        fi
      '';
      executable = true;
    };

    "i3/volume_brightness.sh" = {
      text = ''
        volume_step=5
        brightness_step=5
        max_volume=125
        notification_timeout=1000

        function get_volume {
            ${lib.getExe pkgs.pulsemixer} --get-volume | ${lib.getExe pkgs.gawk} '{print $1}'
        }

        function get_mute {
            ${lib.getExe pkgs.pulsemixer} --get-mute
        }

        function get_brightness {
            ${lib.getExe pkgs.brightnessctl} get
        }

        function get_volume_icon {
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

        function get_brightness_icon {
            brightness_icon=""
        }

        function show_volume_notif {
            volume=$(get_volume)
            get_volume_icon
            ${lib.getExe pkgs.libnotify} -t $notification_timeout -h string:x-dunst-stack-tag:volume_notif -h int:value:$volume "$volume_icon    $volume%"
        }

        function show_brightness_notif {
            brightness=$(get_brightness)
            max_brightness=$(${lib.getExe pkgs.brightnessctl} max)
            percentage=$(( brightness * 100 / max_brightness ))
            get_brightness_icon
            ${lib.getExe pkgs.libnotify} -t $notification_timeout -h string:x-dunst-stack-tag:brightness_notif -h int:value:$percentage "$brightness_icon    $percentage%"
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
                ${lib.getExe pkgs.libnotify} "Error" "Invalid argument. Use 'volume_up', 'volume_down', 'brightness_up', or 'brightness_down'."
                ;;
        esac
      '';
      executable = true;
    };
  };
}
