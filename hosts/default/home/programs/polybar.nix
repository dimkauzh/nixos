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
        background = "#282828";
        background-alt = "#3c3836";
        foreground = "#ebdbb2";
        primary = "#fabd2f";
        secondary = "#83a598";
        alert = "#fb4934";
        disabled = "#7c6f64";
      };

      "bar/main" = {
        width = "100%";
        height = "24pt";
        radius = 8;

        background = "\${colors.background}";
        foreground = "\${colors.foreground}";

        line-size = "3pt";

        border-size = "4pt";
        border-color = "#00000000";

        padding-left = 0;
        padding-right = 1;

        module-margin = 1;

        separator = "|";
        separator-foreground = "\${colors.disabled}";

        font-0 = "monospace"; #;2

        modules-left = "i3 xwindow";
        modules-right = "systray battery backlight pulseaudio memory cpu cpu-temp date";

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";

        enable-ipc = true;
      };

      "module/systray" = {
        type = "internal/tray";
        tray-position = "left";

        format-margin = "8pt";
        tray-spacing = "16pt";
      };

      "module/i3" = {
        type = "internal/i3";
        pin-workspaces = true;
        strip-wsnumbers = true;
        index-sort = true;
        enable-click = true;
        enable-scroll = false;
        wrapping-scroll = false;
        reverse-scroll = false;
        fuzzy-match = false;

        label-mode = "%mode%";
        label-mode-padding = 2;
        label-mode-background = "\${colors.alert}";

        label-focused = "%name%";
        label-focused-background = "\${colors.background}";
        label-focused-underline = "\${colors.primary}";
        label-focused-padding = 2;

        label-unfocused = "%name%";
        label-unfocused-padding = 2;

        label-urgent = "%name%";
        label-urgent-background = "\${colors.alert}";
        label-urgent-padding = 2;
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";

        label-active = "%name%";
        label-active-background = "\${colors.background-alt}";
        label-active-underline = "\${colors.primary}";
        label-active-padding = 1;

        label-occupied = "%name%";
        label-occupied-padding = 1;

        label-urgent = "%name%";
        label-urgent-background = "\${colors.alert}";
        label-urgent-padding = 1;

        label-empty = "%name%";
        label-empty-foreground = "\${colors.disabled}";
        label-empty-padding = 1;
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:60:...%";
      };

      "module/battery" = {
        type = "internal/battery";
        battery = "BAT0";
        full-at = 99;

        label-full = "%{F#b8bb26}BAT %{F#FFFFFF}%percentage%%";
        label-charging = "%{F#83a598}BAT %{F#FFFFFF}%percentage%%";
        label-discharging = "%{F#fabd2f}BAT %{F#FFFFFF}%percentage%%";
        format = "%label%";
      };

      "module/backlight" = {
        type = "internal/backlight";
        interval = 1;

        card = "intel_backlight";
        format-prefix = "BRI ";
        format-prefix-foreground = "\${colors.primary}";
        label = "%percentage%%";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        interval = 1;

        format-volume-prefix = "VOL ";
        format-volume-prefix-foreground = "\${colors.primary}";
        format-volume = "<label-volume>";

        label-volume = "%percentage%%";

        label-muted = "muted";
        label-muted-foreground = "\${colors.disabled}";
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 2;
        format-prefix = "RAM ";
        format-prefix-foreground = "\${colors.primary}";
        label = "%percentage_used:2%%";
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 2;
        format-prefix = "CPU ";
        format-prefix-foreground = "\${colors.primary}";
        label = "%percentage:2%%";
      };

      "module/cpu-temp" = {
        type = "custom/script";
        exec = "${pkgs.lm_sensors}/bin/sensors | ${pkgs.gawk}/bin/awk '/^Package id 0:/ {temp = $4 + 0.5; print int(temp)\"°\"}'";
        interval = 2;
        format-prefix = "TEM ";
        format-prefix-foreground = "\${colors.primary}";
        label = "%output%";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;

        date = "%H:%M";
        date-alt = "%Y-%m-%d %H:%M:%S";

        label = "%date%";
        label-foreground = "\${colors.primary}";
      };

      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = true;
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
