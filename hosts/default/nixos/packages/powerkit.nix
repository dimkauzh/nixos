{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "powerkit";
  version = "git";

  src = pkgs.fetchgit {
    url = "https://github.com/rodlie/powerkit";
    rev = "f179578cfffc433b13cdb204cb27af9b6e35449b";
    sha256 = "05dpp2q0yz39g9vjjhz8f5p1ygg175nyql8cqnyzj8nzyc7v6q7k";
  };

  nativeBuildInputs = [
    pkgs.cmake
    pkgs.libsForQt5.qt5.qtbase
    pkgs.libsForQt5.qt5.wrapQtAppsHook
  ];

  buildInputs = [
    pkgs.libsForQt5.qt5.qtbase
    pkgs.xorg.libX11
    pkgs.xorg.libXrandr
    pkgs.xorg.libXext
    pkgs.xorg.libXScrnSaver
    pkgs.libutempter
    pkgs.upower
  ];

  buildPhase = ''
    cmake -DCMAKE_INSTALL_PREFIX=$out -DCMAKE_BUILD_TYPE=Release .
    make
  '';

  installPhase = ''
    mkdir -p $out
    mkdir $out/bin
    cp powerkit $out/bin/powerkit
    chmod +x $out/bin/powerkit
  '';

  meta = with pkgs.lib; {
    description = "A lightweight power manager for Linux";
    homepage = "https://github.com/rodlie/powerkit";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };
}
