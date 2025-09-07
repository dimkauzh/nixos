{ inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
    (final: prev: {
      gruvbox-wallpapers = import ./wallpapers.nix { pkgs = final; };
      v-analyzer = import ./v-analyzer.nix { pkgs = final; };
      xeventbind = import ./xeventbind.nix { pkgs = final; };
      mantablockscreen = import ./mantablockscreen.nix { pkgs = final; };
      tartarus = import ./tartarus.nix { pkgs = final; };

      zen-browser = inputs.zen-browser.packages."${final.system}".default;
      fuckingnode = inputs.fuckingnode.packages."${final.system}".default;
      nvim-config = inputs.nvim-config.packages."${final.system}".default;

      flameshot = prev.flameshot.override { enableWlrSupport = true; };
      xwayland-satellite = prev.xwayland-satellite.override { withSystemd = true; };
      elegant-sddm = prev.elegant-sddm.override {
        themeConfig.General = {
           background = "${./assets/sddm-background.png}";
        };
      };
      rofi-power-menu = prev.rofi-power-menu.overrideAttrs (oldAttrs: {
        patches = oldAttrs.patches or [] ++ [ ./assets/rofi-power-menu.patch ];
      });
    })
  ];
}
