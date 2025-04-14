{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "odin";
  version = "dev-2025-04";

  src = pkgs.fetchFromGitHub {
    owner = "odin-lang";
    repo = "Odin";
    rev = "dev-2025-04";
    hash = "sha256-dVC7MgaNdgKy3X9OE5ZcNCPnuDwqXszX9iAoUglfz2k=";
  };

  LLVM_CONFIG = "${pkgs.llvmPackages.llvm.dev}/bin/llvm-config";

  dontConfigure = true;


  buildPhase = ''
    bash ./build_odin.sh release
  '';

  nativeBuildInputs = with pkgs; [
    makeBinaryWrapper
    which
    clang
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp odin $out/bin/odin

    mkdir -p $out/share
    cp -r {base,core,vendor,shared} $out/share

    wrapProgram $out/bin/odin \
      --prefix PATH : ${
        pkgs.lib.makeBinPath (
          with pkgs.llvmPackages; [
            bintools
            llvm
            clang
            lld
          ]
        )
      } \
      --set-default ODIN_ROOT $out/share

    make -C "$out/share/vendor/cgltf/src/"
    make -C "$out/share/vendor/stb/src/"
    make -C "$out/share/vendor/miniaudio/src/"

    runHook postInstall
  '';

  passthru.updateScript = pkgs.nix-update-script { };

  meta = with pkgs.lib; {
    description = "Fast, concise, readable, pragmatic and open sourced programming language";
    homepage = "https://odin-lang.org/";
    downloadPage = "https://github.com/odin-lang/Odin";
    license = licenses.bsd3;
    mainProgram = "odin";
    maintainers = with maintainers; [ astavie ];
    platforms = platforms.linux;
  };
}

