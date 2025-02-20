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
    if [ ! -d "$HOME/.config/nvim/.git" ]; then
        echo "Cloning Neovim config..."
        ${pkgs.git}/bin/git clone https://github.com/dimkauzh/nvim-config.git "$HOME/.config/nvim"
      else
        echo "Neovim config already exists. Pulling latest changes..."
        ${pkgs.git}/bin/git -C "$HOME/.config/nvim" pull
      fi
  '';
}
