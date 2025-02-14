{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      mesa
      mesa.drivers
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.mesa
      driversi686Linux.vulkan-loader
      driversi686Linux.vulkan-validation-layers
      driversi686Linux.amdvlk
    ];
  };
}
