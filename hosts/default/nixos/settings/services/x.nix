{ pkgs, ... }:

let
  gruvboxPlusIcons = import ../../packages/gruvbox-icons.nix { inherit pkgs; };
  wallpapers = import ../../packages/wallpapers.nix { inherit pkgs; };
in
{
  services.xserver = {
    enable = true;

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
          background=${wallpapers}/backgrounds/wallpapers/irl/gruvbox-forest.jpg
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
}
