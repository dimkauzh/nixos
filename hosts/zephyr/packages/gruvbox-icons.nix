{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "gruvbox-plus-icons";
  version = "git";

  src = pkgs.fetchgit {
    url = "https://github.com/SylEleuth/gruvbox-plus-icon-pack.git";
    rev = "766a007b548c65fe538b2fb9b9e4965d6ca55c4a";
    sha256 = "sha256-KBSmzXEUtVNrBeYL0fNjQ9G2PVzLD35WJA6jQCkNMxc=";
  };

  nativeBuildInputs = [ pkgs.gtk3 ];

  propagatedBuildInputs = [ pkgs.plasma5Packages.breeze-icons pkgs.gnome-icon-theme pkgs.hicolor-icon-theme ];

 	phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/* $out/share/icons/

    gtk-update-icon-cache $out/share/icons/Gruvbox-Plus-Dark
  '';

  dontDropIconThemeCache = true;
  dontBuild = true;
  dontConfigure = true;

  meta = with pkgs.lib; {
    description = "Icon pack for Linux desktops based on the Gruvbox color scheme";
    homepage = "https://github.com/SylEleuth/gruvbox-plus-icon-pack";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
    maintainers = with maintainers; [ eureka-cpu RGBCube ];
  };
}
