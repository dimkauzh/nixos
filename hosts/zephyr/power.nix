{ config, pkgs, ... }:

{
  services = {
    thermald.enable = true;

    tlp = {
      enable = true;
      settings = {
        HANDLE_LID_SWITCH=1;

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      };
    };
  };
}
