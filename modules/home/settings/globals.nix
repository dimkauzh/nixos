{ lib, ... }:

{
  options.custom.hwmon = lib.mkOption {
    type = lib.types.str;
    default = "/sys/class/thermal/thermal_zone0/temp";
  };
}
