{ mesa-pkg, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    package = mesa-pkg.mesa.drivers;
    package32 = mesa-pkg.driversi686Linux.mesa.drivers;

    extraPackages = with mesa-pkg; [
      mesa
      amdvlk

      libGL
      libglvnd
      libva
      vaapiVdpau
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
    ];
    extraPackages32 = with mesa-pkg.driversi686Linux; [
      mesa
      amdvlk
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
