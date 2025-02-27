{ pkgs, ... }:

let
    gruvboxPlusIcons = import ../../nixos/packages/gruvbox-icons.nix { inherit pkgs; };
in
{
  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };

    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = gruvboxPlusIcons;
    };

    cursorTheme = {
      name = "capitaine-cursors";
      package = pkgs.capitaine-cursors;
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

  home.file.".icons/default/index.theme" = {
    enable = true;
    text = ''
      [Icon Theme]
      Name=Default
      Comment=Default Cursor Theme
      Inherits=capitaine-cursors
    '';
  };
}
