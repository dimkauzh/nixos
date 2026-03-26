{ lib, ... }:

{
  services = {
    auto-cpufreq.enable = lib.mkForce false;
    thermald.enable = true;
    
    tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_BAT=0;
        CPU_BOOST_ON_AC=1;

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 85;

        CPU_SCALING_MIN_FREQ_ON_AC=0;
        CPU_SCALING_MAX_FREQ_ON_AC=9999999;
        CPU_SCALING_MIN_FREQ_ON_BAT=0;
        CPU_SCALING_MAX_FREQ_ON_BAT=2800000;

        PLATFORM_PROFILE_ON_BAT="balanced";
        PLATFORM_PROFILE_ON_AC="performance";
      };
    };
  };
}
