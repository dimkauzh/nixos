{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "mantablockscreen";
  version = "git";
  src = pkgs.fetchgit {
    url = "https://github.com/reorr/mantablockscreen";
    rev = "2e1dfcc6d764345bf6c9a0b1c119c4a18d9901b6"; # Replace with the latest commit hash if necessary
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Replace with the actual hash
  };
  buildInputs = [ pkgs.makeWrapper pkgs.imagemagick pkgs.i3lock-color ];
  installPhase = ''
    mkdir -p $out/bin
    cp mantablockscreen $out/bin
    chmod +x $out/bin/mantablockscreen
  '';
}
