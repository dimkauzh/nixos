{ pkgs, ... }:

{
  home = {
    username = "dima";
    homeDirectory = "/home/dima";
  };

  home.file.".face" = {
    source = assets/icons/face.png;
  };

  home.activation.symlinkZen = pkgs.lib.mkAfter ''
    # Neovim config
    ${pkgs.git}/bin/git clone https://github.com/dimkauzh/nvim-config.git ~/.config/nvim
  '';
}
