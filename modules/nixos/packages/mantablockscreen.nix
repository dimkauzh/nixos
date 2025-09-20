{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "mantablockscreen";
  version = "git";

  src = pkgs.fetchgit {
    url = "https://github.com/reorr/mantablockscreen";
    rev = "d6a853ab9b54d182450257a705c88a770cbdd821";
    sha256 = "Ryru+wf7i1VGGEpEI1cceT+LKq+SVWNDw5wUxrGQG8o=";
  };

  buildInputs = [
    pkgs.imagemagick
    pkgs.i3lock-color
    pkgs.picom
    pkgs.xorg.xrandr
    pkgs.dbus
  ];

  nativeBuildInputs = [ pkgs.makeWrapper ];

  preBuild = ''
    sed -i 's|/usr/local|$out|g' Makefile
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp mantablockscreen $out/bin/mantablockscreen
    chmod +x $out/bin/mantablockscreen
    wrapProgram $out/bin/mantablockscreen \
      --prefix PATH : "${pkgs.imagemagick}/bin:${pkgs.xorg.xrandr}/bin:${pkgs.dbus}/bin:${pkgs.i3lock-color}/bin"
  '';

  meta = with pkgs.lib; {
    mainProgram = "mantablockscreen";
    description = "A lockscreen script based on i3lock-color";
    homepage = "https://github.com/reorr/mantablockscreen";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ dimkauzh ];
    platforms = platforms.linux;
  };
}
