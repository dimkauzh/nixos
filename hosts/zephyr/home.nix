{ ... }:


{
  imports =
    [
      ./overwrites.nix
    ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen";
  };

  home.stateVersion = "25.05"; # (dont change)
}
