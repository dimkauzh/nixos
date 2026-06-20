{ ... }:

{
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        energy_performance_preference = "power";
        platform_profile = "low-power";
        turbo = "false";
      };
      charger = {
        governor = "performance";
        energy_performance_preference = "performance";
        platform_profile = "performance";
        turbo = "auto";
      };
    };
  };
}
