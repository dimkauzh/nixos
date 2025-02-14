{ pkgs, ... }:

{
  programs.direnv = {
    package = pkgs.direnv;
    silent = false;
    enableZshIntegration = true;
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
  };
}
