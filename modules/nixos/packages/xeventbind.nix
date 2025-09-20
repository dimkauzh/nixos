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

   meta = with pkgs.lib; {
    mainProgram = "xeventbind";
    description = "A small utillity that runs your script on X11 events";
    homepage = "https://github.com/ritave/xeventbind";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ dimkauzh ];
    platforms = platforms.linux;
  }; 
}
