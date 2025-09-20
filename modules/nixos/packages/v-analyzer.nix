{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "v-analyzer";
  version = "0.0.6";

  src = pkgs.fetchzip {
    url = "https://github.com/vlang/v-analyzer/releases/download/0.0.6/v-analyzer-linux-x86_64.zip";
    hash = "sha256-8tut1fz0qrn1dt9vZl+OfY7yjXKXW/olqQbI+bU1l9I=";
    stripRoot = false;
  };

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/bin
    cp v-analyzer $out/bin/
    chmod +x $out/bin/v-analyzer
  '';

  meta = with pkgs.lib; {
    mainProgram = "v-analyzer";
    description = "The vlang language server, for all your editing needs like go-to-definition, code completion, type hints, and more";  
    homepage = "https://github.com/vlang/v-analyzer";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ dimkauzh ];
    platforms = platforms.linux;
  };
}

