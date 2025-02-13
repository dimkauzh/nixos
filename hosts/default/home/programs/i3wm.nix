{ pkgs, ... }:

let
  mod = "Mod4";
  alt = "Mod1";
  wallpapers = import ../../nixos/packages/wallpapers.nix { inherit pkgs; };
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
        "XF86AudioRaiseVolume" = "exec bash ~/.config/i3/volume_brightness.sh volume_up";
        "XF86AudioLowerVolume" = "exec bash ~/.config/i3/volume_brightness.sh volume_down";
        "XF86AudioMute" = "exec bash ~/.config/i3/volume_brightness.sh volume_mute";

        # Media keys
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioPause" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl position 10+";
        "XF86AudioPrev" = "exec playerctl position 10-";

        # System Brightness Controls
        "XF86MonBrightnessUp" = "exec bash ~/.config/i3/volume_brightness.sh brightness_up";
        "XF86MonBrightnessDown" = "exec bash ~/.config/i3/volume_brightness.sh brightness_down";

        # Binding other top keys
        "${mod}+p" = "exec arandr";
        "F9" = "exec powerkit --config";

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
        "Print" = "exec flameshot gui -c -p ~/Pictures/Screenshots";
        "${mod}+Print" = "exec bash ~/.config/i3/window_ss.sh";
        "${mod}+Shift+Print" = "exec flameshot full -c -p ~/Pictures/Screenshots";

        # Rofi
        "${mod}+space" = "exec XDG_DATA_DIRS=$XDG_DATA_DIRS:/home/$USER/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share rofi -show drun";

        # Greenclip
        "${mod}+x" = "exec rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'";

        # Reset monitor settings
        "${mod}+z" = "exec xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output DP-2 --off";

        # Display redraw
        "${mod}+Shift+z" = "exec bash ~/.config/i3/redraw.sh";

        # Toggle polybar
        "${alt}+p" = "exec polybar-msg cmd toggle";

        # Restart picom
        "${mod}+Shift+p" = "exec systemctl --user restart picom";

        # Reload the configuration file
        "${mod}+r" = "reload";

        # Modes
        "${mod}+Escape" = "mode system";
        "${mod}+Shift+r" = "mode resize";
      };

      colors = {
        focused = {
          border = "#b8bb26";
          background = "#b8bb26";
          text = "#32302f";
          indicator = "#b8bb26";
          childBorder = "#b8bb26";
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
          e = "exec i3-msg exit";
          l = "exec ${pkgs.lightdm}/bin/dm-tool switch-to-greeter, mode default";
          p = "exec systemctl suspend, mode default";
          h = "exec systemctl hibernate, mode default";
          r = "exec systemctl reboot, mode default";
          s = "exec systemctl poweroff, mode default";

          Escape = "mode default";
          Return = "mode default";
          "${mod}+Escape" = "mode default";
        };

        resize = {
          j = "resize shrink width 5 px or 5 ppt";
          k = "resize grow height 5 px or 5 ppt";
          l = "resize shrink height 5 px or 5 ppt";
          semicolon = "resize grow width 5 px or 5 ppt";

          Left = "resize shrink width 5 px or 5 ppt";
          Down = "resize grow height 5 px or 5 ppt";
          Up = "resize shrink height 5 px or 5 ppt";
          Right = "resize grow width 5 px or 5 ppt";

          Return = "mode default";
          Escape = "mode default";
          "${mod}+Shift+r" = "mode default";
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
        { command = "systemctl --user start xsettingsd polybar dunst blueman-applet picom xss-lock feh"; }
        { command = "powerkit"; }
        { command = "lxqt-policykit-agent"; }
        { command = "nm-applet"; }
        { command = "greenclip daemon"; }
        { command = "xeventbind resolution ~/.config/i3/redraw.sh"; }
      ];
    };

    extraConfig = ''
      default_border pixel 2
      default_floating_border pixel 2
      for_window [class="^.*"] border pixel 2
    '';

  };

  home.file = {
    ".config/i3/redraw.sh" = {
      text = ''
        systemctl --user restart picom feh
      '';
      executable = true;
    };

    ".config/i3/window_ss.sh" = {
      text = ''
        filename="$HOME/Pictures/Screenshots/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"

        mkdir -p "$HOME/Pictures/Screenshots"

        scrot -u "$filename"

        if [[ -f "$filename" ]]; then
            xclip -selection clipboard -t image/png -i "$filename"

            notify-send "Screenshot saved" "File: $filename (copied to clipboard)"
        else
            notify-send "Screenshot failed" "File: $filename could not be saved"
        fi
      '';
      executable = true;
    };

    ".config/i3/volume_brightness.sh" = {
      text = ''
        volume_step=5
        brightness_step=5
        max_volume=150
        notification_timeout=1000

        function get_volume {
            pulsemixer --get-volume | awk '{print $1}'
        }

        function get_mute {
            pulsemixer --get-mute
        }

        function get_brightness {
            brightnessctl get
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
            notify-send -t $notification_timeout -h string:x-dunst-stack-tag:volume_notif -h int:value:$volume "$volume_icon    $volume%"
        }

        function show_brightness_notif {
            brightness=$(get_brightness)
            max_brightness=$(brightnessctl max)
            percentage=$(( brightness * 100 / max_brightness ))
            get_brightness_icon
            notify-send -t $notification_timeout -h string:x-dunst-stack-tag:brightness_notif -h int:value:$percentage "$brightness_icon    $percentage%"
        }

        case $1 in
            volume_up)
                pactl set-sink-mute @DEFAULT_SINK@ 0
                pulsemixer --change-volume +$volume_step --max-volume $max_volume
                show_volume_notif
                ;;

            volume_down)
                pactl set-sink-mute @DEFAULT_SINK@ 0
                pulsemixer --change-volume -$volume_step --max-volume $max_volume
                show_volume_notif
                ;;

            volume_mute)
                pactl set-sink-mute @DEFAULT_SINK@ toggle
                show_volume_notif
                ;;

            brightness_up)
                brightnessctl set +$brightness_step%
                show_brightness_notif
                ;;

            brightness_down)
                brightnessctl set $brightness_step%-
                show_brightness_notif
                ;;

            *)
                notify-send "Error" "Invalid argument. Use 'volume_up', 'volume_down', 'brightness_up', or 'brightness_down'."
                ;;
        esac
      '';
      executable = true;
    };
  };
}
