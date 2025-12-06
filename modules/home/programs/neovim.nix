{ pkgs, inputs, ... }:

let
  nvim-config = inputs.nvim-config.packages."${pkgs.stdenv.hostPlatform.system}".default;
in 

{
  xdg.configFile."nvim/".source = "${nvim-config}/nvim";
}
