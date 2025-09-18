{ ... }:

{
  networking = {
    dhcpcd.enable = true;
    networkmanager.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    # settings = {
    #   General = {
    #     Enable = "Source,Sink,Media,Socket";
    #   };
    # };
  };
  
  services = {
    blueman.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        domain = true;
        hinfo = true;
        userServices = true;
        workstation = true;
      };
    };

    pipewire = {
      enable = true;
      pulse.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      wireplumber = {
        enable = true;
        # extraConfig.bluetoothEnhancements = {
        #   "monitor.bluez.properties" = {
        #     "bluez5.enable-sbc-xq" = true;
        #     "bluez5.enable-msbc" = true;
        #     "bluez5.enable-hw-volume" = true;
        #     "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
        #     "bluez5.codecs" = [ "ldac" "aptx" "aptx_hd" "aac" "sbc" ];
        #   };
        # };
      };
    };
  };
}
