{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "nvim-config";
  version = "git";

  src = pkgs.fetchgit {
    url = "https://github.com/dimkauzh/nvim-config.git";
    rev = "0b74d82ee33aea0dd7bdcd802da17511e7201eeb";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Replace with the actual hash
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
