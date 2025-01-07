{ config, pkgs, ... }:

let 
    gruvboxPlusIcons = import ../packages/gruvbox-icons.nix { inherit pkgs; };
in
{
  home.gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme
    };

    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = gruvboxPlusIcons;
    };

    cursorTheme = {
      name = "capitaine-cursors";
      package = pkgs.capitaine-cursors
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        gtk-decoration-layout=:menu
        gtk-font-name=Noto Sans 10
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        gtk-decoration-layout=:menu
        gtk-font-name=Noto Sans 10
      '';
    };
  };
}
