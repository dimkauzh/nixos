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

      # Flatpak files
      {
        bundle="https://github.com/Steve-Tech/YAFI/releases/download/0.3/au.stevetech.yafi.flatpak";
        appId="au.stevetech.yafi.flatpak";
        sha256="1xywyfvw4mbzdgj5w69hvx6737hc3ipkqbqkhzsb03vwpfjddbr1";
      }
    ];

    overrides = {
      global.Environment = {
        GTK_THEME = "Gruvbox-Dark";
      };
    };
  };
}
