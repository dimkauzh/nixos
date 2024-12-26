{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "zen-browser";
  version = "1.0.2-b.5";

  src = pkgs.fetchurl {
    url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.bz2";
    sha256 = "sha256:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"'
  };

  nativeBuildInputs = [ pkgs.makeWrapper ];

  runtimeLibs = with pkgs; [
    libGL libGLU fontconfig libxkbcommon gtk3 libxml2 pango cairo glib
    alsa-lib libpulseaudio libnotify udev mesa
  ] ++ (with pkgs.xorg; [
    libX11 libXcursor libXrandr libXi libXext libXcomposite libXdamage libXfixes libXScrnSaver
  ]);

  installPhase = ''
    mkdir -p $out/bin $out/share/applications $out/share/icons/hicolor/128x128/apps

    cp -r * $out/bin
    install -Dm644 ./zen.desktop $out/share/applications/zen.desktop
    install -Dm644 ./browser/chrome/icons/default/default128.png $out/share/icons/hicolor/128x128/apps/zen.png
  '';

  fixupPhase = ''
    wrapProgram $out/bin/zen --set LD_LIBRARY_PATH "${pkgs.lib.makeLibraryPath runtimeLibs}" \
      --set MOZ_LEGACY_PROFILES 1 --set MOZ_ALLOW_DOWNGRADE 1 --set MOZ_APP_LAUNCHER zen
  '';

  meta = with pkgs.lib; {
    description = "Zen Browser";
    homepage = "https://github.com/zen-browser/desktop";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };
}
