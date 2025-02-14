{ pkgs, ... }:

{
  programs.direnv = {
    package = pkgs.direnv;
    silent = false;
    loadInNixShell = true;
    enableZshIntegration = true;
    direnvrcExtra = "";
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
  };
}
