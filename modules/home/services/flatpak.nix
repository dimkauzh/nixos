{ pkgs, config, ... }:


{
  services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;
    update.onActivation = true;

    packages = [
      # FlatHub
      "eu.vcmi.VCMI"
      "app.drey.Elastic"
      "dev.tchx84.Gameeky"
      "com.vixalien.sticky"
      "org.vinegarhq.Sober"
      "io.github.jonmagon.kdiskmark"

      # Flatpak files
      rec {
        bundle = "${pkgs.fetchurl {
          url = "https://github.com/exelix11/SysDVR/releases/download/v6.2.1/SysDVR-Client-Linux-x64.flatpak";
          sha256 = sha256;
        }}";
        appId = "com.github.exelix11.sysdvr";
        sha256 = "08zpk2hz6fwkrl13fmv4mwr5szidjqsmvcfv1wm25i2na4g8pmqj";
      }
    ];

    overrides = {
      global = {
        Context.filesystems = ["${config.home.homeDirectory}/.themes/${config.gtk.theme.name}:ro"];
        Environment.GTK_THEME = config.gtk.theme.name;
      };
    };
  };
}
