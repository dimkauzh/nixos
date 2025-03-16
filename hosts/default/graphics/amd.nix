{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      libGL
      libglvnd
      libva
      vaapiVdpau
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.mesa
      driversi686Linux.amdvlk
    ];
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
