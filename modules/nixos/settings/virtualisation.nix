{ ... }:

{
  programs.virt-manager.enable = true;
  services.spice-vdagentd.enable = true;

  users.groups.libvirtd.members = [ "dima" ];
  users.groups.dialout.members = [ "dima" ];

  virtualisation = {
    waydroid.enable = true;
    podman.enable = true;
    docker.enable = true;
    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
      };
    };
  };
}
