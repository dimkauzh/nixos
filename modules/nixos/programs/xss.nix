{ pkgs, ... }:

{
  programs.xss-lock = {
    enable = false;
    lockerCommand = "${pkgs.mantablockscreen}/bin/mantablockscreen -sc";
    extraOptions = [
      "--transfer-sleep-lock"
    ];
  };
}
