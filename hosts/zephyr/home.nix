{ config, pkgs, ... }:


{
  imports =
    [
      ./home/options.nix
    ];

  home = {
    username = "dima";
    homeDirectory = "/home/dima";
    stateVersion = "24.11"; # (dont change)
    sessionVariables = {
      EDITOR = "zeditor";
      BROWSER = "zen-browser";
    };

    activation.symlinkZen = pkgs.lib.mkAfter ''
        ln -sf ~/projects/nixos/hosts/zephyr/packages/assets/zen.desktop ~/.local/share/applications/zen.desktop
    '';
  };

  programs.home-manager.enable = false;
}
