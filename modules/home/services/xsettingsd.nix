{ ... }:

{
  services.xsettingsd = {
    enable = true;

    settings = {
      "Net/ThemeName" = "Gruvbox-Dark";
      "Net/IconThemeName" = "Gruvbox-Plus-Dark";
      "Gtk/CursorThemeName" = "capitaine-cursors";
      "Gtk/CursorThemeSize" = "30";
      "Gtk/FontName" = "Noto Sans 10";
    };
  };
}
