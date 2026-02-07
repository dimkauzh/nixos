{ pkgs, config, lib, ... }:

let
  hwPath = config.waybar.thermalPath or "/sys/class/thermal/thermal_zone5/temp";
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ../assets/waybar/style.css;
    settings = [
      {
        modules-left = [
          "custom/launcher"
          "battery"
          "backlight"
          "wireplumber"
        ];

        modules-center = [
          "niri/workspaces"
        ];

        modules-right = [
          "tray"
          "cpu"
          "memory"
          "temperature"
          "clock"
        ];

        wireplumber = {
          tooltip = false;
          scroll-step = 5;
          format = "{icon} {volume}%";
          format-muted = "󰝟  {volume}%";
          on-click = "${lib.getExe pkgs.pwvucontrol} &";
          format-icons = {
            default = [ "" " " "  " ];
          };
        };

        backlight = {
          tooltip = false;
          format = "  {}%";
          interval = 1;
          on-scroll-up = "${lib.getExe pkgs.light} -A 5";
          on-scroll-down = "${lib.getExe pkgs.light} -U 5";
        };

        battery = {
          states = {
            full = 100;
            good = 75;
            decent = 50;
            warning = 10;
            critical = 5;
          };
          format = "{icon}  {capacity}%";
          format-time = "{H} h {M} min";
          format-alt = "{icon}  {time}";
          format-icons = [ " " " " " " " " " " ];
        };

        clock = {
          format = "  {:%H:%M}";
          format-alt = "  {:%H:%M - %d/%m/%Y}";
        };

        tray = {
          icon-size = 22;
          spacing = 10;
        };

        cpu = {
          interval = 1;
          format = "   {usage}%";
          max-length = 10;
          on-click = "${lib.getExe pkgs.kitty} -- ${lib.getExe pkgs.btop}";
        };

        memory = {
          interval = 1;
          format = "   {}%";
          max-length = 10;
        };

        temperature = {
          interval = 1;
          format = " {temperatureC}°C";
          hwmon-path = hwPath;
        };

        "custom/launcher" = {
          format = " ";
          on-click = "${lib.getExe pkgs.rofi} -show drun -show-icons";
          on-click-right = "killall rofi";
        };

        "niri/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = " 1 ";
            "2" = " 2 ";
            "3" = " 3 ";
            "4" = " 4 ";
            "5" = " 5 ";
            "6" = " 6 ";
            "7" = " 7 ";
            "8" = " 8 ";
            "9" = " 9 ";
            "10" = " 10 ";
          };
          active = "";
          sort-by-number = true;
        };
      }
    ];
  };
}
