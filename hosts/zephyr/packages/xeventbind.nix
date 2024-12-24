{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "xeventbind";
  version = "git";
  src = pkgs.fetchgit {
    url = "https://github.com/ritave/xeventbind";
    rev = "9f67cb72691e5743acca78930856ba04c6c5790b";
    hash = "sha256-9uNp3HE+7g5MZ8i9/+43JDQK0KUTcH1+OrPGeM7+rgE=";
  };
  buildInputs = [ pkgs.gcc pkgs.make ];
  installPhase = ''
    mkdir -p $out/bin
    cp xeventbind $out/bin/
  '';
}
