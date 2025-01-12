{ config, pkgs, ... }:

{
  services = {
    thermald.enable = true;

    tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_BAT=0;

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        PLATFORM_PROFILE_ON_BAT="quiet";
      };
    };
  };
}
