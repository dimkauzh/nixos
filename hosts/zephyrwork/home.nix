{ pkgs, ... }:


{
  imports =
    [
      ./overwrites.nix
      ../../modules/home/dima.nix
      ../../modules/home/modules.nix
    ];

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "zen";
    };

    file = {
      "games/0ad/run.sh" = {
        enable = true;
        text = ''
          #!/bin/bash
          ${pkgs.zeroad}/bin/0ad
        '';
        executable = true;
      };

      "games/doom/run.sh" = {
        enable = true;
        text = ''
          #!/bin/bash
          ${pkgs.gzdoom}/bin/gzdoom
        '';
        executable = true;
      };

      "games/quake3/run.sh" = {
        enable = true;
        text = ''
          #!/bin/bash
          ${pkgs.ioquake3}/bin/ioquake3
        '';
        executable = true;
      };
    };

    stateVersion = "24.11"; # (dont change)
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  programs.home-manager.enable = false;
}
