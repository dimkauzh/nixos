{ ... }:

{
  users.groups.dialout.members = [ "dima" ];

  virtualisation = {
    podman.enable = true;
    docker.enable = true;
    spiceUSBRedirection.enable = true;
  };
}
