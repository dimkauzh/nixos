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

      # Custom
      { flatpakref = "https://sober.vinegarhq.org/sober.flatpakref"; sha256="1pj8y1xhiwgbnhrr3yr3ybpfis9slrl73i0b1lc9q89vhip6ym2l"; }
    ];

    overrides = {
      global.Environment = {
        GTK_THEME = "Gruvbox-Dark";
      };
    };
  };
}
