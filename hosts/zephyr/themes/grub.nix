{ config, lib, pkgs, ... }:


{
  boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
    pname = "tartarus-grub-theme";
    version = "git";
    src = pkgs.fetchgit {
      url = "https://github.com/AllJavi/tartarus-grub";
      rev = "b116360a2a0991062a4d728cb005dfd309fbb82a";
      hash = "sha256-/Pzr0R3zzOXUi2pAl8Lvg6aHTiwXTIrxQ1vscbEK/kU=";
    };
    installPhase = ''
      mkdir -p $out
      cp -r tartarus/* $out
    '';
  };
}
