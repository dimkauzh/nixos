{ ... }:


{
  imports =
    [
      ../default/home/dima.nix
      ../default/home/modules.nix
    ];

  home.sessionVariables = {
    EDITOR = "zeditor";
    BROWSER = "zen-browser";
  };

  home.file.".Xresources" = {
    enable = true;
    text = ''
      *dpi: 100
      Xft.dpi: 100
    '';
  };


  home.stateVersion = "24.11"; # (dont change)

  programs.home-manager.enable = false;
}
