{ pkgs, ... }:

let
  settingsFormat = pkgs.formats.toml { };

  settings = {
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
