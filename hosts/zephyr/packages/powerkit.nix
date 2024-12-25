{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "powerkit";
  version = "git";

  src = pkgs.fetchgit {
    url = "https://github.com/rodlie/powerkit";
    rev = "f179578cfffc433b13cdb204cb27af9b6e35449b"; # Replace with desired commit hash
    sha256 = "sha256-placeholder"; # Replace this with the correct sha256
  };

  nativeBuildInputs = [
    pkgs.cmake
    pkgs.libsForQt5.qt5.qtbase
  ];

  buildInputs = [
    pkgs.libsForQt5.qt5.qtbase
    pkgs.xorg.libx11
    pkgs.xorg.libxrandr
    pkgs.xorg.libXext
    pkgs.libutempter
    pkgs.upower
  ];

  cmakeFlags = [
    "-DUSE_QT5=ON"
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  # preBuild = ''
  #   sed -i 's|/usr/local|$out|g' CMakeLists.txt
  # '';

  buildPhase = ''
    mkdir -p build
    cd build
    cmake .. ${cmakeFlags}
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp build/powerkit $out/bin/powerkit
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
