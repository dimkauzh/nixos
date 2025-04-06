{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.dima = {
      isNormalUser = true;
      description = "Dima";
      extraGroups = [ "wheel" "libvirtd" ];
    };
  };

  nix.settings.trusted-users = [ "root" "dima" ];
}
