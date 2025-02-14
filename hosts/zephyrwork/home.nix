{ lib, ... }:


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

  xsession.windowManager.i3.config.keybindings."Mod4+z" = lib.mkForce "exec xrandr --output eDP-1 --primary --mode 2256x1504 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off --output DP-6 --off --output DP-7 --off --output DP-8 --off";

  home.stateVersion = "24.11"; # (dont change)

  programs.home-manager.enable = false;
}
