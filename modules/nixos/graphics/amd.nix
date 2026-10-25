{ unstable, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    #package = unstable.mesa;
    #package32 = unstable.driversi686Linux.mesa;

    extraPackages = with pkgs; [
      mesa
      libGL
      libglvnd
      libva
      libva-vdpau-driver
      libvdpau-va-gl
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      rocmPackages.clr.icd
    ];

    extraPackages32 = with pkgs.driversi686Linux; [
      mesa
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
