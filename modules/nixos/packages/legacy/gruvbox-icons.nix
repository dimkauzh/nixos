{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "gruvbox-plus-icons";
  version = "git";

  src = pkgs.fetchgit {
    url = "https://github.com/SylEleuth/gruvbox-plus-icon-pack.git";
    rev = "e00bebc4366116d5d5d6ef1cbc33b0ace354141c";
    sha256 = "sha256-/OwBOsC5GuRCt7aLMldOCMHaabOv5uqgrCLrxspaKxk=";
  };

  nativeBuildInputs = [ pkgs.gtk3 ];

  propagatedBuildInputs = [ pkgs.plasma5Packages.breeze-icons pkgs.gnome-icon-theme pkgs.hicolor-icon-theme ];

 	phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r $src/* $out/share/icons/

    # gtk-update-icon-cache $out/share/icons/Gruvbox-Plus-Dark
  '';

  dontDropIconThemeCache = true;
  dontBuild = true;
  dontConfigure = true;

  meta = with pkgs.lib; {
    description = "Icon pack for Linux desktops based on the Gruvbox color scheme";
    homepage = "https://github.com/SylEleuth/gruvbox-plus-icon-pack";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
    maintainers = with maintainers; [ Dimkauzh ];
  };
}
