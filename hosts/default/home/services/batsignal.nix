{ ... }:

{
  services.batsignal = {
    enable = false;
    extraArgs = [
      "-d 5"
      "-w 15"
      "-c 10"
    ];
  };
}
