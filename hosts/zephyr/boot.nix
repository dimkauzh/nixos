{ config, lib, pkgs, ... }:


{
  boot.loader.grub = {
  	enable = true;
	  efiSupport = true;
	  device = "nodev";
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.loader.grub.extraEntries = ''
  	menuentry "Windows" {
		set root=(hd0,gpt1)
		chainloader /EFI/Microsoft/Boot/bootmgfw.efi
	}
  '';

  boot.loader.efi.canTouchEfiVariables = true;
}
