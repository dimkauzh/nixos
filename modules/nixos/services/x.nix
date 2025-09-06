{ pkgs, ... }:

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

    displayManager = {
      lightdm = {
        enable = false;

        greeters.gtk = {
          enable = false;

          theme = {
            package = pkgs.gruvbox-gtk-theme;
            name = "Gruvbox-Dark";
          };

          iconTheme = {
            package = pkgs.gruvbox-plus-icons;
            name = "Gruvbox-Plus-Dark";
          };

          extraConfig = ''
            background=${pkgs.gruvbox-wallpapers}/backgrounds/wallpapers/irl/gruvbox-forest.jpg
          '';
        };
      };
      gdm = {
        enable = false;
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
