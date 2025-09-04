{ pkgs, ... }:

{
  programs.xss-lock = {
    enable = true;
    lockerCommand = "${pkgs.mantablockscreen}/bin/mantablockscreen -sc";
    extraOptions = [
      "--transfer-sleep-lock"
    ];
  };
}
