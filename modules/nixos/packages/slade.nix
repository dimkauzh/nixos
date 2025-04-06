{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "slade";
  version = "3.2.7";

  src = pkgs.fetchFromGitHub {
    owner = "sirjuddington";
    repo = "SLADE";
    rev = "3.2.7";
    hash = "sha256-+i506uzO2q/9k7en6CKs4ui9gjszrMOYwW+V9W5Lvns=";
  };

  nativeBuildInputs = [
    pkgs.cmake
    pkgs.pkg-config
    pkgs.which
    pkgs.zip
    pkgs.wrapGAppsHook3
  ];

  buildInputs = [
    pkgs.wxGTK32
    pkgs.gtk3
    pkgs.sfml_2
    pkgs.fluidsynth
    pkgs.curl
    pkgs.freeimage
    pkgs.ftgl
    pkgs.glew
    pkgs.lua
    pkgs.mpg123
  ];

  cmakeFlags = [
    "-DwxWidgets_LIBRARIES=${pkgs.wxGTK32}/lib"
    (pkgs.lib.cmakeFeature "CL_WX_CONFIG" (pkgs.lib.getExe' (pkgs.lib.getDev pkgs.wxGTK32) "wx-config"))
  ];

  env.NIX_CFLAGS_COMPILE = "-Wno-narrowing";

  preFixup = ''
    gappsWrapperArgs+=(
      --prefix GDK_BACKEND : x11
    )
  '';

  meta = {
    description = "Doom editor";
    homepage = "http://slade.mancubus.net/";
    license = pkgs.lib.licenses.gpl2Only; # https://github.com/sirjuddington/SLADE/issues/1754
    platforms = pkgs.lib.platforms.linux;
    maintainers = [ pkgs.lib.maintainers.abbradar ];
  };
}

