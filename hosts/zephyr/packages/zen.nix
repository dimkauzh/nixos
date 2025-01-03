{ pkgs }:


####################################################################################################
# Zen Browser
# NOT USED ANYMORE, REPLACED BY https://github.com/0xc000022070/zen-browser-flake/
####################################################################################################

let
  version = "1.0.2-b.5";
  runtimeLibs = with pkgs; [
    libGL libGLU libevent libffi libjpeg libpng libstartup_notification libvpx libwebp
    stdenv.cc.cc fontconfig libxkbcommon zlib freetype
    gtk3 libxml2 dbus xcb-util-cursor alsa-lib libpulseaudio pango atk cairo gdk-pixbuf glib
	udev libva mesa libnotify cups pciutils
	ffmpeg libglvnd pipewire
  ] ++ (with pkgs.xorg; [
    libxcb libX11 libXcursor libXrandr libXi libXext libXcomposite libXdamage
	libXfixes libXScrnSaver
  ]);
in
pkgs.stdenv.mkDerivation {
  pname = "zen-browser";
  inherit version;

  src = pkgs.fetchurl {
    url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.bz2";
    sha256 = "1yz31q8ykm0myaji73j0q69s34gbf247l7yv81cgb0vgnw4d6z1b";
  };

	phases = [ "installPhase" "fixupPhase" ];

	desktopSrc = ./assets;

	nativeBuildInputs = [ pkgs.makeWrapper pkgs.copyDesktopItems pkgs.wrapGAppsHook ];

	installPhase = ''
    mkdir -p $out/bin
    tar -xjf $src --strip-components=1 -C $out/bin
	  install -D $desktopSrc/zen.desktop $out/share/applications/zen.desktop
	'';

	fixupPhase = ''
	  chmod 755 $out/bin/*
	  patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/bin/zen
	  wrapProgram $out/bin/zen --set LD_LIBRARY_PATH "${pkgs.lib.makeLibraryPath runtimeLibs}" \
                    --set MOZ_LEGACY_PROFILES 1 --set MOZ_ALLOW_DOWNGRADE 1 --set MOZ_APP_LAUNCHER zen --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH"
	  patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/bin/zen-bin
	  wrapProgram $out/bin/zen-bin --set LD_LIBRARY_PATH "${pkgs.lib.makeLibraryPath runtimeLibs}" \
                    --set MOZ_LEGACY_PROFILES 1 --set MOZ_ALLOW_DOWNGRADE 1 --set MOZ_APP_LAUNCHER zen --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH"
	  patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/bin/glxtest
	  wrapProgram $out/bin/glxtest --set LD_LIBRARY_PATH "${pkgs.lib.makeLibraryPath runtimeLibs}"
	  patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/bin/updater
	  wrapProgram $out/bin/updater --set LD_LIBRARY_PATH "${pkgs.lib.makeLibraryPath runtimeLibs}"
	  patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/bin/vaapitest
	  wrapProgram $out/bin/vaapitest --set LD_LIBRARY_PATH "${pkgs.lib.makeLibraryPath runtimeLibs}"
	'';

  meta = with pkgs.lib; {
    mainProgram = "zen";
    description = "Zen Browser";
    homepage = "https://github.com/zen-browser/desktop";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };
}
