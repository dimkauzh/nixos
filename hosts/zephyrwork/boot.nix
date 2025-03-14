{ ... }:

{
  boot = {
    extraModprobeConfig = ''
      options mt7921e disable_aspm=1
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
