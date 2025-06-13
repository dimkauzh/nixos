{ ... }:

{
  boot = {
    loader.grub = {
      gfxmodeEfi = "2256x1504";
      extraConfig = ''
        GRUB_GFXPAYLOAD_LINUX=2256x1504
      '';
    };

    extraModprobeConfig = ''
      options cfg80211 ieee80211_regdom="NL"
    '';

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "systemd.show_status=1"

      "amdgpu.si_support=1"
      "amdgpu.cik_support=1"
    ];
  };
}
