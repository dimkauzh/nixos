{ pkgs, lib, ... }:

{
  services.polybar = {
    enable = true;
    script = "polybar --reload main";

    package = pkgs.polybar.override {
      pulseSupport = true;
      i3Support = true;
    };

    settings = {
      "colors" = {
        bg = "#282828";
        bg-alt = "#3c3836";
        bg-darker = "#1d2021";
        fg = "#fbf1c7";

        blue = "#83a598";
        cyan = "#8ec07c";
        green = "#b8bb26";
        orange = "#fe8019";
        purple = "#d3869b";
        red = "#fb4934";
        yellow = "#fabd2f";

        bg-blue = "#458588";
        bg-cyan = "#689d6a";
        bg-green = "#98971a";
        bg-orange = "#d65d0e";
        bg-purple = "#b16268";
        bg-red = "#cc241d";
        bg-yellow = "#d79921";

        black = "#000";
        white = "#FFF";
      };

      "bar/main" = {
        width = "100%";
        height = "24pt";
        radius = 15;

        background = "\${colors.bg}";
        foreground = "\${colors.fg}";

        line-size = "3pt";

        border-size = "4pt";
        border-color = "#00000000";

        padding-left = 0;
        padding-right = 1;

        module-margin = 1;

        separator-foreground = "\${colors.disabled}";

        font-0 = "JetBrainsMono:style=Bold:size=13;3";
        font-1 = "Material Icons Round:size=15;5";


        modules-left = "i3 divider title";
        modules-right = "tray divider battery cpu memory pulseaudio temperature backlight date";

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";

        enable-ipc = true;
      };

      "module/i3" = {
        type = "internal/i3";
        index-sort = true;

        show-urgent = true;

        ws-icon-0 = "1: ff;%{T1}%{T-}";
        ws-icon-1 = "2;%{T1}%{T-}";
        ws-icon-2 = "3;%{T1}%{T-}";
        ws-icon-3 = "4;%{T1}%{T-}";
        ws-icon-4 = "5: msg;%{T1}%{T-}";
        ws-icon-5 = "6;%{T1}%{T-}";
        ws-icon-default = "%{T1}%{T-}";

        format = "<label-state> <label-mode>";

        label-mode = " %mode% ";
        label-mode-padding = 1;
        label-mode-background = "\${colors.orange}";
        label-mode-foreground = "\${colors.black}";

        label-focused = " %name% ";
        label-focused-foreground = "\${colors.white}";
        label-focused-background = "\${colors.blue}";
        label-focused-padding = 1;

        label-unfocused = " %name% ";
        label-unfocused-foreground = "\${colors.purple}";
        label-unfocused-padding = 1;

        label-visible = " %name% ";
        label-visible-foreground = "\${colors.blue}";
        label-visible-padding = 1;

        label-urgent = " %name% ";
        label-urgent-foreground = "\${colors.red}";
        label-urgent-padding = 1;
      };

      "module/divider" = {
        type = "custom/text";
        label = "|";
        format-padding = 1;
      };

      "module/title" = {
        type = "internal/xwindow";
        format = "<label>";
        format-foreground = "\${colors.fg}";
        format-padding = 1;
        label = "%title%";
        label-maxlen = 35;
      };

      "module/tray" = {
        type = "internal/tray";
        format = "<tray>";
        format-margin = "8px";
        format-background = "\${colors.bg}";
        tray-padding = "8px";
        # tray-size = "150%";
      };

      "module/battery" = {
        type = "internal/battery";
        battery = "BAT0";
        adapter = "AC";
        full-at = 98;

        format-charging = "<label-charging>";
        format-charging-padding = 1;
        format-charging-prefix = "%{T1}%{T-}";
        format-charging-prefix-foreground = "\${colors.blue}";
        label-charging = "%{T0}%percentage%%%{T-}";
        label-charging-padding = 1;

        format-discharging = "<label-discharging>";
        format-discharging-padding = 1;
        format-discharging-prefix = "%{T1}%{T-}";
        format-discharging-prefix-foreground = "\${colors.blue}";
        label-discharging = "%{T0}%percentage%%%{T-}";
        label-discharging-padding = 1;

        format-full = "<label-full>";
        format-full-padding = 1;
        format-full-prefix = "%{T1}%{T-}";
        format-full-prefix-foreground = "\${colors.blue}";
        label-full = "%{T0}%percentage%%%{T-}";
        label-full-padding = 1;
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 1;
        format = "<label>";
        format-padding = 1;
        format-prefix = "%{T1}%{T-}";
        format-prefix-foreground = "\${colors.purple}";
        label = "%{T0}%percentage:2%%%{T-}";
        label-foreground = "\${colors.fg}";
        label-padding = 1;
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 1;
        format = "<label>";
        format-padding = 1;
        format-prefix = "%{T0}%{T-}";
        format-prefix-foreground = "\${colors.blue}";
        label = "%{T0}%percentage_used%%%{T-}";
        label-foreground = "\${colors.fg}";
        label-padding = 1;
      };

      "module/wlan" = {
        type = "internal/network";
        interface = "wlp1s0";
        interval = 1.0;

        format-connected = "<label-connected>";
        format-connected-padding = 1;
        format-connected-prefix = "%{T1}%{T-}";
        format-connected-prefix-foreground = "$\{colors.orange}";
        label-connected = "%{T1}%{T-}%{T0}%downspeed%%{T-}";
        label-connected-foreground = "\${colors.fg}";
        label-connected-padding = 1;

        format-disconnected = "<label-disconnected>";
        format-disconnected-padding = 1;
        format-disconnected-prefix = "%{T1}%{T-}";
        format-disconnected-prefix-foreground = "$\{colors.red}";
        label-disconnected = "%{T0}:(%{T-}";
        label-disconnected-foreground = "\${colors.fg}";
        label-disconnected-padding = 1;
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        use-ui-max = true;

        format-volume = "<label-volume>";
        format-volume-padding = 1;
        format-volume-prefix = "%{T0}%{T-}";
        format-volume-prefix-foreground = "\${colors.orange}";
        label-volume = "%{T0}%percentage%%%{T-}";
        label-volume-foreground = "\${colors.fg}";
        label-volume-padding = 1;

        format-muted = "<label-muted>";
        format-muted-padding = 1;
        format-muted-prefix = "%{T0}%{T-}";
        format-muted-prefix-foreground = "\${colors.red}";
        label-muted = "%{T0}%percentage%%%{T-}";
        label-muted-foreground = "\${colors.fg}";
        label-muted-padding = 1;

        # click-right = "pavucontrol&";
      };

      "module/temperature" = {
        type = "internal/temperature";
        thermal-zone = 0;
        warn-temperature = 75;

        format = "<label>";
        format-padding = 1;
        format-prefix = "%{T1}%{T-}";
        format-prefix-foreground = "\${colors.orange}";

        format-warn = "<label-warn>";
        format-warn-padding = 1;
        format-warn-prefix = "%{T1}%{T-}";
        format-warn-prefix-foreground = "\${colors.red}";

        label = "%{T0}%temperature-c%%{T-}";
        label-foreground = "\${colors.fg}";
        label-padding = 1;

        label-warn = "%{T0}%temperature-c%%{T-}";
        label-warn-foreground = "\${colors.fg}";
        label-warn-padding = 1;
      };

      "module/backlight" = {
        type = "internal/backlight";
        card = "amdgpu_bl0";
        enable-scroll = true;
        format = "<label>";
        format-padding = 1;
        format-prefix = "%{T1}%{T-}";
        format-prefix-foreground = "\${colors.blue}";
        label = "%{T0}%percentage%%%{T-}";
        label-foreground = "\${colors.fg}";
        label-padding = 1;
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        time = "%H:%M";
        time-alt = "%a, %b %d %H:%M:%S";

        format = "<label>";
        format-prefix = "%{T1}%{T-}";
        format-prefix-foreground = "\${colors.purple}";
        format-background = "\${colors.bg}";
        format-foreground = "\${colors.fg}";
        format-padding = 1;
        label = "%{T0}%time%%{T-}";
        label-padding = 1;
      };

      "settings" = {
        screenchange-reload = true;
        # pseudo-transparency = true;
      };
    };
  };

  systemd.user.services.polybar = {
    Service = {
      Type = lib.mkForce "simple";
      TimeoutStartSec = "5s";
    };
  };
}
