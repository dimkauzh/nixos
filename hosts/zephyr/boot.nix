{ ... }:

{
  boot.loader.grub = {
    gfxmodeEfi = "1920x1080";
    extraEntries = ''
      menuentry "Windows" {
      set root=(hd0,gpt1)
      chainloader /EFI/Microsoft/Boot/bootmgfw.efi
      }
    '';
  };

  boot.kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "systemd.show_status=1"
      "intel_pstate=passive"
  ];
}
