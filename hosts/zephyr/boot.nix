{ config, lib, pkgs, ... }:


{
  include = [ themes/grub.nix ];

  boot.loader.grub = {
  	enable = true;
	  efiSupport = true;
	  device = "nodev";
		theme = "/home/dima/projects/tartarus-grub/tartarus/theme.txt";
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
