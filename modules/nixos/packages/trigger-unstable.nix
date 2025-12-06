{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "trigger-rally";
  version = "0.6.7";

  src = pkgs.fetchsvn {
    url = "https://svn.code.sf.net/p/trigger-rally/code/";
    rev = 1019;
    sha256 = "sha256-YTUEX9mAiIm/MY3tbSrh3KyM9TK+Xir7VM5VHh1SgZo=";
  };

  nativeBuildInputs = [ pkgs.copyDesktopItems pkgs.makeWrapper ];

  buildInputs = with pkgs; [
    SDL2
    freealut
    SDL2_image
    openal
    physfs
    zlib
    libGLU
    libGL
    glew
    tinyxml-2
  ];

  preConfigure = ''
    sed s,/usr/local,$out, -i bin/*defs

    mkdir -p $out/data
    cp -r data/* $out/data

    cd src

    substituteInPlace GNUmakefile \
    --replace "prefix          ?= /usr/local" "prefix          ?= $out" \
    --replace "exec_prefix     ?= \$(prefix)" "exec_prefix     ?= \$(prefix)/bin" \
    --replace "bindir          := \$(exec_prefix)/games" "bindir          := \$(prefix)/bin" \
    --replace "datarootdir     := \$(prefix)/share" "datarootdir     := \$(prefix)/data" \
    --replace "datadir         := \$(datarootdir)/games" "datadir         := \$(datarootdir)/" \
    --replace "docdir          := \$(datarootdir)/doc/\$(DISTNAME)" "docdir          := \$(datarootdir)/doc/\$(DISTNAME)"

    sed -i 's#/usr/share/#$(prefix)/share/#' GNUmakefile
    mkdir -p $out/share/applications
    mkdir -p $out/share/metainfo

    sed s,lSDL2main,lSDL2, -i GNUmakefile
    export NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE -I${pkgs.lib.getInclude pkgs.SDL2}/include/SDL2"
  '';

  makeFlags = [
    "prefix=${placeholder "out"}"
  ];

  fixupPhase = ''
    sed -i "s|<datadirectory>|<datadirectory>\n\t\t<data path=\"$out/data\" />|" \
      $out/bin/trigger-rally.config.defs
  '';

  enableParallelBuilding = true;

  meta = {
    description = "Fast-paced single-player racing game";
    mainProgram = "trigger-rally";
    homepage = "http://trigger-rally.sourceforge.net/";
    license = pkgs.lib.licenses.gpl2Plus;
    maintainers = [ ];
    platforms = with pkgs.lib.platforms; linux;
  };
}
