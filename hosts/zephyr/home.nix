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
  
  home.stateVersion = "25.11"; # (dont change)
}
