{ pkgs, ... }:

let
  gruvboxPlusIcons = import ../../packages/gruvbox-icons.nix { inherit pkgs; };
in
{
  services.dunst = {
    enable = true;

    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = gruvboxPlusIcons;
    };

    settings = {
      global = {
        monitor = 0;
        follow = "keyboard";
        origin = "top-right";
        offset = "(15, 40)";
        width = 320;
        height = "(50, 220)";
        indicate_hidden = true;
        transparency = 10;
        separator_height = 2;
        padding = 0;
        horizontal_padding = 8;
        frame_width = 2;
        separator_color = "auto";
        sort = true;
        font = "Noto Sans 12";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = true;
        show_indicators = false;
        icon_position = "left";
        default_icon = " ";
        min_icon_size = 16;
        max_icon_size = 96;
        enable_recursive_icon_lookup = true;
        sticky_history = false;
        history_length = 20;
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 14;
        progress_bar_corner_radius = 2;
        force_xinerama = false;
      };

      urgency_low = {
        background = "#32302f";
        foreground = "#a89984";
        frame_color = "#a9b665";
        timeout = 2;
      };

      urgency_normal = {
        background = "#32302f";
        foreground = "#a89984";
        frame_color = "#a9b665";
        timeout = 4;
      };

      urgency_critical = {
        background = "#32302f";
        foreground = "#a89984";
        frame_color = "#cc241d";
        timeout = 6;
      };
    };
  };
}
