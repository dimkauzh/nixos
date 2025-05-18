{ ... }:

{
  boot = {
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
    ];
  };
}
