{ ... }:


{
  imports =
    [
      ./overwrites.nix
    ];
  
  custom.hwmon = "/sys/class/thermal/thermal_zone5/temp";

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen";
  };
  
  home.stateVersion = "25.11"; # (dont change)
}
