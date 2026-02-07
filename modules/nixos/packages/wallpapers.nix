{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "gruvbox-wallpapers";
  version = "git";

  src = pkgs.fetchgit {
    url = "https://github.com/AngelJumbo/gruvbox-wallpapers.git";
    rev = "edb315e711791d2eca4e5873d583ba47325672e0";
    sha256 = "sha256-HiaP9i3OmL4l3bRLaI7FKbx41rxJmQlx6kY4/5M/3SY=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/backgrounds/wallpapers/irl
    cp -r $src/wallpapers/* $out/backgrounds/wallpapers/
    cp ${../assets/gtklock/lockscreen.jpg} $out/backgrounds/wallpapers/irl/forest-3-blur-dark.jpg
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
