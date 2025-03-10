{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "nvim-config";
  version = "git";

  src = pkgs.fetchgit {
    url = "https://github.com/dimkauzh/nvim-config.git";
    rev = "62d0ee48e2f1c869435c5c908478c4745780510c";
    sha256 = "sha256-KuKTR89WAfEEfAnmZr5Kmn0CQ4oVgRKi+Mny/xPdShU=";
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
