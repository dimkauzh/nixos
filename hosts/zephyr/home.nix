{ ... }:


{
  imports =
    [
      ./overwrites.nix
    ];
  
  custom.hwmon = "/sys/class/thermal/thermal_zone5/temp";
  
  home.stateVersion = "25.11"; # (dont change)
}
