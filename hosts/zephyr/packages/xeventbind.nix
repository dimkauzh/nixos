{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "xeventbind";
  version = "git";
  src = pkgs.fetchgit {
    url = "https://github.com/ritave/xeventbind";
    rev = "9f67cb72691e5743acca78930856ba04c6c5790b";
    hash = "sha256-7AWreMOSfdeJ7FspZjJHzV81ID8Wj6XkkVCKdvxxv5E=";
  };
  buildInputs = [
    pkgs.gcc
    pkgs.gnumake
    pkgs.xorg.libX11
    pkgs.xorg.libXinerama
  ];
  installPhase = ''
    mkdir -p $out/bin
    cp xeventbind $out/bin/
  '';
}
