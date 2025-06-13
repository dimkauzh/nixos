{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    clock24 = true;
    keyMode = "vi";
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";

    extraConfig = ''
      set -g status on
    '';
  };
}
