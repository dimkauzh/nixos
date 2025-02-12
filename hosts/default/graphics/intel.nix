{ ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
    ];
  };

  services.xserver.videoDrivers = [ "i915" ];
}
