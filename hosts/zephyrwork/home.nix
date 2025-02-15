{ ... }:


{
  imports =
    [
      ./overwrites.nix
      ../default/home/dima.nix
      ../default/home/modules.nix
    ];

  home = {
    sessionVariables = {
      EDITOR = "zeditor";
      BROWSER = "zen-browser";
    };

    file.".Xresources" = {
      enable = true;
      text = ''
        *dpi: 100
        Xft.dpi: 100
        Xcursor.theme: capitaine-cursors
      '';
    };

    file.".icons/default/index.theme" = {
      enable = true;
      text = ''
        [Icon Theme]
        Name=Default
        Comment=Default Cursor Theme
        Inherits=capitaine-cursors
      '';
    };

    stateVersion = "24.11"; # (dont change)
  };

  programs.home-manager.enable = false;
}
