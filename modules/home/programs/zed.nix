{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
    mutableUserSettings = false;

    extensions = [ "html" "toml" "git-firefly" "make" "lua" "nix" "ini" "discord-presence" "wakatime" ];

    userSettings = {
      agent_buffer_font_size = 14.0;
      agent_ui_font_size = 16.0;
      ui_font_size = 22.0;

      auto_update = false;
      load_direnv = "direct";
      restore_on_startup = "none";

      auto_complete = true;
      auto_complete_delay = 0;
      auto_complete_suggest = true;
      auto_complete_triggers = [ "." ":" " " "(" "[" "{" "="];

      tab_size = 2;
      soft_wrap = "preferred_line_length";
      preferred_line_length = 250;

      vim_mode = true;
      theme = "Gruvbox Dark";

      buffer_font_family = "ComicShannsMono Nerd Font";
      buffer_font_size = 18.0;

      agent.enabled = false;
      copilot.button = false;

      languages = {
        Markdown.show_edit_predictions = false;
        Python.show_edit_predictions = true;
        Go.show_edit_predictions = true;
      };

      ssh_connections = [
        {
          host = "dimapi.local";
          username = "dima";
          projects = [];
        }
      ];

      lsp = {
        clangd.initialization_options.clangd.format.ColumnLimit = 120;

        discord_presence.initialization_options = {
          base_icons_url = "https://raw.githubusercontent.com/xhyrom/zed-discord-presence/main/assets/icons/";

          details = "Project {workspace}";
          state = "Working on {filename}";

          large_image = "{base_icons_url}/{language}.png";
          large_text = "{language:u}";

          small_image = "{base_icons_url}/zed.png";
          small_text = "Zed";

          git_integration = true;

        };
      };
    };

    extraPackages = [ pkgs.nixd ];
  };
}
