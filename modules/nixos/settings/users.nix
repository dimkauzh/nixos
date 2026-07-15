{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.dima = {
      isNormalUser = true;
      description = "Dima";
      extraGroups = [
        "ydotool"
        "wheel"
        "docker"
      ];
    };
  };

  nix.settings.trusted-users = [
    "root"
    "dima"
  ];
}
