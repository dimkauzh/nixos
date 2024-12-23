{ config, lib, pkgs, ... }:


{
  boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
    pname = "tartarus-grub-theme";
    version = "git";
    src = pkgs.fetchFromGitHub {
      owner = "AllJavi";
      repo = "tartarus-grub";
      rev = "main";
    };
    installPhase = ''
      mkdir -p $out
      cp -r tartarus $out
    '';
  };

}
