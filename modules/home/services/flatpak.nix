{ ... }:


{
  services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;
    update.onActivation = true;

    packages = [
      # FlatHub
      "app.drey.Elastic"
      "dev.tchx84.Gameeky"
      "org.vinegarhq.Sober"
    ];

    overrides = {
      global.Environment = {
        GTK_THEME = "Gruvbox-Dark";
      };
    };
  };
}
