{ pkgs, ... }:

{
  programs.xss-lock = {
    enable = true;
    lockerCommand = "${pkgs.lightdm}/bin/dm-tool switch-to-greeter";
    extraOptions = [
      "--transfer-sleep-lock"
    ];
  };
}
