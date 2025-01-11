{ config, lib, pkgs, ... }:

let
  tartarus = import ./packages/tartarus.nix { inherit pkgs; };
in
{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        theme = tartarus;
        extraEntries = ''
        	menuentry "Windows" {
      		set root=(hd0,gpt1)
      		chainloader /EFI/Microsoft/Boot/bootmgfw.efi
       	  }
        '';
      };
    };

    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };

    initrd = {
      verbose = false;
    };

    consoleLogLevel = 0;
    kernelParams = [
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
  };
}
