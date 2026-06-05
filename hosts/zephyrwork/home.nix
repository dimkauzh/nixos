{ pkgs, system_version, ... }:


{
  imports =
    [
      ./overwrites.nix
    ];
  custom.hwmon = "/sys/class/thermal/thermal_zone3/temp";
  home = {
    file = {
      "games/0ad/run.sh" = {
        enable = true;
        text = ''
          #!/bin/bash
          ${pkgs.zeroad}/bin/0ad
        '';
        executable = true;
      };

      "games/doom/run.sh" = {
        enable = true;
        text = ''
          #!/bin/bash
          ${pkgs.gzdoom}/bin/gzdoom
        '';
        executable = true;
      };

      "games/quake3/run.sh" = {
        enable = true;
        text = ''
          #!/bin/bash
          ${pkgs.ioquake3}/bin/ioquake3
        '';
        executable = true;
      };

      "games/trigger/run.sh" = {
        enable = true;
        text = ''
          #!/bin/bash
          ${pkgs.trigger-unstable}/bin/trigger-rally
        '';
        executable = true;
      };

      "games/prismlauncher/run.sh" = {
        enable = true;
        text = ''
          #!/bin/bash
          ${pkgs.prismlauncher}/bin/prismlauncher
        '';
        executable = true;
      };
    };

    stateVersion = system_version; # (dont change)
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
