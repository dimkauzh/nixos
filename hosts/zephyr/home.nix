{ system_version, ... }:


{
  imports =
    [
      ./overwrites.nix
    ];
  
  custom.hwmon = "/sys/class/thermal/thermal_zone5/temp";
  
  home.stateVersion = system_version; # (dont change)
}
