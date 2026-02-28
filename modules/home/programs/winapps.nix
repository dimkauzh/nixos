{ pkgs, lib, ... }:

let
  yamlFormat = pkgs.formats.yaml { };
 
  iniSettings = {
    RDP_USER = "Dima";
    RDP_PASS = "HelloThere!";
    RDP_ASKPASS = "";
    RDP_DOMAIN = "";
    RDP_IP = "127.0.0.1";
    VM_NAME = "RDPWindows";
    WAFLAVOR = "docker";
    RDP_SCALE = "100";
    REMOVABLE_MEDIA = "/run/media";
    RDP_FLAGS = "/cert:tofu";
    RDP_FLAGS_NON_WINDOWS = "";
    RDP_FLAGS_WINDOWS = "";
    DEBUG = "true";
    AUTOPAUSE = "off";
    AUTOPAUSE_TIME = "300";
    FREERDP_COMMAND = "";
    PORT_TIMEOUT = "5";
    RDP_TIMEOUT = "30";
    APP_SCAN_TIMEOUT = "60";
    BOOT_TIMEOUT = "120";
    HIDEF = "on";
  };

  myConfig = {
    name = "winapps";
  
    volumes.data = { };

    services.windows = {
      image = "ghcr.io/dockur/windows:latest";
      container_name = "WinApps";
      cap_add = [ "NET_ADMIN" ];
      stop_grace_period = "120s";
      restart = "on-failure";


      environment = {
        VERSION = "10l";
        RAM_SIZE = "8GB";
        CPU_CORES = "4";
        DISK_SIZE = "64G";

        USERNAME = "Dima";
        PASSWORD = "HelloThere!";
        HOME = "\${HOME}";
      };

      ports = [
        "8006:8006"      # VNC Web Interface
        "3389:3389/tcp"  # RDP TCP
        "3389:3389/udp"  # RDP UDP
      ];

      volumes = [
        "data:/storage"
        "\${HOME}:/shared" 
        "./oem:/oem"
      ];
      devices = [
        "/dev/kvm"
        "/dev/net/tun"
      ];
    };
  };
in
{
  home.file.".config/winapps/winapps.conf".text = lib.generators.toKeyValue { } iniSettings;
  home.file.".config/winapps/compose.yaml".source = yamlFormat.generate "winapps-compose.yaml" myConfig;
}
