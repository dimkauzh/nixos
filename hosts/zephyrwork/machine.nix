{
  lib,
  system_version,
  unstable,
  ...
}:

{
  imports = [
    ./boot.nix
    ./packages.nix
    ./hardware/hardware.nix
  ];

  security.pam.services.ly.fprintAuth = false;
  security.pam.services.login.fprintAuth = true;

  networking = {
    hostName = lib.mkForce "zephyrwork";
    networkmanager.wifi.powersave = false;
  };

  services = {
    teamviewer = {
      enable = true;
      package = unstable.teamviewer;
    };

    power-profiles-daemon.enable = lib.mkForce false;

    fprintd = {
      enable = true;
      tod.enable = false;
    };
  };

  # ONLY MODIFY ON RELEASE
  system.stateVersion = system_version;
}
