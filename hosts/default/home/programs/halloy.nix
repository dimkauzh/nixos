{ pkgs, ... }:

let
  settingsFormat = pkgs.formats.toml { };

  settings = {
    scale_factor = 0.8;
    servers.liberachat = {
      nickname = "dimkauzh";
      server = "irc.libera.chat";
      channels = [
        "#vuelto"
        "#sokora"
      ];
    };
  };

  settingsFile = settingsFormat.generate "config.toml" settings;

in
{
  home.file.".config/halloy/config.toml".source = settingsFile;
}
