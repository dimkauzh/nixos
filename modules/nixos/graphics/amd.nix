{ unstable, ... }:
# { pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    package = unstable.mesa;
    package32 = unstable.driversi686Linux.mesa;

    extraPackages = with unstable; [
    #extraPackages = with pkgs; [
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

    extraPackages32 = with unstable.driversi686Linux; [
    # extraPackages32 = with pkgs.driversi686Linux; [
      mesa
      amdvlk
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
