{ inputs, ... }:

{
  imports =
    [
      ./programs
      ./services
      ./settings
    ];

  nixpkgs.overlays = [
    inputs.niri.overlays.niri
    (final: prev: {
      gruvbox-wallpapers = import packages/wallpapers.nix { pkgs = final; };
      v-analyzer = import packages/v-analyzer.nix { pkgs = final; };
      xeventbind = import packages/xeventbind.nix { pkgs = final; };
      mantablockscreen = import packages/mantablockscreen.nix { pkgs = final; };
      tartarus = import packages/tartarus.nix { pkgs = final; };

      zen-browser = inputs.zen-browser.packages."${final.system}".default;
      fuckingnode = inputs.fuckingnode.packages."${final.system}".default;
      nvim-config = inputs.nvim-config.packages."${final.system}".default;

      flameshot = prev.flameshot.override { enableWlrSupport = true; };
      xwayland-satellite = prev.xwayland-satellite.override { withSystemd = true; };
    })
  ];
}
