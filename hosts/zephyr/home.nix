{ ... }:


{
  imports =
    [
      ./overwrites.nix
      ../../modules/home/dima.nix
      ../../modules/home/modules.nix
    ];

  home.sessionVariables = {
    EDITOR = "zeditor";
    BROWSER = "zen-browser";
  };

  home.stateVersion = "25.05"; # (dont change)

  programs.home-manager.enable = false;
}
