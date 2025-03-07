{ pkgs, config, ... }:

let
  settingsFormat = pkgs.formats.toml { };

  greenclipSettings = {
    greenclip = {
      blacklisted_applications = [];
      enable_image_support = true;
      history_file = "${config.home.homeDirectory}/.cache/greenclip.history";
      image_cache_directory = "/tmp/greenclip";
      max_history_length = 200;
      max_selection_size_bytes = 0;
      static_history = [];
      trim_space_from_selection = true;
      use_primary_selection_as_input = false;
    };
  };

  greenclipSettingsFile = settingsFormat.generate "greenclip.toml" greenclipSettings;

in
{
  home.file.".config/greenclip.toml".source = greenclipSettingsFile;
}
