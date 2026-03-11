{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "extract-xiso";
  version = "202505152050";

  src = pkgs.fetchzip {
    url = "https://github.com/XboxDev/extract-xiso/releases/download/build-202505152050/extract-xiso_Linux.zip";
    hash = "sha256-c9GRsI5C/dc/d47/OpwqAgWg6DsscQmG8l+Wx2gHQhM=";
    stripRoot = false;
  };

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/bin
    cp extract-xiso $out/bin/
    chmod +x $out/bin/extract-xiso
  '';

  meta = with pkgs.lib; {
    mainProgram = "extract-xiso";
    description = "Xbox ISO Creation/Extraction utility.";  
    homepage = "https://github.com/XboxDev/extract-xiso";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ dimkauzh ];
    platforms = platforms.linux;
  };
}

