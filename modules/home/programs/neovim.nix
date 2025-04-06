{ pkgs, inputs, ... }:

let
  nvim-config = inputs.nvim-config.packages."${pkgs.system}".default;
in 

{
  xdg.configFile."nvim/".source = "${nvim-config}/nvim";
}
