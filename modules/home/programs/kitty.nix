{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "GruvboxMaterialDarkSoft";
    shellIntegration.enableZshIntegration = true;

    font = {
      name = "ComicShannsMono Nerd Font";
      size = 14;
      package = pkgs.nerd-fonts.comic-shanns-mono;
    };

    keybindings = {
      "ctrl+right" = "next_tab";
      "ctrl+left" = "previous_tab";
      "ctrl+shift+right" = "move_tab_forward";
      "ctrl+shift+left" = "move_tab_backward";

      "ctrl+t" = "new_tab_with_cwd";
      "ctrl+q" = "close_tab";
      "ctrl+w" = "close_tab";
      "ctrl+shift+q" = "close_os_window";
      "ctrl+shift+w" = "close_os_window";

      "ctrl+shift+t" = "set_tab_title";

      "ctrl+equal" = "change_font_size all +1.0";
      "ctrl+minus" = "change_font_size all -1.0";
    };

    settings = {
      cursor_shape = "beam";
      remember_window_size = true;
      initial_window_width = 720;
      initial_window_height = 330;
      tab_bar_edge = "top";
      tab_bar_style = "slant";

      foreground = "#d4be98";
      color7 = "#d4be98";
      color15 = "#ddc7a1";
    };
  };
}
