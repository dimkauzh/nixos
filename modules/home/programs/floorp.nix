{ ... }:
{
  programs.floorp-bin = {
    enable = true;
    natsumi = {
      enable = true;
      profiles = [ "default" ];
    };
  };
}
