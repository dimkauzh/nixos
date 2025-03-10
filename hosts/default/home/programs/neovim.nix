{ pkgs, ... }:

let
  nvim-config = import ../../nixos/packages/neovim.nix { inherit pkgs; };
in 

{
  xdg.configFile."nvim/".source = "${nvim-config}/nvim";
}
