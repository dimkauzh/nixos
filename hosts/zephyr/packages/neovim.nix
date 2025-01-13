{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "nvim-config";
  version = "git";

  src = pkgs.fetchgit {
    url = "https://github.com/dimkauzh/nvim-config.git";
    rev = "aa6e5ab4cdb165a1b967bfb070ae296278ae8027";
    sha256 = "sha256-KuKTR89WAfEEfAnmZr5Kmn0CQ4oVgRKi+Mny/xPdShU="; # Replace with the actual hash
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/nvim
    cp -r $src/* $out/nvim/
  '';

  dontBuild = true;
  dontConfigure = true;

  meta = with pkgs.lib; {
    description = "A Neovim configuration setup";
    homepage = "https://github.com/dimkauzh/nvim-config";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ Dimkauzh ];
  };
}
