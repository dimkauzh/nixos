{ config, lib, pkgs, ... }:

let
  gruvboxPlusIcons = import ./packages/gruvbox-icons.nix { inherit pkgs; };
in
{
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    libinput.enable = true;
    upower.enable = true;
    openssh.enable = true;

    gnome.gnome-keyring.enable = true;
    acpid.enable = true;

    blueman.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        domain = true;
        hinfo = true;
        userServices = true;
        workstation = true;
      };
    };

    xserver = {
      enable = true;
      videoDrivers = [ "i915" ];

      xkb = {
        layout = "us";
        options = "compose:rctrl";
      };

      windowManager = {
        i3.enable = true;
      };

      displayManager.lightdm = {
        enable = true;

        greeters.gtk = {
          enable = true;

          theme = {
            package = pkgs.gruvbox-gtk-theme;
            name = "Gruvbox-Dark";
          };

          iconTheme = {
            package = gruvboxPlusIcons;
            name = "Gruvbox-Plus-Dark";
          };

          extraConfig = ''
            background=/etc/backgrounds/forest-3.jpg
          '';
        };
      };
      config = ''
        Section "InputClass"
            Identifier "libinput touchpad catchall"
            MatchIsTouchpad "on"
            MatchDevicePath "/dev/input/event*"
            Driver "libinput"
            Option "Tapping" "on"
            Option "ClickMethod" "clickfinger"
            Option "TappingButtonMap" "lrm"
            Option "DisableWhileTyping" "false"
        EndSection
      '';
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
