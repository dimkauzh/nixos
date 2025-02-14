{ pkgs, ... }:

let
  tartarus = import ../packages/tartarus.nix { inherit pkgs; };
in
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;


  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        theme = tartarus;
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
  };

  environment.etc."/var/lib/AccountsService/users/dima".text = ''
    [User]
    Icon=/var/lib/AccountsService/icons/dima
  '';

  system.activationScripts.script.text = ''
    cp /home/dima/.face /var/lib/AccountsService/icons/dima
  '';
}
