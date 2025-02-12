{ ... }:

{
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    libinput.enable = true;
    openssh.enable = true;

    acpid.enable = true;
    fwupd.enable = true;
  };
}
