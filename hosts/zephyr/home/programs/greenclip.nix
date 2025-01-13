{ ... }:

{
  home.file.".config/greenclip.toml".text = builtins.toTOML {
    greenclip = {
      enable_image_support = true;
      history_file = "$HOME/.cache/greenclip.history";
      image_cache_directory = "/tmp/greenclip";
      max_history_length = 200;
      max_selection_size_bytes = 0;
      trim_space_from_selection = true;
      use_primary_selection_as_input = false;
    };
  };
}
