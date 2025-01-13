{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "gruvbox-wallpapers";
  version = "git";

  src = pkgs.fetchgit {
    url = "https://github.com/AngelJumbo/gruvbox-wallpapers.git";
    rev = "edb315e711791d2eca4e5873d583ba47325672e0";
    sha256 = "";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/etc/backgrounds
    cp -r $src/wallpapers/irl/* $out/etc/backgrounds/
  '';

  dontBuild = true;
  dontConfigure = true;

  meta = with pkgs.lib; {
    description = "Gruvbox-themed wallpapers for Linux desktops";
    homepage = "https://github.com/AngelJumbo/gruvbox-wallpapers";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ Dimkauzh ];
  };
}
