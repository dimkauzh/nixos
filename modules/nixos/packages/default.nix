{ inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
    inputs.nix-cachyos-kernel.overlays.pinned

    (final: prev: {
      gruvbox-wallpapers = import ./wallpapers.nix { pkgs = final; };
      v-analyzer = import ./v-analyzer.nix { pkgs = final; };
      xeventbind = import ./xeventbind.nix { pkgs = final; };
      mantablockscreen = import ./mantablockscreen.nix { pkgs = final; };
      tartarus = import ./tartarus.nix { pkgs = final; };
      trigger-unstable = import ./trigger-unstable.nix { pkgs = final; };
      extract-xiso = import ./extract-xiso.nix { pkgs = final; };

      fuckingnode = inputs.fuckingnode.packages."${final.system}".default;
      nvim-config = inputs.nvim-config.packages."${final.system}".default;
      winapps = inputs.winapps.packages."${final.system}".winapps;
      winapps-launcher = inputs.winapps.packages."${final.system}".winapps-launcher;

      flameshot = prev.flameshot.override { enableWlrSupport = true; };
      polybar = prev.polybar.override { pulseSupport = true; i3Support = true; };
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
